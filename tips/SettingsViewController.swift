//
//  SettingsViewController.swift
//  tips
//
//  Created by Darren Cheng on 1/11/15.
//  Copyright (c) 2015 sanguinerane. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

  @IBOutlet weak var tipPercentOne: UITextField!
  @IBOutlet weak var tipPercentTwo: UITextField!
  @IBOutlet weak var tipPercentThree: UITextField!
  var textFields: Array<UITextField!> {
    return [ tipPercentOne, tipPercentTwo, tipPercentThree ]
  }
  let tipPercentageKeys: Array<String> = [
    "tip_percentage_one", "tip_percentage_two", "tip_percentage_three"
  ]

  let defaults = NSUserDefaults.standardUserDefaults()

  override func viewDidLoad() {
    super.viewDidLoad()
    load()
  }

  @IBAction func close() {
    dismissKeyboard()
    save()
    dismissViewControllerAnimated(true, completion: nil)
  }

  @IBAction func onTap() {
    dismissKeyboard()
  }

  private func dismissKeyboard() {
    for textField:UITextField! in textFields {
      textField.endEditing(true)
    }
  }

  private func load() {
    for (index, textField:UITextField!) in enumerate(textFields) {
      if let percent = defaults.objectForKey(tipPercentageKeys[index]) as String! {
        textField.text = percent
      }
    }
  }

  private func save() {
    for (index, textField:UITextField!) in enumerate(textFields) {
      defaults.setObject(textField.text, forKey: tipPercentageKeys[index])
    }
    defaults.synchronize()
  }

}
