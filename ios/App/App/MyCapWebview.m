//
//  MyCapWebview.m
//  App
//
//  Created by Sambit on 07/05/20.
//

@import Capacitor;
@import Foundation;

// Define the plugin using the CAP_PLUGIN Macro, and
// each method the plugin supports using the CAP_PLUGIN_METHOD macro.
CAP_PLUGIN(MyCapWebview, "MyCapWebview",
           CAP_PLUGIN_METHOD(loadApp, CAPPluginReturnPromise);
)
