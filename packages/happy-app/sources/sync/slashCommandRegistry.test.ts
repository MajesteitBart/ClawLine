import { describe, expect, it } from 'vitest';

import {
    buildSlashCommandRegistry,
    getSlashCommandInsertion,
    normalizeSlashCommandName,
} from './slashCommandRegistry';

describe('slashCommandRegistry', () => {
    it('normalizes raw slash command names', () => {
        expect(normalizeSlashCommandName('/Compact')).toBe('compact');
        expect(normalizeSlashCommandName('  /clear  ')).toBe('clear');
        expect(normalizeSlashCommandName('   ')).toBeNull();
    });

    it('includes builtin commands before metadata commands', () => {
        const commands = buildSlashCommandRegistry(['debug']);

        expect(commands.map((entry) => entry.command)).toEqual(['compact', 'clear', 'debug']);
        expect(commands[0].source).toBe('builtin');
        expect(commands[2].source).toBe('session-metadata');
    });

    it('filters ignored commands and deduplicates metadata entries', () => {
        const commands = buildSlashCommandRegistry([
            '/debug',
            'debug',
            'login',
            'compact',
        ]);

        expect(commands.map((entry) => entry.command)).toEqual(['compact', 'clear', 'debug']);
    });

    it('applies curated labels and descriptions when available', () => {
        const [compact, clear, debug] = buildSlashCommandRegistry(['debug']);

        expect(compact.label).toBe('Compact Conversation');
        expect(clear.description).toBe('Clear the conversation');
        expect(debug.insertText).toBe('/debug [topic]');
        expect(debug.insertSelectionText).toBe('[topic]');
    });

    it('falls back to title-cased labels for unknown metadata commands', () => {
        const command = buildSlashCommandRegistry(['skill-runner'])[2];

        expect(command.command).toBe('skill-runner');
        expect(command.label).toBe('Skill Runner');
        expect(command.description).toBeUndefined();
    });

    it('builds insertion metadata for scaffolded commands', () => {
        const debug = buildSlashCommandRegistry(['debug'])[2];
        const insertion = getSlashCommandInsertion(debug);

        expect(insertion).toEqual({
            text: '/debug [topic]',
            addSpace: false,
            selectionText: '[topic]',
        });
    });
});
