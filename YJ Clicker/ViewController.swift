//
//  ViewController.swift
//  YJ Clicker
//
//  Created by Daniel on 14/7/18.
//  Copyright © 2018 Placeholder Interactive. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet var faceButton: UIButton!
    @IBOutlet var noOfTapsLabel: UILabel!
    @IBOutlet var jamesButton: UIButton!
    @IBOutlet var yjButton: UIButton!
    @IBOutlet var batCounter: UILabel!
    @IBOutlet var panCounter: UILabel!
    @IBOutlet var robotCounter: UILabel!
    
    var backgroundMusicPlayer = AVAudioPlayer()
    var clickPower = 1
    var counter = 0
    var imageName = String()
    var batNo = 0
    var panNo = 0
    var robotNo = 0
    var isItReset = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playBackgroundMusic(filename: "theme.mp3")
        let loadedPower = UserDefaults.standard.integer(forKey: "clickPower")
        clickPower = loadedPower
        let loadedClicks = UserDefaults.standard.integer(forKey: "clicks")
        let loadedImage = UserDefaults.standard.object(forKey: "imageName")
        imageName = loadedImage as? String ?? "yjface"
        let loadedBat = UserDefaults.standard.integer(forKey: "batNo")
        let loadedPan = UserDefaults.standard.integer(forKey: "panNo")
        let loadedBot = UserDefaults.standard.integer(forKey: "robotNo")
        batCounter.text = ("\(loadedBat)")
        panCounter.text = ("\(loadedPan)")
        robotCounter.text = ("\(loadedBot)")
        if let image = UIImage(named: imageName) {
            faceButton.setImage(image, for: .normal)
        }
        counter = loadedClicks
        noOfTapsLabel.text = "Number of taps: \(counter)"
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func plus5000(_ sender: Any) {
        counter += 5000
        noOfTapsLabel.text = "Number of taps: \(counter)"
        UserDefaults.standard.set(counter, forKey: "clicks")
    }
    func playBackgroundMusic(filename: String) {
        let url = Bundle.main.url(forResource: filename, withExtension: nil)
        guard let newURL = url else {
            print("Could not find file: \(filename)")
            return
        }
        do {
            backgroundMusicPlayer = try AVAudioPlayer(contentsOf: newURL)
            backgroundMusicPlayer.numberOfLoops = -1
            backgroundMusicPlayer.prepareToPlay()
            backgroundMusicPlayer.play()
        } catch let error as NSError {
            print(error.description)
        }
    }

    @IBAction func jamesSelected(_ sender: UIButton) {
        imageName = "jamesface"
        UserDefaults.standard.set(imageName, forKey: "imageName")
            if let image = UIImage(named: imageName) {
        faceButton.setImage(image, for: .normal)
            }
        
    }
    @IBAction func yjSelected(_ sender: UIButton) {
        imageName = "yjface"
        UserDefaults.standard.set(imageName, forKey: "imageName")
        if let image = UIImage(named: imageName) {
                faceButton.setImage(image, for: .normal)
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
            destination.isResetTouched = isItReset
        }
    }
    @IBAction func backToClickerScreen (with segue: UIStoryboardSegue) {
        if segue.identifier == "firstBack" {
            let source = segue.source as! GetHackingViewController
            counter = source.clicks
            clickPower = source.clickPowa
            noOfTapsLabel.text = "Number of taps: \(counter)"
            batNo = source.batNum
            panNo = source.panNum
            robotNo = source.panNum
            batCounter.text = ("\(batNo)")
            panCounter.text = ("\(panNo)")
            robotCounter.text = ("\(robotNo)")
            UserDefaults.standard.set(counter, forKey: "clicks")
            UserDefaults.standard.set(clickPower, forKey: "clickPower")
            UserDefaults.standard.set(batNo, forKey: "batNo")
            UserDefaults.standard.set(panNo, forKey: "panNo")
            UserDefaults.standard.set(robotNo, forKey: "robotNo")
            isItReset = false
        }
        
        if segue.identifier == "warUnwind" {
            batNo = 0
            panNo = 0
            robotNo = 0
            UserDefaults.standard.set(batNo, forKey: "batNo")
            UserDefaults.standard.set(panNo, forKey: "panNo")
            UserDefaults.standard.set(robotNo, forKey: "robotNo")
            batCounter.text = ("\(batNo)")
            panCounter.text = ("\(panNo)")
            robotCounter.text = ("\(robotNo)")
            counter = 0
            UserDefaults.standard.set(counter, forKey: "clicks")
            noOfTapsLabel.text = "Number of taps: \(counter)"
            clickPower = 1
            UserDefaults.standard.set(clickPower, forKey: "clickPower")
            isItReset = true
            
        }
    }
}

