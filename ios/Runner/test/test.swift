//
//  test.swift
//  Runner
//
//  Created by Kobi on 13.07.2022.
//

import Foundation
import UIKit
import Flutter

class NativeApiTest { // The way to create a (nullable) variable without initial value
    static var methodChannel: FlutterMethodChannel?
    static var eventChannel: FlutterEventChannel?
    
    static func setMethodCallHandler(window: UIWindow) { // Named parameter.. probably can not be the same with name of its referance
        let controller: FlutterViewController = window.rootViewController as! FlutterViewController
        
        methodChannel = FlutterMethodChannel(name: "native_test", binaryMessenger: controller.binaryMessenger)
        
        methodChannel?.setMethodCallHandler({
            (call: FlutterMethodCall, result: FlutterResult) -> Void in
            // looks like "break" must be followed with ";"
            switch call.method {
            case "getData":
                getData(call: call, result: result)
                break;
            case "asyncTest":
                asyncTest(result: result)
                break;
            case "throwError":
                result(FlutterError(code: "400", message: "error is thrown", details: nil))
                break;
            default:
                result(FlutterMethodNotImplemented)
            }
        })
    }
    
    static func getData(call: FlutterMethodCall, result: FlutterResult) {
        guard let args = call.arguments as? [String : Any] else {return}
        let arg1 = args["arg1"] as! String
        let arg2 = args["arg2"] // gets arg as Optional()
        
        let info: String = "test native : from swift : getData : arg1 : \(arg1) : arg2 : \(arg2)"
        
        printConsole(str: info)
        result(info)
    }
    
    static func printConsole(str: String) {
        DispatchQueue.main.async {
            self.methodChannel?.invokeMethod("print", arguments: str)
        }
    }
    
    static func asyncTest(result: FlutterResult)  {
        var str : String = "init"
        DispatchQueue.main.async {
            let value =  self.methodChannel?.invokeMethod("async", arguments: nil)
            str = "async result : \(value)"
            printConsole(str: str)
        }
        result(str)
    }
}
