//
//  StatusBarController.swift
//  UniTime2
//
//  Created by Naoki Odajima on 2021/12/26.
//

import AppKit

final class StatusBarController: NSObject {
    private let statusBarItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    private let menu = NSMenu()

    override init() {
        super.init()
        self.setup()
    }

    private func setup() {
        guard let barItemButton = self.statusBarItem.button else { return }
        let icon = NSImage(imageLiteralResourceName: "StatusBarIcon")
        icon.size = NSSize(width: 18, height: 18)
        barItemButton.image = icon
        self.setupMenu()
        self.statusBarItem.menu = self.menu
        self.menu.delegate = self
    }

    private func setupMenu() {
        self.menu.addItem(withTitle: "", action: nil, keyEquivalent: "")
    }
}

// MARK: - NSMenuDelegate

extension StatusBarController: NSMenuDelegate {
    func menuWillOpen(_ menu: NSMenu) {
        guard let item = menu.item(at: 0) else { return }
        if let string = NSPasteboard.general.string(forType: .string) {
            item.title = string
        } else {
            item.title = "クリップボードは空です"
        }
    }
}
