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
    
    var hogeBtn: UIImageView!
    var fugaBtn: UIImageView!
    var piyoBtn: UIImageView!
    
    var delegate: MenuViewDelegate!
    
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
        menuImageView.image = UIImage(named: "menu_icon.png")
        menuImageView.layer.position = CGPoint(x: 150, y: 150)
        menuImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "onTouchMenuImageView:"))
        menuImageView.userInteractionEnabled = true
        self.addSubview(menuImageView)
        
        //メニュークローズアイコン
        menuCloseImageView = UIImageView(frame: CGRectMake(0,0,60,60))
        menuCloseImageView.image = UIImage(named: "close_icon.png")
        menuCloseImageView.layer.position = CGPoint(x: 150, y: 150)
        menuCloseImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "onTouchMenuCloseImageView:"))
        menuCloseImageView.userInteractionEnabled = true
        menuCloseImageView.hidden = true
        self.addSubview(menuCloseImageView)
        
        //メニューボタン
        hogeBtn = UIImageView(frame: CGRectMake(0,0,50,50))
        hogeBtn.image = UIImage(named: "1.png")
        hogeBtn.layer.position = CGPoint(x: 160, y: 50)
        hogeBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "onTouchHogeBtn:"))
        hogeBtn.userInteractionEnabled = true
        self.addSubview(hogeBtn)
        
        fugaBtn = UIImageView(frame: CGRectMake(0,0,50,50))
        fugaBtn.image = UIImage(named: "2.png")
        fugaBtn.layer.position = CGPoint(x: 85, y: 85)
        fugaBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "onTouchFugaBtn:"))
        fugaBtn.userInteractionEnabled = true
        self.addSubview(fugaBtn)
        
        piyoBtn = UIImageView(frame: CGRectMake(0,0,50,50))
        piyoBtn.image = UIImage(named: "3.png")
        piyoBtn.layer.position = CGPoint(x: 45, y: 160)
        piyoBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "onTouchPiyoBtn:"))
        piyoBtn.userInteractionEnabled = true
        self.addSubview(piyoBtn)
        
        self.hideMenuBtns()
        
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
                self.showMenuBtns()
            }
        )
    }
    
    func onTouchMenuCloseImageView(sender:UITapGestureRecognizer) {
    
        menuImageView.hidden = false
        menuCloseImageView.hidden = true
        
        self.hideMenuBtns()
        
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
    
    func onTouchHogeBtn(sender:UITapGestureRecognizer) {
        delegate.onTouchHogeBtn()
    }
    
    func onTouchFugaBtn(sender:UITapGestureRecognizer) {
        delegate.onTouchFugaBtn()
    }
    
    func onTouchPiyoBtn(sender:UITapGestureRecognizer) {
        delegate.onTouchPiyoBtn()
    }
    
    func showMenuBtns() {
        hogeBtn.hidden = false
        fugaBtn.hidden = false
        piyoBtn.hidden = false
    }
    
    func hideMenuBtns() {
        hogeBtn.hidden = true
        fugaBtn.hidden = true
        piyoBtn.hidden = true
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
    // Drawing code
    }
    */
    
}
