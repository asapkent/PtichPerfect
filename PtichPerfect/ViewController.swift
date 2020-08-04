//
//  ViewController.swift
//  PtichPerfect
//
//  Created by Robert Jeffers on 8/3/20.
//  Copyright © 2020 AsapInc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func recordButtonPressed(_ sender: Any) {
        print("Record has been pressed!")
        recordingLabel.text = "Recording in Progress"
    }
    
    @IBAction func stopRecordingButtonPressed(_ sender: Any) {
        print("Stop Recording has been pressed!")
        recordingLabel.text = "Tap to Record"
    }
}

