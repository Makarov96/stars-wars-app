//
//  Gyroscope.swift
//  Runner
//
//  Created by Guerin Steven Colocho Chacon on 17/07/23.
//

import Foundation
import CoreMotion
import Flutter

class GyroscopeStreamHandler: NSObject, FlutterStreamHandler {
    private let motionManager = CMMotionManager()
    private let queue = OperationQueue()
    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        if motionManager.isGyroAvailable {
            motionManager.startGyroUpdates(to: queue) { (data, error) in
                guard let data = data else {
                    return
                }
                events([data.rotationRate.x, data.rotationRate.y, data.rotationRate.z])
            }
        }
        return nil
    }
    
    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        motionManager.stopGyroUpdates()
        return nil
    }
    
    func setUpdateInterval(_ interval: TimeInterval) {
        motionManager.gyroUpdateInterval = interval
    }
}
