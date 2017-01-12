//
//  xboxOne.swift
//  rocketStats
//
//  Created by Colson Hoxie on 1/9/17.
//  Copyright © 2017 Colson Hoxie. All rights reserved.
//

import UIKit
import Alamofire
import Kanna
import Foundation

class xboxOne: UIViewController {
    
    var xboxTag = ""
    var xboxURL = "https://rocketleaguestats.com/profile/xboxone/"
    var stats: [String] = []
    var counter = 0
    var ranks: [String] = ["", "", "", ""]
    var duel: [String] = []
    
    @IBOutlet weak var wins: UILabel!
    @IBOutlet weak var saves: UILabel!
    @IBOutlet weak var mvps: UILabel!
    @IBOutlet weak var mvpPerc: UILabel!
    @IBOutlet weak var goals: UILabel!
    @IBOutlet weak var shots: UILabel!
    @IBOutlet weak var assists: UILabel!
    @IBOutlet weak var shotAcc: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scrapeForStats()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrapeForStats() -> Void {
        xboxURL += xboxTag
        
        Alamofire.request(xboxURL).responseString { response in
            print("\(response.result.isSuccess)")
            if let html = response.result.value {
                self.parseHTML(html: html)
            }
        }
    }
    
    func parseHTML(html: String) -> Void {
        if let doc = Kanna.HTML(html: html, encoding: String.Encoding.utf8) {
            //finds the stats of the user
            if let nodes = doc.body?.xpath("//table[contains(@class,'profile_player')]/tbody/tr/td") {
                while counter != 16 {
                    stats.append(nodes[counter].text!)
                    counter += 1
                }
            }
            //This finds the rank of the user. x = 0 is solo, x= 2 is doubles, x=3 is solo standard, x=4 is standard
            if let rankNode = doc.body?.xpath("//p[@class = 'profile_tier-name']") {
                var x = 0
                while x != 4 {
                    ranks[x] = rankNode[x].text!
                    ranks[x] = ranks[x].replacingOccurrences(of: "\n", with: " ")
                    duel += ranks[x].components(separatedBy: "                         ")
                    x += 1
                }
//                print(duel)
            }
            self.setStats(statArray: stats)
        }
    }
    //sets the labels to the according stat
    func setStats(statArray: Array<String>) -> Void {
     //   print(statArray)
        wins.text = statArray[4]
        saves.text = statArray[5]
        mvps.text = statArray[6]
        mvpPerc.text = statArray[7]
        goals.text = statArray[12]
        shots.text = statArray[13]
        assists.text = statArray[14]
        shotAcc.text = statArray[15]
    }
}
