//
//  ViewController.swift
//  tips
//
//  Created by Darren Cheng on 1/7/15.
//  Copyright (c) 2015 sanguinerane. All rights reserved.
//

import UIKit

public class ViewController: UIViewController, UITextFieldDelegate {

  @IBOutlet public weak var billField: UITextField!
  @IBOutlet public weak var tipLabel: UILabel!
  @IBOutlet public weak var totalLabel: UILabel!
  @IBOutlet public weak var tipControl: UISegmentedControl!

  override public func viewDidLoad() {
    super.viewDidLoad()
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