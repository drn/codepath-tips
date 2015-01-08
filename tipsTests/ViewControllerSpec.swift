//
//  ViewControllerSpec.swift
//  tips
//
//  Created by Darren Cheng on 1/8/15.
//  Copyright (c) 2015 sanguinerane. All rights reserved.
//

import UIKit
import Quick
import Nimble
import tips

class ViewControllerSpec: QuickSpec {
  override func spec() {
    var viewController: ViewController!

    beforeEach {
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      viewController = storyboard.instantiateViewControllerWithIdentifier("ViewController") as ViewController
      viewController.beginAppearanceTransition(true, animated: false)
      viewController.endAppearanceTransition()
    }

    describe("ui defaults") {
      it("defaults bill field to 0") {
        println(viewController.billField.text)
        expect(viewController.billField.text).to(equal("0"))
      }
      it("defaults tip label to $0.00") {
        println(viewController.tipLabel.text)
        expect(viewController.tipLabel.text).to(equal("$0.00"))
      }
      it("defaults total label to $0.00") {
        println(viewController.totalLabel.text)
        expect(viewController.totalLabel.text).to(equal("$0.00"))
      }
    }

  }
}