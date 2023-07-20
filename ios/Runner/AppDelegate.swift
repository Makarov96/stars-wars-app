import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    let gyroscopeStream: GyroscopeStreamHandler = GyroscopeStreamHandler()
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      

      let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
      let gyroscopeMethodChannel = FlutterEventChannel(name: GYROSCOPE_CHANNEL_NAME, binaryMessenger: controller.binaryMessenger)
      gyroscopeMethodChannel.setStreamHandler(gyroscopeStream)
    
      
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    
    override func applicationWillTerminate(_ application: UIApplication) {
      let _ =  gyroscopeStream.onCancel(withArguments: nil)
    }

  
}
