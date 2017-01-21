//
//  ViewController.swift
//  ThreesAndFives
//
//  Created by Safvan KMC on 20/01/2017.
//  Copyright © 2017 Noufal. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
  
    @IBOutlet weak var coin1TextField: UITextField!
    @IBOutlet weak var coin2TextField: UITextField!
    @IBOutlet weak var inputCurrency: UITextField!
    @IBOutlet weak var validInvalidLabel: UILabel!
    @IBOutlet weak var bigCoinCountLabel: UILabel!
    @IBOutlet weak var smallCoinCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func checkTheCurrency(_ sender: Any) {
        calculate5sAnd3s(Int(inputCurrency.text!)!)
    }
    
    func calculate5sAnd3s(_ currency:Int) {
        
        var bigCoin:Int? = Int(coin1TextField.text!)
        var smallCoin:Int? = Int(coin2TextField.text!)
        if bigCoin!<smallCoin! {
            let temp = smallCoin
            smallCoin = bigCoin
            bigCoin = temp
        }

        var remainingCurrency = currency
        var bigCoinsCount = 0
        var smallCoinsCount = 0
        
        while remainingCurrency>=smallCoin! {
            if remainingCurrency % bigCoin! == 0 {
                bigCoinsCount = remainingCurrency/bigCoin!
                break
            }
            else {
                smallCoinsCount += 1
                remainingCurrency -= smallCoin!
            }
        }
       
        if currency==0 || remainingCurrency>0 && remainingCurrency<smallCoin! {
            bigCoinCountLabel.text = "\(bigCoin!)s : 0"
            smallCoinCountLabel.text = "\(smallCoin!)s : 0"
            validInvalidLabel.text = "Invalid"
        }
        else {
            bigCoinCountLabel.text = "\(bigCoin!)s : \(bigCoinsCount)"
            smallCoinCountLabel.text = "\(smallCoin!)s : \(smallCoinsCount)"
            validInvalidLabel.text = "Valid"
        }
        
    }
}

