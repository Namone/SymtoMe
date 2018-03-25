//
//  ViewController.swift
//  SymptoMe
//
//  Created by Alex Nordhausen on 3/25/18.
//  Copyright © 2018 Alex Nordhausen. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {
    
    let userDefaults = UserDefaults.standard
    var recordedNumbers: [String]!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var ratingSetter: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if(userDefaults.object(forKey: "recordedValues") != nil) {
            recordedNumbers = userDefaults.object(forKey: "recordedValues") as! [String]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didClickStepper(_ sender: Any) {
        
        if(rating !== nil && ratingSetter !== nil) {
            rating!.text = String(format: "%.1f", ratingSetter!.value)
        }
    }
    
    @IBAction func didClickRecord(_ sender: Any) {
        
        let currentRating = rating.text!
        recordedNumbers.append(currentRating)
        
        // Save it into local storage
        userDefaults.set(recordedNumbers, forKey: "recordedValues")
    }
}

