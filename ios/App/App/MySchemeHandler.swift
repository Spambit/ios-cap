//
//  MySchemeHandler.swift
//  App
//
//  Created by Sambit on 06/05/20.
//

import Foundation
import MobileCoreServices
import WebKit

class MySchemeHandler: NSObject, WKURLSchemeHandler {
    func webView(_ webView: WKWebView, start urlSchemeTask: WKURLSchemeTask) {
        let url = urlSchemeTask.request.url!
        let localWebappPath = url.path
        
        if localWebappPath.starts(with: MySchemeHandler.local_webapps) {
            let documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            
            let webappIndexFile = "\(documentPath)\(localWebappPath)"
            let fileUrl = URL.init(fileURLWithPath: webappIndexFile)
            
            do {
                
                let data = try Data(contentsOf: fileUrl)
                let mimeType = mimeTypeForExtension(pathExtension: url.pathExtension)
                let expectedContentLength = data.count
                let headers =  [
                    "Content-Type": mimeType,
                    "Cache-Control": "no-cache"
                ]
                let urlResponse = URLResponse(url: fileUrl, mimeType: mimeType, expectedContentLength: expectedContentLength, textEncodingName: nil)
                let httpResponse = HTTPURLResponse(url: fileUrl, statusCode: 200, httpVersion: nil, headerFields: headers)
                if isMediaExtension(pathExtension: url.pathExtension) {
                    urlSchemeTask.didReceive(urlResponse)
                } else {
                    urlSchemeTask.didReceive(httpResponse!)
                }
                urlSchemeTask.didReceive(data)
            } catch let error as NSError {
                urlSchemeTask.didFailWithError(error)
                return
            }
            urlSchemeTask.didFinish()
        }
    }
    
    func webView(_ webView: WKWebView, stop urlSchemeTask: WKURLSchemeTask) {
        NSLog("********** Stopped loading local webapp *************")
    }
    
    public static var local_webapps = "/webapps"
    
    func mimeTypeForExtension(pathExtension: String) -> String {
        if !pathExtension.isEmpty {
            if let uti = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, pathExtension as NSString, nil)?.takeRetainedValue() {
                if let mimetype = UTTypeCopyPreferredTagWithClass(uti, kUTTagClassMIMEType)?.takeRetainedValue() {
                    return mimetype as String
                }
            }
            return "application/octet-stream"
        }
        return "text/html"
    }
    
    func isMediaExtension(pathExtension: String) -> Bool {
        let mediaExtensions = ["m4v", "mov", "mp4",
                               "aac", "ac3", "aiff", "au", "flac", "m4a", "mp3", "wav"]
        if mediaExtensions.contains(pathExtension.lowercased()) {
            return true
        }
        return false
    }
}

