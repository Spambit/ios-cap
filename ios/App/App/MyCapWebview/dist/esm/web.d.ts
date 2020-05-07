import { WebPlugin } from '@capacitor/core';
import { MyCapWebviewPlugin } from './definitions';
export declare class MyCapWebviewWeb extends WebPlugin implements MyCapWebviewPlugin {
    constructor();
    echo(options: {
        value: string;
    }): Promise<{
        value: string;
    }>;
}
declare const MyCapWebview: MyCapWebviewWeb;
export { MyCapWebview };
