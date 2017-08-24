//
//  ShowImageViewController.swift
//  ShareExtensions
//
//  Created by libowen on 2017/8/23.
//  Copyright © 2017年 libowen. All rights reserved.
//

import UIKit

class ShowImageViewController: UIViewController {

    /// IBOutlet
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ShowImageViewController: viewDidLoad")
        
        // Do any additional setup after loading the view.
        self.title = "ShowImage"
        self.imageView.backgroundColor = UIColor.orange
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ShowImageViewController: viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
         print("ShowImageViewController: viewDidAppear")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
