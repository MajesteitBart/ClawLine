import type {
    OpenClawAdapterEvent,
    OpenClawMessage,
    OpenClawSendTextInput,
    OpenClawSessionSummary,
} from './types';

export interface OpenClawSessionAdapter {
    listSessions(): Promise<OpenClawSessionSummary[]>;
    getSession(sessionId: string): Promise<OpenClawSessionSummary | null>;
    getMessages(sessionId: string): Promise<OpenClawMessage[]>;
    sendTextMessage(input: OpenClawSendTextInput): Promise<void>;
    subscribe(onEvent: (event: OpenClawAdapterEvent) => void): () => void;
}

export function createUnimplementedOpenClawSessionAdapter(): OpenClawSessionAdapter {
    const notImplemented = async () => {
        throw new Error('OpenClaw session adapter is not implemented yet.');
    };

    return {
        listSessions: notImplemented,
        getSession: notImplemented,
        getMessages: notImplemented,
        sendTextMessage: notImplemented,
        subscribe: () => () => undefined,
    };
}
