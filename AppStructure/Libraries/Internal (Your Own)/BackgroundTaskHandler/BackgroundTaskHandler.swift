//
//  BackgroundTaskHandler.swift
//  AppStructure
//
//  Created by Fahid Attique on 18/02/2018.
//  Copyright © 2018 Fahad Attique. All rights reserved.
//


import UIKit

class BackgroundTaskHandler {

    var backgroundUpdateTask = UIBackgroundTaskInvalid
    
    func beginBackgroundTask() -> UIBackgroundTaskIdentifier  {
        
        endBackgroundTask() // End Background task if alreayd running.
        
        backgroundUpdateTask = UIApplication.shared.beginBackgroundTask (expirationHandler: {
            self.endBackgroundTask()
        })
        
        return backgroundUpdateTask
    }
    
    func endBackgroundTask() {
        if backgroundUpdateTask != UIBackgroundTaskInvalid {
            UIApplication.shared.endBackgroundTask(backgroundUpdateTask)
            backgroundUpdateTask = UIBackgroundTaskInvalid
        }
    }
    
}
