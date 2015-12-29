//
//  ViewController.swift
//  YLSideLipView
//
//  Created by 岚海网络 on 15/12/24.
//  Copyright © 2015年 岚海网络. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var sideSlipView: SYLSideSlipView!
    var titleLab: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ImageV = UIImageView(frame: self.view.frame)
        ImageV.image = UIImage(named: "bg_night_sunny.jpg")
        ImageV.userInteractionEnabled = true
        self.view.addSubview(ImageV)
        
        let btn = UIButton(frame: CGRectMake(100, 100, 50, 50))
        btn.backgroundColor = UIColor.blueColor()
        btn.addTarget(self, action: "btnAction:", forControlEvents: .TouchUpInside)
        ImageV.addSubview(btn)
    
        self.titleLab = UILabel(frame: CGRectMake(100, 200, 100, 50))
        self.titleLab.textColor = UIColor.redColor()
        ImageV.addSubview(self.titleLab)
        
        self.sideSlipView = SYLSideSlipView(sender: self)
        self.sideSlipView.backgroundColor = UIColor.redColor()
        
        let menu = MenuView(frame: self.sideSlipView.frame)
        menu.initBlock { (index) -> Void in
            
            self.sideSlipView.switchMenu()
            
//            let nextVC = NextViewController(nibName: "NextViewController", bundle: nil)
//            nextVC.text = "我是第\(index)行"
            
//            self.presentViewController(nextVC, animated: true, completion: nil)
            self.titleLab.text = "我是第\(index)"
            
        }
        self.sideSlipView.addContentView(menu)
        
        ImageV.addSubview(self.sideSlipView)
        
    }

    func btnAction(btn: UIButton) {
        self.sideSlipView.switchMenu()
    }
    
}

