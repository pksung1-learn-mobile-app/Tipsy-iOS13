//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var tip: Tip = Tip()

    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    
    @IBOutlet weak var splitStepper: UIStepper!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var splitValue: Float = 0
    var tipPercent: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        splitNumberLabel.text = "\(splitStepper.value)"
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        twentyPctButton.isSelected = false
        tenPctButton.isSelected = false
        
        switch sender.currentTitle {
        case zeroPctButton.currentTitle:
            tipPercent = 0.0
        case tenPctButton.currentTitle:
            tipPercent = 0.1
        case twentyPctButton.currentTitle:
            tipPercent = 0.2
        default:
            print("nothing")
        }
        
        
        
        sender.isSelected = true
    }


    @IBAction func calculatePressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    @IBAction func pressedStepper(_ sender: UIStepper) {
        splitValue = Float(sender.value)
        splitNumberLabel.text = "\(splitValue)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
            
            let bill = Float(billTextField.text ?? "0.0") ?? 0.0
            let totalValue = (bill + bill * tipPercent) / Float(splitStepper.value)
            if (segue.identifier == "goToResult") {
                let destinationVC = segue.destination as! ResultViewController
                destinationVC.result = totalValue
            }
    }
}

