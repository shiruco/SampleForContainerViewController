//
//  PiyoViewController.swift
//  sample
//
//  Created by takatatomoyuki on 2016/03/04.
//  Copyright © 2016年 com.maroton. All rights reserved.
//

import UIKit

class PiyoViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let requestURL = NSURL(string: "http://google.com")
        let req = NSURLRequest(URL: requestURL!)
        webView.loadRequest(req)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("PiyoViewController will disappear")
    }
    
    class func build() -> PiyoViewController {
        let storyboard = UIStoryboard(name: "Piyo", bundle: nil)
        return storyboard.instantiateInitialViewController() as! PiyoViewController
    }
    
    
}
