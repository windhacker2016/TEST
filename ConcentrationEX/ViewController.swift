//
//  ViewController.swift
//  ConcentrationEX
//
//  Created by Alexander on 2016/8/10.
//  Copyright © 2016年 Make Sachool. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 分子量查詢輸入格
    @IBOutlet weak var formulaTextField: UITextField!
    
    // 莫耳濃度公式輸入格
    @IBOutlet weak var pickMassTextField: UITextField!
    @IBOutlet weak var pickMWTextField: UITextField!
    @IBOutlet weak var pickVolumeTextField: UITextField!
    
    // 濃度換算公式輸入格
    @IBOutlet weak var m1TextField: UITextField!
    @IBOutlet weak var v1TextField: UITextField!
    @IBOutlet weak var m2TextField: UITextField!
    @IBOutlet weak var v2TextField: UITextField!
    
    // 週期表Dictionary
    var periodicTable = ["H":1.008,"He":4.00260,"Li":6.94,"Be":9.01218,"B":10.81,"C":12.011,"N":14.007,"O":15.999,"F":18.9984,"Ne":20.1797,"Na":22.9897,"Mg":24.305,"Al":26.9815]
    
    //搜尋週期表
    func findMolecularWeight(molecular:String?) {
        if let molecularWeight = periodicTable[molecular!]{
            formulaTextField.text = String(molecularWeight)
            
        }
    }
    
    // 分子量查詢功能
    @IBAction func calculateMW(sender: AnyObject) {
        
        if formulaTextField == nil {
            return
        }
        findMolecularWeight(formulaTextField.text!)
    
        for molecularFormula in formulaTextField.text!.characters {
            print(molecularFormula)
        }
        
        
    }
    

    // 莫耳濃度計算功能
    @IBAction func calculateM(sender: AnyObject) {

        var mass:Double? = Double(pickMassTextField.text!)
        var mw:Double? = Double(pickMWTextField.text!)
        var vol:Double? = Double(pickVolumeTextField.text!)
        
        // 避免未正確輸入崩潰
        func showError() -> Int {
        
            var count:Int = 0
            
            if mass != nil{
                count+=1
            }
            if mw != nil{
                count+=1
            }
            if vol != nil{
                count+=1
            }
            return count
        }
        let counter = showError()
        
        if counter < 2 {return}
        
        //公式
        if mass == nil {
            mass = mw! * vol!
            pickMassTextField.text = "\(mass)"
            
        }else if vol == nil {
            vol = mass! / mw!
            pickVolumeTextField.text = "\(vol)"
            
        }else if
            formulaTextField.text != nil {
            pickMassTextField.text = "\(formulaTextField.text!)"
        }
    }
    
    
    //濃度換算計算功能   
    @IBAction func calculateCon(sender: AnyObject) {
        
        var m1:Double? = Double(m1TextField.text!)
        var v1:Double? = Double(v1TextField.text!)
        var m2:Double? = Double(m2TextField.text!)
        var v2:Double? = Double(v2TextField.text!)
        
        // 避免未正確輸入崩潰
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
        
        // 公式
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

