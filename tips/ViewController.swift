//
//  ViewController.swift
//  tips
//
//  Created by Darren Cheng on 1/7/15.
//  Copyright (c) 2015 sanguinerane. All rights reserved.
//

import UIKit
import Foundation

private var viewControllerContext = 0

public class ViewController: UIViewController, UITextFieldDelegate {

  @IBOutlet public weak var billField: UITextField!
  @IBOutlet public weak var tipLabel: UILabel!
  @IBOutlet public weak var totalLabel: UILabel!
  @IBOutlet public weak var tipControl: UISegmentedControl!

  let tipPercentageKeys: Array<String> = [
    "tip_percentage_one", "tip_percentage_two", "tip_percentage_three"
  ]
  var tipPercentages = [0.18, 0.2, 0.22]
  let defaults = NSUserDefaults.standardUserDefaults()

  override public func viewDidLoad() {
    super.viewDidLoad()
    updateTipPercentages()
    addObservers()
  }

  deinit {
    removeObservers()
  }

  // MARK: - IBActions

  @IBAction func onBillAmountChanged() {
    updateLabels()
  }

  @IBAction func onTipPercentageChanged() {
    updateLabels()
  }

  @IBAction func onTap() {
    billField.endEditing(true)
  }

  // MARK: - UI Update

  private func updateLabels() {
    let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]

    let billAmount = (billField.text as NSString).doubleValue
    let tip = billAmount * tipPercentage
    let total = billAmount + tip

    tipLabel.text = String(format: "$%.2f", tip)
    totalLabel.text = String(format: "$%.2f", tip)
  }

  // MARK: State Update

  private func updateTipPercentages() {
    for var index=0; index < 3; index++ {
      if let percent = defaults.objectForKey(tipPercentageKeys[index]) as String! {
        tipControl.setTitle("\(percent)%", forSegmentAtIndex: index)
        tipPercentages[index] = (percent as NSString).doubleValue / 100.0
      }
    }
    updateLabels()
  }

  private func updateTipPercentage(key: String, percent: String) {
    let index = find(tipPercentageKeys, key)!
    tipControl.setTitle("\(percent)%", forSegmentAtIndex: index)
    tipPercentages[index] = (percent as NSString).doubleValue / 100.0
    if index == tipControl.selectedSegmentIndex {
      updateLabels()
    }
  }

  // MARK: KVO

  public override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<Void>) {
    if context == &viewControllerContext {
      updateTipPercentage(keyPath, percent: change[NSKeyValueChangeNewKey] as String)
    } else {
      super.observeValueForKeyPath(keyPath, ofObject: object, change: change, context: context)
    }
  }

  private func addObservers() {
    for tipPercentageKey in tipPercentageKeys {
      defaults.addObserver(
        self,
        forKeyPath: tipPercentageKey,
        options: NSKeyValueObservingOptions.New,
        context: &viewControllerContext
      )
    }
  }

  private func removeObservers() {
    for tipPercentageKey in tipPercentageKeys {
      defaults.removeObserver(
        self,
        forKeyPath: tipPercentageKey,
        context: &viewControllerContext
      )
    }
  }

}