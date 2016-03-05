//
//  MenuView.swift
//  sample
//
//  Created by takatatomoyuki on 2016/03/05.
//  Copyright © 2016年 com.maroton. All rights reserved.
//

import UIKit

class MenuView: UIView {
    
    //メニュー背景
    let MENU_BACKGROUND_WIDTH: CGFloat = 400
    let MENU_BACKGROUND_HEIGHT: CGFloat = 400
    
    var menuImageView: UIImageView!
    var menuCloseImageView: UIImageView!
    var menuBackGroundView: UIView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        //メニュー用background
        menuBackGroundView = UIView(frame: CGRectMake(0,0,MENU_BACKGROUND_WIDTH,MENU_BACKGROUND_HEIGHT))
        menuBackGroundView.backgroundColor = UIColor.blueColor()
        menuBackGroundView.layer.position = CGPoint(x: 200, y: 200)
        menuBackGroundView.layer.cornerRadius = MENU_BACKGROUND_WIDTH / 2;
        menuBackGroundView.layer.masksToBounds = true
        menuBackGroundView.transform = CGAffineTransformMakeScale(0.01, 0.01);
        menuBackGroundView.hidden = true
        self.addSubview(menuBackGroundView)
        
        //メニューアイコンを表示
        menuImageView = UIImageView(frame: CGRectMake(0,0,60,60))
        let menuIconImage = UIImage(named: "menu_icon.png")
        menuImageView.image = menuIconImage
        menuImageView.layer.position = CGPoint(x: 150, y: 150)
        let tapMenuImageView = UITapGestureRecognizer(target: self, action: "onTouchMenuImageView:")
        menuImageView.addGestureRecognizer(tapMenuImageView)
        menuImageView.userInteractionEnabled = true
        self.addSubview(menuImageView)
        
        //メニュークローズアイコン
        menuCloseImageView = UIImageView(frame: CGRectMake(0,0,60,60))
        let menuCloseImage = UIImage(named: "close_icon.png")
        menuCloseImageView.image = menuCloseImage
        menuCloseImageView.layer.position = CGPoint(x: 150, y: 150)
        let tapMenuCloseImageView = UITapGestureRecognizer(target: self, action: "onTouchMenuCloseImageView")
        self.addGestureRecognizer(tapMenuCloseImageView)
        menuCloseImageView.userInteractionEnabled = true
        menuCloseImageView.hidden = true
        self.addSubview(menuCloseImageView)
        
    }
    
    func onTouchMenuImageView(sender:UITapGestureRecognizer) {
        
        menuImageView.hidden = true
        menuCloseImageView.hidden = false
        menuBackGroundView.hidden = false
        
        UIView.animateWithDuration(
            0.2,
            delay: 0,
            options: UIViewAnimationOptions.CurveEaseOut,
            animations: { () -> Void in
                self.menuBackGroundView.transform = CGAffineTransformMakeScale(1, 1)
            },
            completion: { (finished: Bool) -> Void in
                self.menuBackGroundView.transform = CGAffineTransformMakeScale(1, 1);
            }
        )
    }
    
    func onTouchMenuCloseImageView() {
    
        menuImageView.hidden = false
        menuCloseImageView.hidden = true
        
        UIView.animateWithDuration(
            0.2,
            delay: 0,
            options: UIViewAnimationOptions.CurveEaseOut,
            animations: { () -> Void in
                self.menuBackGroundView.transform = CGAffineTransformMakeScale(0.01, 0.01)
            },
            completion: { (finished: Bool) -> Void in
                self.menuBackGroundView.hidden = true
            }
        )
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
    // Drawing code
    }
    */
    
}
