//
//  ShowUrlViewController.swift
//  ShareExtensions
//
//  Created by libowen on 2017/8/23.
//  Copyright © 2017年 libowen. All rights reserved.
//

import UIKit

class ShowUrlViewController: UIViewController {
    
    /// IBOutlet
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "ShowUrl"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ShowUrlViewController: viewWillAppear")
        
        let userDefaults = UserDefaults(suiteName: "group.com.owen.ShareExtensions")
        if (userDefaults?.bool(forKey: "has-new-share"))! {
            let url = userDefaults?.value(forKey: "share-url")
            self.urlLabel.text = url as? String
            userDefaults?.set(false, forKey: "has-new-share")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
