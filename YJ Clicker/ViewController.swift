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
    
    var backgroundMusicPlayer = AVAudioPlayer()
    var clickPower = 1
    var counter = 0
    var imageName = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playBackgroundMusic(filename: "theme.mp3")
        let loadedPower = UserDefaults.standard.integer(forKey: "clickPower")
        clickPower = loadedPower
        let loadedClicks = UserDefaults.standard.integer(forKey: "clicks")
        let loadedImage = UserDefaults.standard.object(forKey: "imageName")
        imageName = loadedImage as? String ?? "yjface"
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

