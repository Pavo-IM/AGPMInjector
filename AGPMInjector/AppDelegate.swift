//
//  AppDelegate.swift
//  AGPMInjector
//
//  Created by Henry Brock on 12/28/18.
//  Copyright © 2018 Pavo. All rights reserved.
//

import Cocoa
import Sparkle

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        SUUpdater().checkForUpdatesInBackground()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

