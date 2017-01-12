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

