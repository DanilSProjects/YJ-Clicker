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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clicksLabel.text = "CLICKS: \(clicks)"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "secondPage" {
            let destination = segue.destination as! GetHacking2ViewController
            destination.secondPageClicks = clicks
        }
    }
}
