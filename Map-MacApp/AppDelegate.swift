//
//  AppDelegate.swift
//  Map-MacApp
//
//  Created by Ehsan Taghavi on 12.10.2023.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    let statusBarItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusBarItem.button?.title = "Map-MacApp"
        statusBarItem.menu = NSMenu()
        
        let infoMenu = NSMenuItem(title: "App Info", action: #selector(showInfo(_:)), keyEquivalent: "i")
        statusBarItem.menu?.addItem(infoMenu)
        
        let showAppMenu = NSMenuItem(title: "Show App", action: #selector(showApp(_:)), keyEquivalent: "s")
        statusBarItem.menu?.addItem(showAppMenu)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }

    @objc func showInfo(_ sender :NSMenuItem){
        let alert = NSAlert()
        alert.messageText = "App developed by Swift Guy"
        alert.informativeText = "This app is now running in Menu Bar"
        alert.runModal()
    }

    @objc func showApp(_ sender:NSMenuItem){
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        guard let mapVC = storyboard.instantiateController(withIdentifier : "MapVC") as? ViewController else {return}
        
        let popOver = NSPopover()
        popOver.contentViewController = mapVC
        popOver.behavior = .transient
        popOver.show(relativeTo: statusBarItem.button!.bounds, of: statusBarItem.button!,preferredEdge: .maxY)
    }
}

