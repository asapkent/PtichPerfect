//
//  PlaySoundsViewController.swift
//  PtichPerfect
//
//  Created by Robert Jeffers on 8/6/20.
//  Copyright © 2020 AsapInc. All rights reserved.
//

import UIKit

class PlaySoundsViewController: UIViewController {
    
    @IBOutlet weak var slowButton: UIButton!
    @IBOutlet weak var highButton: UIButton!
    @IBOutlet weak var fastButton: UIButton!
    @IBOutlet weak var lowButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var recordedAudioURL: URL!
    
    @IBAction func playSoundForButton(_ sender: UIButton) {
        print("Play Sound Button Pressed")
    }

    @IBAction func stopButtonPressed(_ sender: AnyObject) {
        print("Stop Audio Button Pressed")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
