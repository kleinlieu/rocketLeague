//
//  ViewController.swift
//  rocketStats
//
//  Created by Colson Hoxie on 1/9/17.
//  Copyright © 2017 Colson Hoxie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gamerTag: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Usually people would want to declare their string staticly
        // at the top of the class file like so
        // ```
        // static let kVCSegueIDXbox = "toXbox"
        // static let kVCSegueIDPSN = "toPsn"
        // ...
        // if segue.identifier == kVCSegueIDXbox  {}
        // ```
        // Note: k stands for constant btw.
        // This is both an optimization (since a string literal does not get allocated multiple times)
        // and a concise coding style. That way if you ever have to reference your segue IDs,
        // you only have to change them in one place. 

        if segue.identifier == "toXbox"{
            let vc = segue.destination as! xboxOne
            vc.xboxTag = gamerTag.text!
        }
        
        if segue.identifier == "toPsn"{
            let vc = segue.destination as! PSN
            vc.psnTag = gamerTag.text!
        }
    }

}

