//
//  ViewController.swift
//  Network
//
//  Created by libowen on 2017/7/4.
//  Copyright © 2017年 libowen. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var navigationBarWithSegment: UINavigationBar!
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate let barBackgroundColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //
        self.title = "Network"
        
        ///
//        Network.request(method: "POST", url: "http://test.api.fengchaoyou.com/v1/product/detail", parameters: ["data": ["id": "46658"]]) { (data, response, error) in
//            
//            do {
//                if let jsonData = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: AnyObject] {
//                    print("jsonData: \(String(describing: jsonData))")
//                }
//            } catch let error {
//                print("error: \(error.localizedDescription)")
//            }
//            
//        }
        
        ///
        let mp3Url = "https://res.wx.qq.com/voice/getvoice?mediaid=MzIwMjg5Njg5N18yMjQ3NDg0Mjg1"
        //let request = URLRequest()
        let session = URLSession.shared
        let task = session.dataTask(with: URL(string: mp3Url)!) { (data, response, error) in
            //
            print("response: \(String(describing: response))")
            print("data: \(String(describing: data))")
        }
        task.resume()
        
        ///
        //navigationBarWithSegment.backgroundColor = barBackgroundColor
        navigationBarWithSegment.isTranslucent = false
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        //navigationController?.navigationBar.barTintColor = barBackgroundColor
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.shadowImage = nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: dataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //
        let cell: RankingTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SimpleCell")! as! RankingTableViewCell
        cell.rankLabel.text = "\(indexPath.row)"
        cell.nameLabel.text = "name"
        cell.totalCountLabel.text = "total"
        
        return cell
    }
    
    @IBAction func showScreening(_ sender: Any) {
        let screeningVc: ScreeningViewController = ScreeningViewController()
        self.navigationController?.show(screeningVc, sender: sender)
    }
    
    
    
    // MARK: - Temp
    
    // 验证Request
    
    
    
    
    

}

