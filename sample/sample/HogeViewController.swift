//
//  HogeViewController.swift
//  sample
//
//  Created by takatatomoyuki on 2016/03/02.
//  Copyright © 2016年 com.maroton. All rights reserved.
//

import UIKit

class HogeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("HogeViewController will disappear")
    }
    
    class func build() -> HogeViewController {
        let storyboard = UIStoryboard(name: "Hoge", bundle: nil)
        return storyboard.instantiateInitialViewController() as! HogeViewController
    }
    
    
}
