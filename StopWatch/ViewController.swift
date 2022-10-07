//
//  ViewController.swift
//  StopWatch
//
//  Created by Nurzhan Ababakirov on 10/1/19.
//  Copyright © 2019 Nurzhan Ababakirov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    var counter = 0
    var timer1 = Timer()
    var running = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeLabel.text = "00:00:00"
        sideMenu()
    }

    
    @IBAction func stopButton0(_ sender: AnyObject) {
        timer1.invalidate()
        running = false
        counter = 0
        timeLabel.text = "00:00:00"
    }
   

  @IBAction func pauseButton(_ sender: AnyObject) {
       timer1.invalidate()
       running = false
   }
    
    @IBAction func playButton(_ sender: AnyObject) {
        if !running {
        timer1 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(UpdateTime), userInfo: nil, repeats: true)
        running = true
        }
    }
    @objc func UpdateTime(){
        counter =  counter + 1;
        var s0 = "0"
        var s1 = "0"
        var s2 = "0"
        if counter/3600>=10 {s0=""}
        if (counter/60)%60>=10 {s1=""}
        if counter%60>=10 {s2=""}
        
        timeLabel.text = String(format:"%@%d:%@%d:%@%d",s0,counter/3600,s1,(counter/60)%60,s2,counter%60);
    }
    
    func sideMenu(){
       if revealViewController() != nil{
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
        revealViewController().rearViewRevealWidth = 275
         view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
}

