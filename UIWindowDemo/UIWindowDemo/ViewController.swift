//
//  ViewController.swift
//  UIWindowDemo
//
//  Created by libowen on 2017/10/11.
//  Copyright © 2017年 libowen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //
        registerObserber()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //
        
        // Alert
        //showAlert()
        
        // Action sheet
        //showActionSheet()
        
        //
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    /// Action
    
    @IBAction func handleAlert(_ sender: UIButton) {
        showAlert()
    }
    
    @IBAction func handleActionSheet(_ sender: UIButton) {
        showActionSheet()
    }
    
    
    /// Helper
    func showAlert() {
        // Alert
        let alert = UIAlertController(title: "Alert", message: "This is an alert,UIAlertController", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: { (_) in
            NSLog("The \"OK\" alert occured.")
        }))
        alert.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: "Cancel action"), style: .`default`, handler: { (_) in
            NSLog("The \"Cancel\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showActionSheet() {
        // Action sheet
        let actionSheet = UIAlertController(title: "Action sheet", message: "This is an action sheet,UIAlertController", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Sheet1", style: .`default`, handler: { (_) in
            NSLog("The \"Sheet1\" alert occured.")
        }))
        actionSheet.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: "Cancel action"), style: .`default`, handler: { (_) in
            NSLog("The \"Cancel\" alert occured.")
        }))
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    // register observer
    func registerObserber() {
        
        NotificationCenter.`default`.addObserver(self, selector: #selector(windowDidBecomeKey), name: NSNotification.Name.UIWindowDidBecomeKey,  object: nil)
        NotificationCenter.`default`.addObserver(self, selector: #selector(windowDidResignKey), name: NSNotification.Name.UIWindowDidResignKey, object: nil)
        NotificationCenter.`default`.addObserver(self, selector: #selector(windowDidBecomeVisible), name: NSNotification.Name.UIWindowDidBecomeVisible, object: nil)
        NotificationCenter.`default`.addObserver(self, selector: #selector(windowDidBecomeHidden), name: NSNotification.Name.UIWindowDidBecomeHidden, object: nil)
    }
    
    // release observer
    func releaseObserver() {
        NotificationCenter.`default`.removeObserver(self)
    }
    
    //
    @objc
    func windowDidBecomeKey(notification: NSNotification) {
        let window: UIWindow = notification.object as! UIWindow
        let windows = UIApplication.shared.windows
        print("current window count: \(windows.count)")
        print("Window has become keyWindow: \(window); window level: \(window.windowLevel); index of windows: \(String(describing: windows.index(of: window)))")
    }
    
    @objc
    func windowDidResignKey(notification: NSNotification) {
        let window: UIWindow = notification.object as! UIWindow
        let windows = UIApplication.shared.windows
        print("current window count: \(windows.count)")
        print("Window has resign keyWindow: \(window); window level: \(window.windowLevel); index of windows: \(String(describing: windows.index(of: window)))")
    }
    
    @objc
    func windowDidBecomeVisible(notification: NSNotification) {
        let window: UIWindow = notification.object as! UIWindow
        let windows = UIApplication.shared.windows
        print("current window count: \(windows.count)")
        print("Window has become visible: \(window); window level: \(window.windowLevel); index of windows: \(String(describing: windows.index(of: window)))")
    }
    
    @objc
    func windowDidBecomeHidden(notification: NSNotification) {
        let window: UIWindow = notification.object as! UIWindow
        let windows = UIApplication.shared.windows
        print("current window count: \(windows.count)")
        print("Window has become hidden: \(window); window level: \(window.windowLevel); index of windows: \(String(describing: windows.index(of: window)))")
    }
}

