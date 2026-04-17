import * as React from 'react';
import { View, Text } from 'react-native';
import { StyleSheet } from 'react-native-unistyles';
import { Ionicons } from '@expo/vector-icons';
import { Typography } from '@/constants/Typography';
import { t } from '@/text';

interface CommandSuggestionProps {
    label: string;
    command: string;
    description?: string;
    argumentHint?: string;
}

export const CommandSuggestion = React.memo(({ label, command, description, argumentHint }: CommandSuggestionProps) => {
    return (
        <View style={styles.suggestionContainer}>
            <View style={styles.commandContent}>
                <Text
                    style={styles.commandLabelText}
                    numberOfLines={1}
                >
                    {label}
                </Text>
                <View style={styles.commandMetaRow}>
                    <Text
                        style={styles.commandText}
                        numberOfLines={1}
                    >
                        /{command}
                    </Text>
                    {argumentHint && (
                        <Text
                            style={styles.argumentHintText}
                            numberOfLines={1}
                        >
                            {argumentHint}
                        </Text>
                    )}
                    {description && (
                        <Text
                            style={styles.descriptionText}
                            numberOfLines={1}
                        >
                            {description}
                        </Text>
                    )}
                </View>
            </View>
        </View>
    );
});

interface FileMentionProps {
    fileName: string;
    filePath: string;
    fileType?: 'file' | 'folder';
}

export const FileMentionSuggestion = React.memo(({ fileName, filePath, fileType = 'file' }: FileMentionProps) => {
    return (
        <View style={styles.suggestionContainer}>
            <View style={styles.iconContainer}>
                <Ionicons
                    name={fileType === 'folder' ? 'folder' : 'document-text'}
                    size={18}
                    color={styles.iconColor.color}
                />
            </View>
            <Text 
                style={styles.fileNameText}
                numberOfLines={1}
            >
                {filePath}{fileName}
            </Text>
            <Text style={styles.labelText}>
                {fileType === 'folder' ? t('agentInput.suggestion.folderLabel') : t('agentInput.suggestion.fileLabel')}
            </Text>
        </View>
    );
});

const styles = StyleSheet.create((theme) => ({
    suggestionContainer: {
        minHeight: 56,
        flexDirection: 'row',
        alignItems: 'center',
        paddingHorizontal: 16,
        paddingVertical: 8,
    },
    commandContent: {
        flex: 1,
        minWidth: 0,
    },
    commandLabelText: {
        fontSize: 14,
        color: theme.colors.text,
        ...Typography.default('semiBold'),
    },
    commandMetaRow: {
        flexDirection: 'row',
        alignItems: 'center',
        gap: 8,
        marginTop: 2,
    },
    commandText: {
        fontSize: 12,
        color: theme.colors.textSecondary,
        ...Typography.mono(),
    },
    argumentHintText: {
        fontSize: 12,
        color: theme.colors.textSecondary,
        ...Typography.mono(),
    },
    descriptionText: {
        flex: 1,
        fontSize: 12,
        color: theme.colors.textSecondary,
        ...Typography.default(),
    },
    iconContainer: {
        width: 32,
        height: 32,
        borderRadius: 16,
        backgroundColor: theme.colors.surfaceHigh,
        alignItems: 'center',
        justifyContent: 'center',
        marginRight: 12,
    },
    iconColor: {
        color: theme.colors.textSecondary,
    },
    fileNameText: {
        flex: 1,
        fontSize: 14,
        color: theme.colors.textSecondary,
        ...Typography.default(),
    },
    labelText: {
        fontSize: 12,
        color: theme.colors.textSecondary,
        marginLeft: 8,
        ...Typography.default(),
    },
}));
