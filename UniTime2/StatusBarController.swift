//
//  StatusBarController.swift
//  UniTime2
//
//  Created by Naoki Odajima on 2021/12/26.
//

import AppKit

final class StatusBarController {
    private let statusBarItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    private let menu = NSMenu()

    init() {
        self.setup()
    }

    private func setup() {
        guard let barItemButton = self.statusBarItem.button else { return }
        let icon = NSImage(imageLiteralResourceName: "StatusBarIcon")
        icon.size = NSSize(width: 18, height: 18)
        barItemButton.image = icon
        barItemButton.menu = self.menu
    }
}
