//
//  MenuView.swift
//  YLSideLipView
//
//  Created by 岚海网络 on 15/12/25.
//  Copyright © 2015年 岚海网络. All rights reserved.
//

import UIKit
typealias BtnBlock = (index: NSInteger) -> Void

class MenuView: UIView {
    
    var myBlock = BtnBlock?()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        for i in 0 ... 7 {
            let btn = UIButton(frame: CGRectMake(10, 100 + 50 * CGFloat(i), 100, 50))
            btn.setTitle("第\(i + 1)行", forState: .Normal)
            btn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            btn.tag = i + 1
            btn.addTarget(self, action: "btnAction:", forControlEvents: .TouchUpInside)
            self.addSubview(btn)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initBlock(block: (index: NSInteger) -> Void) {
        myBlock = block
    }
    
    func btnAction(btn: UIButton) {
        
        let tag = btn.tag
        
        self.myBlock!(index: tag)
    }

}
