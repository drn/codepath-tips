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
      it("defaults bill field to empty string") {
        expect(viewController.billField.text).to(equal(""))
      }
      it("defaults tip label to '$0.00 Tip'") {
        expect(viewController.tipLabel.text).to(equal("$0.00 Tip"))
      }
      it("defaults total label to '$0.00 Total'") {
        expect(viewController.totalLabel.text).to(equal("$0.00 Total"))
      }
    }

    describe("changes to bill field") {
      beforeEach {
        viewController.billField.text = "100"
        viewController.onBillAmountChanged()
      }
      it("changes tip label to '$18.00 Tip'") {
        expect(viewController.tipLabel.text).to(equal("$18.00 Tip"))
      }
      it("changes total label to '$118.00 Total'") {
        expect(viewController.totalLabel.text).to(equal("$118.00 Total"))
      }
    }

  }
}