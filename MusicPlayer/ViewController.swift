//
//  ViewController.swift
//  MusicPlayer
//
//  Created by Shruti Makwana on 26/02/24.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player : AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func keyPressed(_ sender: UIButton) {
        if(sender.tag == 1){
            playSound(tone: "A")
        }else if(sender.tag == 2){
            playSound(tone: "B")
        }else if(sender.tag == 3){
            playSound(tone: "C")
        }else if(sender.tag == 4){
            playSound(tone: "D")
        }else if(sender.tag == 5){
            playSound(tone: "E")
        }else if(sender.tag == 6){
            playSound(tone: "F")
        }else if(sender.tag == 7){
            playSound(tone: "G")
        }
        
    }
    
    func playSound(tone : String){
        guard let url = Bundle.main.url(forResource: tone, withExtension: "wav") else {
            return;
        }
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default);
            try AVAudioSession.sharedInstance().setActive(true);
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue);
            
            guard let player = player else { return }
            
            player.play();
        } catch let error {
            print(error.localizedDescription);
        }
    }


}

