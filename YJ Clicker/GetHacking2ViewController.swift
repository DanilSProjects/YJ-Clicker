//
//  GetHacking2ViewController.swift
//  YJ Clicker
//
//  Created by Daniel on 15/7/18.
//  Copyright © 2018 Placeholder Interactive. All rights reserved.
//

import UIKit

class GetHacking2ViewController: UIViewController {
    var secondPageClicks = Int()
    @IBOutlet var secClicksLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secClicksLabel.text = "CLICKS: \(secondPageClicks)"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func warPressed(_ sender: Any) {
        if secondPageClicks >= 5000 {
            secondPageClicks  = secondPageClicks - 5000
            performSegue(withIdentifier: "warScreen", sender: nil)
        } else if secondPageClicks <= 5000 {
            print ("ACCESS DENIED")
        }
    }
    @IBAction func peacePressed(_ sender: Any) {
        if secondPageClicks >= 5001 {
            secondPageClicks  = secondPageClicks - 5001
            performSegue(withIdentifier: "peaceScreen", sender: nil)
        } else if secondPageClicks <= 5001 {
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

    @IBAction func backPressed2(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    @IBAction func page1Pressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
