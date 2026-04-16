import type { Session } from '@/sync/storageTypes';
import type { OpenClawSessionSummary } from './types';

export function mapOpenClawSessionToHappySession(session: OpenClawSessionSummary): Session {
    return {
        id: session.id,
        seq: 0,
        createdAt: session.createdAt,
        updatedAt: session.updatedAt,
        active: session.active,
        activeAt: session.activeAt,
        metadata: {
            path: session.path ?? '',
            host: session.host ?? 'openclaw-gateway',
            version: session.version ?? undefined,
            name: session.title ?? undefined,
            summary: session.summaryText
                ? {
                    text: session.summaryText,
                    updatedAt: session.summaryUpdatedAt ?? session.updatedAt,
                }
                : undefined,
            flavor: session.flavor ?? 'openclaw',
        },
        metadataVersion: 1,
        agentState: null,
        agentStateVersion: 0,
        thinking: !!session.thinking,
        thinkingAt: session.updatedAt,
        presence: session.active ? 'online' : session.activeAt,
        todos: [],
        draft: null,
        permissionMode: null,
        modelMode: null,
        effortLevel: null,
        latestUsage: null,
    };
}
