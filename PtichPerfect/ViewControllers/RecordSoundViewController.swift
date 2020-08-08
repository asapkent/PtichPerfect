//
//  RecordSoundViewController.swift
//  PtichPerfect
//
//  Created by Robert Jeffers on 8/3/20.
//  Copyright © 2020 AsapInc. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundViewController: UIViewController {
    var audioRecorder: AVAudioRecorder!
    
    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       stopRecordingButton.isEnabled = false
    }

    @IBAction func recordButtonPressed(_ sender: Any) {
        recordingLabel.text = "Recording in Progress"
        stopRecordingButton.isEnabled = true
        recordButton.isEnabled = false
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
               let recordingName = "recordedVoice.wav"
               let pathArray = [dirPath, recordingName]
               let filePath = URL(string: pathArray.joined(separator: "/"))
               let session = AVAudioSession.sharedInstance()
        
               try! session.setCategory(AVAudioSession.Category.playAndRecord, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.defaultToSpeaker)

               try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
               audioRecorder.delegate = self
               audioRecorder.isMeteringEnabled = true
               audioRecorder.prepareToRecord()
               audioRecorder.record()
    }
    
    @IBAction func stopRecordingButtonPressed(_ sender: Any) {
        recordButton.isEnabled = true
        stopRecordingButton.isEnabled = false
        recordingLabel.text = "Tap to Record"
        
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "recordsegue" {
            let playSoundsVC = segue.destination as! PlaySoundsViewController
            let recordedAudioURL = sender as! URL
            playSoundsVC.recordedAudioURL = recordedAudioURL
        }
    }
}

extension RecordSoundViewController: AVAudioRecorderDelegate {
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
            performSegue(withIdentifier: "recordsegue", sender: audioRecorder.url)
        } else {
           print("Something went wrong.")
        }
    }
}
