//
//  GetHackingViewController.swift
//  YJ Clicker
//
//  Created by Daniel on 14/7/18.
//  Copyright © 2018 Placeholder Interactive. All rights reserved.
//

import UIKit

class GetHackingViewController: UIViewController {
    @IBOutlet var clicksLabel: UILabel!
    var clicks = Int()
    var clickPowa = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let loadedPowa = UserDefaults.standard.integer(forKey: "clickPowa")
        clickPowa = loadedPowa
        clicksLabel.text = "CLICKS: \(clicks)"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func reset(_ sender: Any) {
        clickPowa = 1
        UserDefaults.standard.set(clickPowa, forKey: "clickPowa")
    }
    
    @IBAction func batPressed(_ sender: Any) {
        if clicks >= 50 {
        clicks = clicks - 50
        clicksLabel.text = "CLICKS: \(clicks)"
        clickPowa += 1
        UserDefaults.standard.set(clickPowa, forKey: "clickPowa")
        print (clickPowa)
        } else if clicks <= 50 {
            print ("ACCESS DENIED")
        }
    }
    @IBAction func panPressed(_ sender: Any) {
        if clicks >= 780 {
            clicks = clicks - 780
            clicksLabel.text = "CLICKS: \(clicks)"
            clickPowa += 3
            UserDefaults.standard.set(clickPowa, forKey: "clickPowa")
        } else if clicks <= 780 {
            print ("ACCESS DENIED")
        }
    }
    @IBAction func robotPressed(_ sender: Any) {
        if clicks >= 1560 {
            clicks = clicks - 1560
            clicksLabel.text = "CLICKS: \(clicks)"
            clickPowa += 5
            UserDefaults.standard.set(clickPowa, forKey: "clickPowa")
        } else if clicks <= 1560 {
            print ("ACCESS DENIED")
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "secondPage" {
            let destination = segue.destination as! GetHacking2ViewController
            destination.secondPageClicks = clicks
        }
    }
}
