//
//  ViewController.swift
//  TipCalculator
//
//  Created by Li Tzu Lin on 2022-01-14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var calculateTipButtom: UIButton!
    @IBOutlet var billAmountOutlet: UITextField!
    @IBOutlet var tipAmountLabel: UILabel!
    @IBOutlet var adjustTipTextField: UITextField!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var ad2: UITextField!
    @IBOutlet var slidervalue: UILabel!
    @IBOutlet var adjustSlide: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerForKeyboardNotification()
        billAmountOutlet.keyboardType = .numberPad
        ad2.keyboardType = .numberPad
    }
    
    func registerForKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(_:)), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    @objc func keyboardWasShown(_ notification: NSNotification) {
        guard let info = notification.userInfo, let keyboardFrameValue = info[UIResponder.keyboardFrameBeginUserInfoKey]
                as? NSValue else {return}
        
        let keyboardFrame = keyboardFrameValue.cgRectValue
        let keyboardSize = keyboardFrame.size
        
        scrollView.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
    }
    
    @objc func keyboardWillBeHidden(_ notification: NSNotification) {
        scrollView.contentInset = UIEdgeInsets.zero
    }

    @IBAction func adjust2(_ sender: UITextField) {
        if let tips = (billAmountOutlet.text), let adjust1 = (sender.text) {
            if tips.isEmpty || adjust1.isEmpty {
                let tip = 0
                tipAmountLabel.text = "0.0"
            } else {
                let tip = (Double(tips))! / 100.0 * (Double(adjust1))!
            tipAmountLabel.text = String(tip)
            }
        }
    }
    @IBAction func keyboardcontroll(_ sender: UITextField) {
        ad2.keyboardType = .numberPad
    }
    @IBAction func dismissKeyBoard(_ sender: UITapGestureRecognizer) {
        billAmountOutlet.resignFirstResponder()
        ad2.resignFirstResponder()
    }
    @IBAction func adjustTipPercentage(_ sender: UISlider) {
        if let tips = (billAmountOutlet.text) {
            let adjustslide = sender.value
            if tips.isEmpty || adjustslide.isZero {
                let tip = 0
                tipAmountLabel.text = "0.0"
            } else {
                let sliderDouble = (Double(Int(adjustslide)))
                if sender.value.isZero { slidervalue.text = "0.0"
                } else {
                slidervalue.text = String(sliderDouble)
                }
                let tip = (Double(tips))! / 100.0 * sliderDouble
                tipAmountLabel.text = String(tip)
            }
        }
    }
    
    @IBAction func billAmountTextField(_ sender: UITextField) {
       billAmountOutlet.text = sender.text
        if let bill: Double = Double(billAmountOutlet.text ?? "0.0") {
            billAmountOutlet.text = String(bill)
        }
    }

    @IBAction func CalculateTip(_ sender: UIButton) {
        
        if let tips = (billAmountOutlet.text) {
           if tips.isEmpty {
              let tip = 0
              tipAmountLabel.text = "0.0"
           } else {
           let tip = (Double(tips))! / 100.0 * 15.0
          tipAmountLabel.text = String(tip)
           }
        }
    }
}
