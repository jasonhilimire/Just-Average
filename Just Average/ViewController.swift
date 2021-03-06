//
//  ViewController.swift
//  Average Steve
//
//  Created by Jason Hilimire on 3/5/18.
//  Copyright © 2018 Peanut Apps. All rights reserved.
//

import UIKit

var valuesArray = [Int]()

extension UITextField{
    
    func addDoneButtonToKeyboard(myAction:Selector?){
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
        doneToolbar.barStyle = UIBarStyle.default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: myAction)
        
        var items = [UIBarButtonItem]()
        items.append(flexSpace)
        items.append(done)
        
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.inputAccessoryView = doneToolbar
        
    }
}

class ViewController: UIViewController {

    @IBOutlet var valuesLabel: UILabel!
    @IBOutlet var avgLabel: UILabel!
    @IBAction func addBtn(_ sender: UIButton) {
        var enteredValue = textBox.text
        
        if enteredValue == "" {
            enteredValue = "0"
        } else {
        print(enteredValue!)
        valuesArray.append(Int(enteredValue!)!)
        textBoxDefault()
        print(valuesArray)
        calcAvg()
        avgLabelText()
        valuesLabelActive()
        }
    }
    

    @IBAction func resetBtn(_ sender: UIButton) {
        valuesArray.removeAll()
        resetAll()
        print(valuesArray)
    }
    @IBOutlet var textBox: UITextField!
    
    @IBAction func removeLast(_ sender: UIButton) {
        
        
        if valuesArray.count >= 2 {
            valuesArray.removeLast()
            calcAvg()
            avgLabelText()
            valuesLabelActive()
        } else {

            valuesArray.removeAll()
            resetAll()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetAll()
        
        textBox.addDoneButtonToKeyboard(myAction:  #selector(self.textBox.resignFirstResponder))

    }
    
   @discardableResult func calcAvg() -> Int {
        let summedArr = valuesArray.reduce(0, {$0 + $1})
        let arrayCount = valuesArray.count
        if valuesArray.count == 0 {
            return 0
        } else {
            let averageArray = summedArr / arrayCount
            return averageArray
        }
    }
    
    func resetAll() {
        textBoxDefault()
        valuesLabelDefault()
        avgLabelText()
    }
    
    func avgLabelText() {
        avgLabel.text = "Average: \(calcAvg())"
    }
    
    func valuesLabelActive() {
        valuesLabel.text = "Total Values: \(valuesArray.count) \nValues: \(valuesArray)"
    }
    
    func valuesLabelDefault() {
        valuesLabel.text = "There be no values here... enter some shit"
    }
    
    func textBoxDefault() {
        textBox.text = ""
    }



}

