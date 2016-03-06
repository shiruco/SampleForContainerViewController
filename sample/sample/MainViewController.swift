//
//  ViewController.swift
//  sample
//
//  Created by takatatomoyuki on 2016/03/02.
//  Copyright © 2016年 com.maroton. All rights reserved.
//

import UIKit

protocol MenuViewDelegate {
    func onTouchHogeBtn()
    func onTouchFugaBtn()
    func onTouchPiyoBtn()
}

class MainViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var menuView: MenuView!
    
    var currentViewController: UIViewController!
    
    var hogeViewController: HogeViewController!
    var fugaViewController: FugaViewController!
    var piyoViewController: PiyoViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hogeViewController = HogeViewController.build()
        self.fugaViewController = FugaViewController.build()
        self.piyoViewController = PiyoViewController.build()
        
        self.menuView.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        currentViewController = hogeViewController
        showContentViewController(hogeViewController)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showContentViewController(vc: UIViewController) {
        self.addChildViewController(vc)
        self.containerView.addSubview(vc.view)
        vc.didMoveToParentViewController(self)
    }
    
    func hideContentViewController(vc: UIViewController) {
        vc.view.removeFromSuperview()
        vc.willMoveToParentViewController(self)
        self.removeFromParentViewController()
    }

}

extension MainViewController: MenuViewDelegate {
    func onTouchHogeBtn() {
        if ((currentViewController) != nil) {
            hideContentViewController(currentViewController)
        }
        currentViewController = hogeViewController
        showContentViewController(hogeViewController)
    }
    
    func onTouchFugaBtn() {
        if ((currentViewController) != nil) {
            hideContentViewController(currentViewController)
        }
        currentViewController = fugaViewController
        showContentViewController(fugaViewController)
    }
    
    func onTouchPiyoBtn() {
        if ((currentViewController) != nil) {
            hideContentViewController(currentViewController)
        }
        currentViewController = piyoViewController
        showContentViewController(piyoViewController)
    }
}

