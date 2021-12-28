//
//  StatusItemController.swift
//  UniTime2
//
//  Created by Naoki Odajima on 2021/12/26.
//

import AppKit

final class StatusItemController: NSObject {
    private let item = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    private let menu = NSMenu()

    override init() {
        super.init()
        self.setup()
    }

    private func setup() {
        guard let itemButton = self.item.button else { return }
        let icon = NSImage(imageLiteralResourceName: "StatusItemIcon")
        icon.size = NSSize(width: 18, height: 18)
        itemButton.image = icon
        self.setupMenu()
        self.item.menu = self.menu
        self.menu.delegate = self
    }

    private func setupMenu() {
        self.menu.addItem(withTitle: "", action: nil, keyEquivalent: "")
    }
}

// MARK: - NSMenuDelegate

extension StatusItemController: NSMenuDelegate {
    func menuWillOpen(_ menu: NSMenu) {
        guard let item = menu.item(at: 0) else { return }
        if let string = NSPasteboard.general.string(forType: .string) {
            item.title = string
        } else {
            item.title = "クリップボードは空です"
        }
    }
}
