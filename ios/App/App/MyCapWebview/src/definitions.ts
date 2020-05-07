declare module "@capacitor/core" {
  interface PluginRegistry {
    MyCapWebview: MyCapWebviewPlugin;
  }
}

export interface MyCapWebviewPlugin {
  loadApp(webapp: string): Promise<{value: string}>;
}
