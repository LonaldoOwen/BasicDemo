//
//  ShareViewController.swift
//  Share
//
//  Created by libowen on 2017/8/23.
//  Copyright © 2017年 libowen. All rights reserved.
//

import UIKit
import Social

class ShareViewController: SLComposeServiceViewController {

    override func isContentValid() -> Bool {
        // Do validation of contentText and/or NSExtensionContext attachments here
        return true
    }

    override func didSelectPost() {
        // This is called after the user selects Post. Do the upload of contentText and/or NSExtensionContext attachments.
    
        // Inform the host that we're done, so it un-blocks its UI. Note: Alternatively you could call super's -didSelectPost, which will similarly complete the extension context.
        
        //
        guard let extensionItem: NSExtensionItem = self.extensionContext?.inputItems.first as? NSExtensionItem else { return }
        guard let attachments: [NSItemProvider] = extensionItem.attachments as? [NSItemProvider] else { return }
        for itemProvider in attachments {
            if itemProvider.hasItemConformingToTypeIdentifier("public.url") {
                print("itemProvider: \(itemProvider)")
                itemProvider.loadItem(forTypeIdentifier: "public.url", options: nil, completionHandler: { (coding, error) in
                    //print("coding: \(coding)")
                    guard let coding: NSURL = coding as? NSURL else {
                        print("coding is not url")
                        return
                    }
                    print("Share Url: \(String(describing: coding.absoluteString))")
                    let userDefaults: UserDefaults = UserDefaults(suiteName: "group.com.owen.ShareExtensions")!
                    let dict: [String: String] = [
                        "urlString": coding.absoluteString!,
                        "text": self.contentText
                    ]
                    //userDefaults.set(coding.absoluteString, forKey: "share-url")
                    userDefaults.set(dict, forKey: "share-url")
                    userDefaults.set(true, forKey: "has-new-share")
                    
                })
            }
        }
        
        self.extensionContext!.completeRequest(returningItems: [], completionHandler: nil)
    }

    override func configurationItems() -> [Any]! {
        // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
        return []
    }

}
