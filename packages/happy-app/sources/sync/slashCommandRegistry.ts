export interface SlashCommandRegistryEntry {
    command: string;
    label: string;
    description?: string;
    argumentHint?: string;
    insertText?: string;
    insertSelectionText?: string;
    source: 'builtin' | 'session-metadata';
}

export interface SlashCommandInsertion {
    text: string;
    addSpace: boolean;
    selectionText?: string;
}

export const IGNORED_COMMANDS = [
    "add-dir",
    "agents",
    "config",
    "statusline",
    "bashes",
    "settings",
    "cost",
    "doctor",
    "exit",
    "help",
    "ide",
    "init",
    "install-github-app",
    "mcp",
    "memory",
    "migrate-installer",
    "model",
    "pr-comments",
    "release-notes",
    "resume",
    "status",
    "bug",
    "review",
    "security-review",
    "terminal-setup",
    "upgrade",
    "vim",
    "permissions",
    "hooks",
    "export",
    "logout",
    "login"
];

const DEFAULT_COMMANDS = ['compact', 'clear'] as const;

const REGISTRY_DETAILS: Record<string, Omit<SlashCommandRegistryEntry, 'command' | 'source'>> = {
    compact: {
        label: 'Compact Conversation',
        description: 'Compact the conversation history',
        insertText: '/compact',
    },
    clear: {
        label: 'Clear Conversation',
        description: 'Clear the conversation',
        insertText: '/clear',
    },
    reset: {
        label: 'Reset Session',
        description: 'Reset the session',
        insertText: '/reset',
    },
    debug: {
        label: 'Debug Session',
        description: 'Show debug information',
        argumentHint: '[topic]',
        insertText: '/debug [topic]',
        insertSelectionText: '[topic]',
    },
    stop: {
        label: 'Stop Current Operation',
        description: 'Stop the current operation',
        insertText: '/stop',
    },
    abort: {
        label: 'Abort Current Operation',
        description: 'Abort the current operation',
        insertText: '/abort',
    },
    cancel: {
        label: 'Cancel Current Operation',
        description: 'Cancel the current operation',
        insertText: '/cancel',
    },
};

function titleCaseCommand(command: string): string {
    return command
        .split(/[-_]/g)
        .filter(Boolean)
        .map((segment) => segment.charAt(0).toUpperCase() + segment.slice(1))
        .join(' ');
}

export function getSlashCommandInsertion(entry: SlashCommandRegistryEntry): SlashCommandInsertion {
    return {
        text: entry.insertText ?? `/${entry.command}`,
        addSpace: !entry.insertSelectionText,
        selectionText: entry.insertSelectionText,
    };
}

export function normalizeSlashCommandName(command: string): string | null {
    const normalized = command.trim().replace(/^\//, '').toLowerCase();
    return normalized.length > 0 ? normalized : null;
}

function buildRegistryEntry(
    command: string,
    source: SlashCommandRegistryEntry['source'],
): SlashCommandRegistryEntry {
    const details = REGISTRY_DETAILS[command];

    return {
        command,
        label: details?.label ?? titleCaseCommand(command),
        description: details?.description,
        argumentHint: details?.argumentHint,
        insertText: details?.insertText ?? `/${command}`,
        insertSelectionText: details?.insertSelectionText,
        source,
    };
}

export function buildSlashCommandRegistry(commands: string[] = []): SlashCommandRegistryEntry[] {
    const entries = new Map<string, SlashCommandRegistryEntry>();

    for (const command of DEFAULT_COMMANDS) {
        entries.set(command, buildRegistryEntry(command, 'builtin'));
    }

    for (const rawCommand of commands) {
        const command = normalizeSlashCommandName(rawCommand);
        if (!command || IGNORED_COMMANDS.includes(command) || entries.has(command)) {
            continue;
        }

        entries.set(command, buildRegistryEntry(command, 'session-metadata'));
    }

    return Array.from(entries.values());
}
