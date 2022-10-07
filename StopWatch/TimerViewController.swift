//
//  SecondViewController.swift
//  StopWatch
//
//  Created by Nurzhan Ababakirov on 10/3/19.
//  Copyright © 2019 Nurzhan Ababakirov. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    var s = 30
    var timer1 = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func slider(_ sender: UISlider) {
        
        s  = Int(sender.value)
        if (s == 60){
            timeLabel.text = String("00:01:00")
        }  else {
            timeLabel.text = String(format:"00:00:%02i",s)
        }
        }
    @IBAction func playButton(_ sender: Any) {
        timer1 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimerViewController.updateTimer), userInfo: nil, repeats: true)
    }
    
    @IBAction func stopButton(_ sender: Any) {
        timer1.invalidate()
        s = 30
        slider.setValue(30, animated: true)
        timeLabel.text = String("00:00:30")
    }
    
    @IBAction func pauseButton(_ sender: Any) {
        timer1.invalidate()
    }
    @objc func updateTimer(){
        s -= 1
        timeLabel.text = timeString(time: TimeInterval(s))
        slider.value = Float(s)
        
        if s == 0 {
            timer1.invalidate()
        }
    }
    
    func timeString(time: TimeInterval)->String{
        let h = Int(time)/3600
        let m = Int(time)/60%60
        let s = Int(time)%60
    
        return String(format: "%02i:%02i:%02i",h,m,s)
    }
    
    
}

