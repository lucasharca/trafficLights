//
//  ViewController.swift
//  TrafficLights
//
//  Created by radix on 05/06/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var trafficLightsImage: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var startStopButton: UIButton!
    
    var startTimer = Timer();
    var scoreTimer = Timer();
    
    var timerInt: Int = 0;
    var scoreInt: Int = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        scoreInt = 0;
        timerInt = 0;
    
    }
    
    @IBAction func startGame(_ sender: Any) {
        if scoreInt == 0 {
            
            timerInt = 3
            trafficLightsImage.image = UIImage(named: "trafficLight")
            
            startTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            
            startStopButton.isEnabled = false
            startStopButton.setTitle("", for: UIControl.State.normal)
            label.text = String(scoreInt)
        } else {
            scoreTimer.invalidate()
            
            scoreInt = 0;
            startStopButton.setTitle("Restart", for: UIControl.State.normal)
        }
    }
    
    @objc func updateTimer() {
        
        timerInt -= 1
        
        if timerInt == 2 {
            trafficLightsImage.image = UIImage(named: "trafficLight3")
        } else if timerInt == 1 {
            trafficLightsImage.image = UIImage(named: "trafficLight2")
        } else if timerInt == 0 {
            trafficLightsImage.image = UIImage(named: "trafficLight1")
            startTimer.invalidate()
            scoreTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateScoreTimer), userInfo: nil, repeats: true)
            startStopButton.isEnabled = true
            startStopButton.setTitle("Stop", for: UIControl.State.normal)
        }
    }
    
    @objc func updateScoreTimer() {
        scoreInt += 1
        label.text = String(scoreInt)
    }
    
}

