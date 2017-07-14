//
//  TipViewController.swift
//  PreTipCalculator
//
//  Created by LouieDavis on 7/3/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {
    
    enum TipPercentage: Int {
        case fifteenpercent
        case eighteenpercent
        case twentypercent
        
    }
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billAmountField: UITextField!
    @IBOutlet weak var tipSelector: UISegmentedControl!
    @IBOutlet weak var tipAmountField: UITextField!
    @IBOutlet weak var totalAmountField: UITextField!
    
    @IBAction func calculateTip(_ sender: UIButton) {
        guard let billAmount = Double(billAmountField.text!) else {
            // show error
            tipAmountField.text = ""
            totalAmountField.text = ""
            return
        }
        
        var tipPercentage = 0.0
        
        switch tipSelector.selectedSegmentIndex {
        case 0:
            tipPercentage = 0.15
        case 1:
            tipPercentage = 0.18
        case 2:
            tipPercentage = 0.20
        default:
            break
        }
        
        let roundedBillAmount = round(100*billAmount)/100
        let tipAmount = roundedBillAmount * tipPercentage
        let roundedTipAmount = round(100*tipAmount)/100
        let totalAmount = roundedBillAmount + roundedTipAmount
        
        if (!billAmountField.isEditing) {
            billAmountField.text = String(format: "%.2f", roundedBillAmount)
        }
        tipAmountField.text = String(format: "%.2f", roundedTipAmount)
        totalAmountField.text = String(format: "%.2f", totalAmount)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func setTip(_ sender: UIButton) {
        
        /*
        if segmentedControl.selectedSegmentIndex == 0 {
            tipLabel.text = "15%"
        } else if segmentedControl.selectedSegmentIndex == 1 {
            tipLabel.text = "18%"
        } else if segmentedControl.selectedSegmentIndex == 2 {
            tipLabel.text = "20%"
        }
 */
        /*
        switch segmentedControl.selectedSegmentIndex {
        case 0: tipLabel.text = "15%"
        case 1: tipLabel.text = "18%"
        case 2: tipLabel.text = "20%"
        default: break
        }
 */
        if let tipPercent = TipPercentage(rawValue: segmentedControl.selectedSegmentIndex) {
            switch tipPercent {
            case .fifteenpercent: tipLabel.text = "15%"
            case .eighteenpercent: tipLabel.text = "18%"
            case .twentypercent: tipLabel.text = "20%"
            
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    

}

