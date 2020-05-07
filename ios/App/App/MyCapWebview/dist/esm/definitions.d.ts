declare module "@capacitor/core" {
    interface PluginRegistry {
        MyCapWebview: MyCapWebviewPlugin;
    }
}
export interface MyCapWebviewPlugin {
    echo(options: {
        value: string;
    }): Promise<{
        value: string;
    }>;
}
