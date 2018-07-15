//
//  ViewController.swift
//  YJ Clicker
//
//  Created by Daniel on 14/7/18.
//  Copyright © 2018 Placeholder Interactive. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var faceButton: UIButton!
    @IBOutlet var noOfTapsLabel: UILabel!
    
    var clickPower = 1
    var counter = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        noOfTapsLabel.text = "Number of taps: 0"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(_ sender: Any) {
        counter = counter + clickPower
        noOfTapsLabel.text = "Number of taps: \(counter)"
        UIView.animate(withDuration: 0.1, delay: 0, options: [.allowUserInteraction], animations: {
            
            let transformation = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.faceButton.transform = transformation
            
        }) { (_) in
            UIView.animate(withDuration: 0.1, animations: {
                self.faceButton.transform = CGAffineTransform.identity
            })
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToWebsite" {
            let destination = segue.destination as! GetHackingViewController
            destination.clicks = counter
        }
    }
}

