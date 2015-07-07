//
//  ViewController.swift
//  ios_stater
//
//  Created by IvanLe on 7/7/15.
//  Copyright (c) 2015 IvanLe. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ZFTokenFieldDataSource, ZFTokenFieldDelegate {

    @IBOutlet weak var tokenField: ZFTokenField!
    
    var tokens: Array<String>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tokens = Array<String>()
        self.tokens.append("Chung cu quan 4")
        self.tokens.append("4 den 5")
        self.tokens.append("Chung cu quan 6")
        self.tokenField.dataSource = self
        self.tokenField.delegate = self
        self.tokenField.reloadData()

    }
    
    
    func lineHeightForTokenInField(tokenField: ZFTokenField!) -> CGFloat {
        return 40
    }
    
    func numberOfTokenInField(tokenField: ZFTokenField!) -> UInt {
        return UInt(self.tokens.count)
    }
    
    func tokenField(tokenField: ZFTokenField!, viewForTokenAtIndex index: UInt) -> UIView! {
        let view: UIView = NSBundle.mainBundle().loadNibNamed("TokenView", owner: nil, options: nil)[0] as! UIView
        
        let lbl:UILabel = view.viewWithTag(2) as! UILabel
        let btn: UIButton = view.viewWithTag(3) as! UIButton
        
        let indexInt: Int = Int(index)
        
        lbl.text = self.tokens[indexInt]
        let size: CGSize = lbl.sizeThatFits(CGSizeMake(1000, 40))
        view.frame = CGRectMake(0, 0, size.width + 97, 40)

        return view
    }
    
    func tokenMarginInTokenInField(tokenField: ZFTokenField!) -> CGFloat {
        return 5
    }
}

