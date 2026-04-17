import { beforeEach, describe, expect, it, vi } from 'vitest';

vi.mock('./storage', () => ({
    storage: {
        getState: vi.fn(),
    },
}));

import { storage } from './storage';
import { searchCommands } from './suggestionCommands';

describe('suggestionCommands', () => {
    beforeEach(() => {
        vi.mocked(storage.getState).mockReturnValue({
            sessions: {
                session1: {
                    metadata: {
                        slashCommands: ['debug', 'skill-runner'],
                    },
                },
            },
        } as any);
    });

    it('returns builtin commands when the query is empty', async () => {
        const commands = await searchCommands('session1', '');

        expect(commands.map((entry) => entry.command)).toEqual(['compact', 'clear', 'debug', 'skill-runner']);
    });

    it('searches across curated descriptions and fallback labels', async () => {
        const byDescription = await searchCommands('session1', 'history');
        const byLabel = await searchCommands('session1', 'skill runner');

        expect(byDescription[0].command).toBe('compact');
        expect(byLabel[0].command).toBe('skill-runner');
    });

    it('prioritizes exact command prefix matches for mobile autocomplete', async () => {
        const commands = await searchCommands('session1', 'de');

        expect(commands[0].command).toBe('debug');
    });

    it('searches lightweight argument hints from the registry overlay', async () => {
        const commands = await searchCommands('session1', 'topic');

        expect(commands[0].command).toBe('debug');
    });
});
