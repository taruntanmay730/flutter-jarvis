import UIKit
import Flutter
import Firebase
import FirebaseAnalytics
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        FirebaseApp.configure()
        Analytics.initialize()
        Analytics.setAnalyticsCollectionEnabled(true)
        GMSServices.provideAPIKey("AIzaSyARtkUikABuMq5P5HZCT8yxTRUbwRTlzJ8")
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
