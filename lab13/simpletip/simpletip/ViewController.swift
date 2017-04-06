//
//  ViewController.swift
//  simpletip
//
//  Created by Adam Lewis on 6/8/15.
//  Copyright (c) 2015 Adam Lewis. All rights reserved.
//

import Foundation
import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountSlider: UISlider!
    @IBOutlet weak var variableTipRateLabel: UILabel!
 
    @IBOutlet weak var fixedTipAmountTF: UITextField!
    @IBOutlet weak var fixedTipBillTF: UITextField!
    @IBOutlet weak var variableTipAmountTF: UITextField!
    @IBOutlet weak var variableTipBillTF: UITextField!
    
    var variableTipRate = NSDecimalNumber(string: "0.18")
    let decimal100 = NSDecimalNumber(string: "100.0")
    let decimal15 = NSDecimalNumber(string: "0.15")
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billAmountTextField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func updateTipRate(_ sender: AnyObject) {
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.percent
        variableTipRate = NSDecimalNumber(value: tipAmountSlider.value as Float)
        let vtrDesc = " " + formatter.string(from: variableTipRate)!
        variableTipRateLabel.text = vtrDesc
    }

    @IBAction func calculateTip(_ sender: AnyObject) {
        // Compute fixed amounts
        let billAmount = NSDecimalNumber(string: billAmountTextField.text)
        let fixedTipAmount = billAmount.multiplying(by: decimal15)
        let fixedBillAmount = billAmount.adding(fixedTipAmount)
        // Computer variable amount
        let variableTipAmount = billAmount.multiplying(by: variableTipRate)
        let variableTipBill = billAmount.adding(variableTipAmount)
        // Update variable fields
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.currency
        variableTipAmountTF.text = " " + formatter.string( from: variableTipAmount)!
        variableTipBillTF.text = " " + formatter.string(from: variableTipBill)!
        // Update fixed fields
        fixedTipAmountTF.text = " " + formatter.string(from: fixedTipAmount)!
        fixedTipBillTF.text = " " + formatter.string(from: fixedBillAmount)!
        
    }

}

