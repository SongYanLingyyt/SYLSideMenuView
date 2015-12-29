//
//  NextViewController.swift
//  YLSideLipView
//
//  Created by 岚海网络 on 15/12/25.
//  Copyright © 2015年 岚海网络. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    @IBAction func backAction(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBOutlet weak var textLabel: UILabel!
    var text: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textLabel.text = self.text
        
    }

}
