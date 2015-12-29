//
//  SYLSideSlipView.swift
//  YLSideLipView
//
//  Created by 岚海网络 on 15/12/24.
//  Copyright © 2015年 岚海网络. All rights reserved.
//

import UIKit

class SYLSideSlipView: UIView {

    var isOpen: Bool!
    var tap: UITapGestureRecognizer!
    var leftSwipe: UISwipeGestureRecognizer!
    var rightSwipe: UISwipeGestureRecognizer!
    var blurImageView: UIImageView!
    var contentView: UIView!
    var mySender: UIViewController!

    let SLIP_WIDTH: CGFloat = 250
    let bound = UIScreen.mainScreen().bounds
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(sender: UIViewController) {
    
        let frame = CGRectMake(-self.SLIP_WIDTH, 0, self.SLIP_WIDTH, bound.size.height)
        
        super.init(frame: frame)
        
        self.initViews(sender)
        
    }
    
    

    func initViews(sender: UIViewController) {
        
        self.mySender = sender
        self.isOpen = false
        self.tap = UITapGestureRecognizer(target: self, action: "tapAction:")
        
        self.leftSwipe = UISwipeGestureRecognizer(target: self, action: "hide")
        self.leftSwipe.direction = UISwipeGestureRecognizerDirection.Left
        
        self.rightSwipe = UISwipeGestureRecognizer(target: self, action: "show")
        self.rightSwipe.direction = UISwipeGestureRecognizerDirection.Right
        
        self.mySender.view.addGestureRecognizer(self.leftSwipe)
        self.mySender.view.addGestureRecognizer(self.rightSwipe)
        
        self.blurImageView = UIImageView(frame: CGRectMake(self.SLIP_WIDTH, 0, bound.width, bound.height))
        self.blurImageView.userInteractionEnabled = false
        self.blurImageView.alpha = 0
        self.blurImageView.backgroundColor = UIColor.grayColor()
        self.addSubview(self.blurImageView)
        
    }
    
    func show(isShow: Bool) {
        
        let image = self.image(fromView: self.mySender.view)
        
        if isOpen == false {
            self.blurImageView.alpha = 1
        }
        
        var x: CGFloat!
        if isShow == true {
            x = 0.0
        } else {
            x = -self.SLIP_WIDTH
        }
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            
            self.frame = CGRectMake(x, 0, self.SLIP_WIDTH, self.bound.height)
            if self.isOpen == false {
                self.blurImageView.image = image
            }
            
            }) { (finished) -> Void in
                self.isOpen = isShow
                if self.isOpen == false {
                    self.blurImageView.alpha = 0
                    self.blurImageView.image = nil
//                    print("hidden")
                }
        }
        
    }
    
    
    func addContentView(view: UIView) {
        
        self.contentView = view
        contentView.frame = CGRectMake(0, 0, self.frame.width, self.frame.height)
        self.addSubview(self.contentView)
        
    }
   
    func switchMenu() {
        self.mySender.view.addGestureRecognizer(self.tap)
        self.show(!self.isOpen)
    }
    
    func show() {
        self.show(true)
        self.mySender.view.addGestureRecognizer(self.tap)
    }
    
    func hide() {
        self.show(false)
        self.mySender.view.removeGestureRecognizer(self.tap)
    }
    
    func tapAction(tap: UITapGestureRecognizer) {
        self.hide()
    }
    
    //shot
    func image(fromView theView: UIView) -> UIImage {
        
        //加模糊效果 0。0 - 1.0
        UIGraphicsBeginImageContextWithOptions(theView.frame.size, true, 0.1)
        
        //不加模糊效果
//        UIGraphicsBeginImageContext(theView.frame.size)
        
        let context = UIGraphicsGetCurrentContext()
        theView.layer.renderInContext(context!)
        let theImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return theImage
    }
    
}
