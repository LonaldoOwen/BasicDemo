//
//  ViewController.swift
//  Helper
//
//  Created by owen on 17/7/22.
//  Copyright © 2017年 owen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        ///
        //testRequestBasic()
        //testGetWithNoParameters()
        testGetWithParameters()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// Examples
    //
    func testRequestBasic() {
        let headers: [String: String] = [
            "Content-Type": "application/json",
            "seqnum": "0",
            "ver": "1.0",
            "uid": "498",
            "token": "nq4LWlvy7lJW-kh07fRRuDGeBwRvpnsJ0BGl17Xe4eeZEwvXwQN8HoBAluLmJbpQ",
            ]
        let parameters = [
            "data": [
                "id": "46658",
                "name": "free"
            ]
        ]
        let url = "http://test.api.fengchaoyou.com/v1/product/detail"
        
        Network.request(method: "POST", url: url, headers: headers, parameters: parameters) { (data, response, error) in
            //
            do {
                if let jsonData = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: AnyObject] {
                    print("jsonData: \(String(describing: jsonData))")
                }
            } catch let error {
                print("error: \(error.localizedDescription)")
            }
            //
        }

    }
    
    //
    func testGetWithNoParameters() {
        Network.get(url: "http://www.jianshu.com/p/fe2798574aa0") { (data, response, error) in
            print("response: \(response)")
        }
    }

    // 
    func testGetWithParameters() {
        Network.get(url: "http://music.163.com/#/my/m/music/playlist", headers: [:], parameters: ["id": "781294334", "name": "free", "type": "audio"]) { (data, response, error) in
            print("response: \(response)")
        }
    }

}

