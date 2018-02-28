//
//  ScreeningViewController.swift
//  Network
//
//  Created by libowen on 2017/7/7.
//  Copyright © 2017年 libowen. All rights reserved.
//
/**
    http://www.hangge.com/blog/cache/detail_591.html
*/

import UIKit

class ScreeningViewController: UIViewController, UICollectionViewDataSource {
    
    //static let SCREEN_WIDTH = UIScreen.main.bounds.width
    //static let  SCREEN_HEIGHT = UIScreen.main.bounds.height
    
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let flowLayout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: CGRect(x: 60, y: 20, width: UIScreen.main.bounds.width-60, height: UIScreen.main.bounds.height-20), collectionViewLayout: flowLayout)
        self.view.addSubview(collectionView)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ScreeningCell")
        collectionView.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: data source
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "ScreeningCell", for: indexPath)
        return item
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
