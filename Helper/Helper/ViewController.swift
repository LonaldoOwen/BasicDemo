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
        //testGetWithParameters()
        testWeatherInterface()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Examples
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
            print("response: \(String(describing: response))")
        }
    }

    // 
    func testGetWithParameters() {
        Network.get(url: "http://music.163.com/#/my/m/music/playlist", headers: [:], parameters: ["id": "781294334", "name": "free", "type": "audio"]) { (data, response, error) in
            print("response: \(String(describing: response))")
        }
    }
    
    // 验证天气接口
    // 2018/06/29
    func testWeatherInterface() {
        print("# testWeatherInterface:")
        // 构造请求
        let url = "http://test.m.api.cct.cn/api-common/get-city-pname"
        let header = ["Content-type": "application/json"]
        let parameters = ["cityName": "beijing"]
        
        Network.post(url: url, headers: header, paremeters: parameters) { (data, response, error) in
            
            do {
                // Parse data to JSON
                let jsonData: [String: Any] = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String : Any]
                let dataArray: [[String: String]] = jsonData["data"] as! [[String: String]]
                print("dataArray: \(dataArray)")
            } catch let error {
                // Handle error
                print("Response error: \(error)")
            }
        }
        
    }

}

