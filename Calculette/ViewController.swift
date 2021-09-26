//
//  ViewController.swift
//  Calculette
//
//  Created by User on 24.09.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        refreshUI()
    }
    
    func refreshUI()
    {
        currentNum = ""
        currentString = ""
        resultNum = "0"
        result = 0
    }

    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var currentLabel: UILabel!

    var _lS: String.Index?
    var lastSign: String.Index?
    {
        get {
            _lS
        }
        set{
            if _lS != nil
            {
                computate()
            }
            _lS = newValue
            }
    }
    var currentNum: String!
    var _currentString: String!
    var currentString: String!{
        set{
            _currentString = newValue
            currentLabel.text = newValue
        }
        get{
            _currentString
        }
    }
    
    var _resultNum: String!
    var resultNum: String!
    {
        set{
            _resultNum = newValue
        }
        get{
            _resultNum
        }
    }
    
    var _r: Double!
    var result: Double!
    {
        get {_r}
        set {
            _r = newValue
            resultLabel.text = String(_r)
        }
    }
    
    
    @IBAction func numSet(sender: UIButton)
    {
        
        if let char: String = sender.titleLabel?.text{
            currentNum += char
            currentString += char
        }
    }
    
    @IBAction func actionExe(sender: UIButton)
    {
        
        if let char: String = sender.titleLabel?.text{
            
            
            if lastSign != nil && currentString[lastSign!] == currentString.last {
                currentString = currentString[..<lastSign!] + char
            }
            else if !currentString.isEmpty{
                if lastSign == nil
                {
                    let n:Int? = Int(currentNum)
                    result = Double(n!)
                    currentNum = ""
                }
                lastSign = currentString.endIndex
                currentString += char
                
            }

        }
    }
    @IBAction func computateClick(sender: UIButton)
    {
        if lastSign != nil
        {
            computate()
        }
    }
    
    func computate()
    {
        let char = currentString[lastSign!]
        let cn = Int(currentNum)
        currentNum = ""
        if let n:Int = cn
        {
            let d = Double(n)
            switch char {
                case "/":
                if d == 0 {
                    result = Double.infinity
                }
                else {
                    result /= d
                    
                }
                case "*":
                    result *= d
                case "+":
                    result += d
                case "-":
                    result -= d
                default: return
            }
        }
        
    }
    @IBAction func setAC(sender: UIButton)
    {
        refreshUI()
    }
}

