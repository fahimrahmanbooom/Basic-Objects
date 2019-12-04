//
//  ViewController.swift
//  Basic Objects
//
//  Created by Fahim Rahman on 4/12/19.
//  Copyright © 2019 Fahim Rahman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    // Label outlet
    @IBOutlet weak var outputLabel: UILabel!
    
    // Input text field outlet
    @IBOutlet weak var textFieldInput: UITextField!
    
    // Slider outlet
    @IBOutlet weak var slider: UISlider!
    
    // Progress View Outlet
    @IBOutlet weak var progressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Empty label when initialized
        outputLabel.text = ""
    }
    
    // Action Button Action
    @IBAction func actionButton(_ sender: UIButton) {
        
        // Sending text through button action
        outputLabel.text = textFieldInput.text
        textFieldInput.text = ""
    }
    
    // Clear Button Action
    @IBAction func clearButton(_ sender: UIButton) {
        
        // Clear the label
        outputLabel.text = ""
        
        // Progress View
        progressView.setProgress(currentTime, animated: true)
        perform(#selector(updateProgress), with: nil, afterDelay: 1.0)
    }
    
    // Strepper Action
    @IBAction func stepper(_ sender: UIStepper) {
        outputLabel.text = String(sender.value)
    }
    
    // Slider Action
    @IBAction func slider(_ sender: UISlider) {
        outputLabel.text = String(Int(slider.value))
    }
    
    // Switch Action
    @IBAction func `switch`(_ sender: UISwitch) {
        
        // Switch State
        if sender.isOn == false {
            outputLabel.text = "Switch is OFF"
        }
        if sender.isOn == true {
            outputLabel.text = "Switch is ON"
        }
    }
    
    // Progress View
    let maxTime: Float = 5.0
    var currentTime: Float = 0.0
    
    @objc func updateProgress() {
        currentTime = currentTime + 1.0
        progressView.progress = currentTime / maxTime
        outputLabel.text = "\(currentTime)"
        
        if currentTime < maxTime {
            perform(#selector(updateProgress), with: nil, afterDelay: 1.0)
        }
        else {
            currentTime = 0.0
            outputLabel.text = ""
        }
    }
}
