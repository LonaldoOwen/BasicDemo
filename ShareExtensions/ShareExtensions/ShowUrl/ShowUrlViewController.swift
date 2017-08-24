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
    
    var count: Int = 0
    var tempLabel: UILabel = {
        let tempLabel = UILabel(frame: CGRect(x: 100, y: 100, width: 200, height: 50))
        return tempLabel
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ShowUrlViewController: viewDidLoad")

        // Do any additional setup after loading the view.
        self.title = "ShowUrl"
        
        //
        self.view.addSubview(tempLabel)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ShowUrlViewController: viewWillAppear")
        self.tempLabel.text = "count: " + String(count+1)
        
        let userDefaults = UserDefaults(suiteName: "group.com.owen.ShareExtensions")
        if (userDefaults?.bool(forKey: "has-new-share"))! {
            let dict = userDefaults?.value(forKey: "share-url") as! [String: String]
            self.urlLabel.text = dict["urlString"]
            self.nameLabel.text = dict["text"]
            userDefaults?.removeObject(forKey: "share-url")
            userDefaults?.set(false, forKey: "has-new-share")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
