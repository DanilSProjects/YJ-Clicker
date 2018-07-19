//
//  WarViewController.swift
//  
//
//  Created by Daniel on 17/7/18.
//

import UIKit
import AVFoundation

class WarViewController: UIViewController {
    
    var backgroundMusicPlaya = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        backgroundMusicPlayer.stop()
        playBackgroundMusic(filename: "boo.mp3")
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
            backgroundMusicPlaya = try AVAudioPlayer(contentsOf: newURL)
            backgroundMusicPlaya.numberOfLoops = 0
            backgroundMusicPlaya.prepareToPlay()
            backgroundMusicPlaya.play()
        } catch let error as NSError {
            print(error.description)
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

}
