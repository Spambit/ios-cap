//
//  MyWebview.swift
//  App
//
//  Created by Sambit on 06/05/20.
//

import UIKit
import Capacitor

@objc(MyCapWebview) public class MyCapWebview: CAPPlugin, WKNavigationDelegate {
    private var oldDelegate: WKNavigationDelegate?
    @objc public func loadApp(_ call: CAPPluginCall) {
        let webapp = call.options["webapp"]!
        let capViewController = bridge.viewController as! CAPBridgeViewController
        var path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        path = "\(path)/\(webapp)"
        capViewController.setServerBasePath(path: path)
        call.resolve()
    }
}
