import UIKit
import Flutter
import Firebase
import FirebaseAnalytics

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    
    override func application(_ application: UIApplication,didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        Analytics.initialize()
        Analytics.setAnalyticsCollectionEnabled(true)
        GeneratedPluginRegistrant.register(with: self)
        
        self.sendMessageToFlutter()
        self.receiveMessage()
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    private func receiveMessage(){
        let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
        var flutterChannel = FlutterMethodChannel.init(name: "test.flutter.ios.communication", binaryMessenger: controller.binaryMessenger)
        
        flutterChannel.setMethodCallHandler({(call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            if call.method == "getiOSMessage"{
                result("flutter called iOS method")
                result(FlutterError(code: "-1", message: "something went wrong", details: "something went wrong"))
            }
        })
    }
    
    private func sendMessageToFlutter(){
        let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
        var flutterChannel = FlutterMethodChannel(name: "test.flutter.ios.communication", binaryMessenger: controller.binaryMessenger)
        var params = ["param1": "value1", "param2": "value2"]
        flutterChannel.invokeMethod("didRecieveiOSCall", arguments: params)
    }
}
