import { WebPlugin } from '@capacitor/core';
import { MyCapWebviewPlugin } from './definitions';

export class MyCapWebviewWeb extends WebPlugin implements MyCapWebviewPlugin {
  constructor() {
    super({
      name: 'MyCapWebview',
      platforms: ['web']
    });
  }

  async loadApp(options: { value: string }): Promise<{value: string}> {
    console.log('loadApp', options);
    return options;
  }
}

const MyCapWebview = new MyCapWebviewWeb();

export { MyCapWebview };

import { registerWebPlugin } from '@capacitor/core';
registerWebPlugin(MyCapWebview);
