//
//  ViewController.swift
//  tips
//
//  Created by Darren Cheng on 1/7/15.
//  Copyright (c) 2015 sanguinerane. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

  @IBOutlet weak var billField: UITextField!
  @IBOutlet weak var tipLabel: UILabel!
  @IBOutlet weak var totalLabel: UILabel!
  @IBOutlet weak var tipControl: UISegmentedControl!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.

    billField.text = "Hello"
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func onEditingChanged(sender: AnyObject) {
    var tipPercentages = [0.18, 0.2, 0.22]
    var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]

    var billAmount = (billField.text as NSString).doubleValue
    var tip = billAmount * tipPercentage
    var total = billAmount + tip

    tipLabel.text = String(format: "$%.2f", tip)
    totalLabel.text = String(format: "$%.2f", tip)
  }

  @IBAction func onTap(sender: AnyObject) {
    billField.endEditing(true)
  }

}