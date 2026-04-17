/**
 * Suggestion commands functionality for slash commands
 * Reads commands directly from session metadata storage
 */

import Fuse from 'fuse.js';
import { storage } from './storage';
import { buildSlashCommandRegistry, SlashCommandRegistryEntry } from './slashCommandRegistry';

export type CommandItem = SlashCommandRegistryEntry;

interface SearchOptions {
    limit?: number;
    threshold?: number;
}

function matchPriority(command: CommandItem, query: string): number {
    const normalizedQuery = query.trim().toLowerCase();
    if (!normalizedQuery) return 0;

    const commandName = command.command.toLowerCase();
    const label = command.label.toLowerCase();
    const description = command.description?.toLowerCase() ?? '';
    const argumentHint = command.argumentHint?.toLowerCase() ?? '';

    if (commandName === normalizedQuery) return 0;
    if (commandName.startsWith(normalizedQuery)) return 1;
    if (label.startsWith(normalizedQuery)) return 2;
    if (description.includes(normalizedQuery) || argumentHint.includes(normalizedQuery)) return 3;
    return 4;
}

// Get commands from session metadata
function getCommandsFromSession(sessionId: string): CommandItem[] {
    const state = storage.getState();
    const session = state.sessions[sessionId];

    return buildSlashCommandRegistry(session?.metadata?.slashCommands ?? []);
}

// Main export: search commands with fuzzy matching
export async function searchCommands(
    sessionId: string,
    query: string,
    options: SearchOptions = {}
): Promise<CommandItem[]> {
    const { limit = 10, threshold = 0.3 } = options;
    
    // Get commands from session metadata (no caching)
    const commands = getCommandsFromSession(sessionId);
    
    // If query is empty, return all commands
    if (!query || query.trim().length === 0) {
        return commands.slice(0, limit);
    }
    
    // Setup Fuse for fuzzy search
    const fuseOptions = {
        keys: [
            { name: 'command', weight: 0.55 },
            { name: 'label', weight: 0.25 },
            { name: 'description', weight: 0.1 },
            { name: 'argumentHint', weight: 0.1 }
        ],
        threshold,
        includeScore: true,
        shouldSort: true,
        minMatchCharLength: 1,
        ignoreLocation: true,
        useExtendedSearch: true
    };
    
    const fuse = new Fuse(commands, fuseOptions);
    const results = fuse.search(query, { limit });
    
    return results
        .sort((a, b) => {
            const priorityDiff = matchPriority(a.item, query) - matchPriority(b.item, query);
            if (priorityDiff !== 0) return priorityDiff;
            return (a.score ?? 0) - (b.score ?? 0);
        })
        .map(result => result.item);
}

// Get all available commands for a session
export function getAllCommands(sessionId: string): CommandItem[] {
    return getCommandsFromSession(sessionId);
}
