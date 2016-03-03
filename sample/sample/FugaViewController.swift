//
//  FugaViewController.swift
//  sample
//
//  Created by takatatomoyuki on 2016/03/04.
//  Copyright © 2016年 com.maroton. All rights reserved.
//

import UIKit

class FugaViewController: UIViewController {
    
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
        
        print("FugaViewController will disappear")
    }
    
    class func build() -> FugaViewController {
        let storyboard = UIStoryboard(name: "Fuga", bundle: nil)
        return storyboard.instantiateInitialViewController() as! FugaViewController
    }
    
    
}
