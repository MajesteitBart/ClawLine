export interface OpenClawSessionSummary {
    id: string;
    createdAt: number;
    updatedAt: number;
    active: boolean;
    activeAt: number;
    thinking?: boolean;
    title?: string | null;
    summaryText?: string | null;
    summaryUpdatedAt?: number | null;
    host?: string | null;
    path?: string | null;
    version?: string | null;
    flavor?: string | null;
}

export interface OpenClawTextMessage {
    id: string;
    createdAt: number;
    role: 'user' | 'assistant' | 'system';
    text: string;
}

export interface OpenClawToolEvent {
    id: string;
    createdAt: number;
    title: string;
    status?: 'running' | 'completed' | 'failed' | 'waiting';
    detail?: string | null;
}

export type OpenClawMessage = OpenClawTextMessage | OpenClawToolEvent;

export interface OpenClawSendTextInput {
    sessionId: string;
    text: string;
}

export type OpenClawAdapterEvent =
    | { type: 'session-upsert'; session: OpenClawSessionSummary }
    | { type: 'session-delete'; sessionId: string }
    | { type: 'message-upsert'; sessionId: string; message: OpenClawMessage }
    | { type: 'session-status'; sessionId: string; active: boolean; thinking?: boolean };
