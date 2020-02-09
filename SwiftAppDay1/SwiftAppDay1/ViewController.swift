//
//  ViewController.swift
//  SwiftAppDay1
//
//  Created by cse on 2020. 2. 3..
//  Copyright © 2020년 cse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lbMsg: UILabel!
    @IBOutlet weak var lbMsg2: UILabel!
    @IBOutlet weak var tfInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lbMsg2.text = "swift App"
        lbMsg.text = "2020년 2월"
    }

    @IBOutlet weak var subLayer: UIView!
    
    @IBAction func doEnter(_ sender: Any) {
        lbMsg.text = "버튼"
        subLayer.backgroundColor = UIColor.gray
    }
    
    @IBAction func showText(_ sender: Any) {
        tfInput.text = "123"
        lbMsg.text = tfInput.text
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

