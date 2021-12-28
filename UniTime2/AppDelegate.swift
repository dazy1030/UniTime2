//
//  AppDelegate.swift
//  UniTime2
//
//  Created by Naoki Odajima on 2021/12/26.
//

import Cocoa

@main
final class AppDelegate: NSObject, NSApplicationDelegate {
    private var statusItemController: StatusItemController?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        self.statusItemController = StatusItemController()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        true
    }
}
