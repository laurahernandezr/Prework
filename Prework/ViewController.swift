//
//  ViewController.swift
//  Prework
//
//  Created by Laura Hernandez on 1/26/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billAmountView: UIView!
    @IBOutlet weak var totalView: UIView!
    @IBOutlet weak var subtotalLabel: UILabel!
    
    @IBOutlet weak var perPersonLabel: UILabel!
    @IBOutlet weak var partySizeControl: UIStepper!
    @IBOutlet weak var partySizeLabel: UILabel!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        billAmountView.layer.cornerRadius = 10
        totalView.layer.cornerRadius = 10
        partySizeControl.minimumValue = 1
        partySizeControl.maximumValue = 50
        
        let defaults = UserDefaults.standard
        let per1 = defaults.string(forKey: "percentage1") ?? "15"
        let per2 = defaults.string(forKey: "percentage2") ?? "18"
        let per3 = defaults.string(forKey: "percentage3") ?? "20"
        // not sending the right numbers from the settings view!
        tipControl.setTitle(String(per1 + "%"), forSegmentAt: 0)
        tipControl.setTitle(String(per2 + "%"), forSegmentAt: 1)
        tipControl.setTitle(String(per3 + "%"), forSegmentAt: 2)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       
    }
    @IBAction func calculateTip(_ sender: Any) {
        
        //1. Get bill amount from text field
        let bill = Double(billAmountTextField.text!) ?? 0
        // Get party size
        let partySize = Int(partySizeControl.value)
        //Update subtotal label
        subtotalLabel.text = String(format: "$%.2f", bill)
            
        // Get total tip my multiplying tip * tipPercentage
        let tipPercentages = [0.15,0.18,0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        //Calculate per person bill
        let perPerson = total/Double(partySize)
        
        // Update tip amount label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        //Update Total Amount
        totalLabel.text = String(format: "$%.2f", total)
        // Update Per Person label
        perPersonLabel.text = String(format: "$%.2f", perPerson)
        print(partySize)
        //Update Party Size label
        partySizeLabel.text = String(format: "%d", partySize)
    }
    

}

