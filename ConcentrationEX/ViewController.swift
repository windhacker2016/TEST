//
//  ViewController.swift
//  ConcentrationEX
//
//  Created by Alexander on 2016/8/10.
//  Copyright © 2016年 Make Sachool. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var formulaTextField: UITextField!
    
    @IBOutlet weak var m1TextField: UITextField!

    @IBOutlet weak var v1TextField: UITextField!
    
    @IBOutlet weak var m2TextField: UITextField!
    
    @IBOutlet weak var v2TextField: UITextField!
    
    var periodicTable = ["H":1,"He":2,"Li":3,"Pi":4,"B":5]
    
    func findMolecularWeight(molecular:String?) {
        if let molecularWeight = periodicTable[molecular!]{
            formulaTextField.text = String(molecularWeight)
            
        }
    }
    
    @IBAction func formula(sender: AnyObject){
        
        if formulaTextField == nil {
            return
        }
        findMolecularWeight(formulaTextField.text!)
    }

    

    @IBAction func caculate(sender: AnyObject)
     {
        
        var m1:Double? = Double(m1TextField.text!)
        var v1:Double? = Double(v1TextField.text!)
        var m2:Double? = Double(m2TextField.text!)
        var v2:Double? = Double(v2TextField.text!)
        
        func showError() -> Int {
            
            var count:Int = 0
        
            if m1 != nil {
                count+=1
            }
            if v1 != nil {
                count+=1
            }
            if m2 != nil {
                count+=1
            }
            if v2 != nil {
                count+=1
            }
            
            return count
        }
        
       let counter = showError()
        
        if counter < 3 {return}
        
        if v2 == nil {
            v2 = m1! * v1! / m2!
            v2TextField.text = "\(v2!)"
            
        }else if m1 == nil {
            m1 = m2! * v2! / v1!
            m1TextField.text = "\(m1!)"
            
        }else if m2 == nil {
            m2 = m1! * v1! / v2!
            m2TextField.text = "\(m2!)"
            
        }else if v1 == nil {
            v1 = m2! * v2! / m1!
            v2TextField.text = "\(v1)"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

