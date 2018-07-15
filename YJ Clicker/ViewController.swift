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
    @IBOutlet var jamesButton: UIButton!
    @IBOutlet var yjButton: UIButton!
    
    var clickPower = 1
    var counter = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        yjButton.isSelected = true
        let loadedPower = UserDefaults.standard.integer(forKey: "clickPower")
        clickPower = loadedPower
        let loadedClicks = UserDefaults.standard.integer(forKey: "clicks")
        counter = loadedClicks
        noOfTapsLabel.text = "Number of taps: \(counter)"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func jamesSelected(_ sender: Any) {
        if jamesButton.isSelected == false && yjButton.isSelected == true {
        jamesButton.isSelected = true
        yjButton.isSelected = false
            if let image = UIImage(named: "jamesface") {
        faceButton.setImage(image, for: .normal)
            }
        }
    }
    @IBAction func yjSelected(_ sender: Any) {
        if yjButton.isSelected == false && jamesButton.isSelected == true{
        yjButton.isSelected = true
        jamesButton.isSelected = false
        if let image = UIImage(named: "yjface") {
                faceButton.setImage(image, for: .normal)
            }
        }
    }
    @IBAction func buttonPressed(_ sender: Any) {
        counter = counter + clickPower
        noOfTapsLabel.text = "Number of taps: \(counter)"
        UserDefaults.standard.set(counter, forKey: "clicks")
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
    @IBAction func backToClickerScreen (with segue: UIStoryboardSegue) {
        if segue.identifier == "firstBack" {
            let source = segue.source as! GetHackingViewController
            counter = source.clicks
            clickPower = source.clickPowa
            noOfTapsLabel.text = "Number of taps: \(counter)"
            UserDefaults.standard.set(counter, forKey: "clicks")
            UserDefaults.standard.set(clickPower, forKey: "clickPower")
        }
    }
}

