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
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: myAction)
        
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
        textBox.text = ""
        print(valuesArray)
        calcAvg()
        avgLabel.text = "Average: \(calcAvg())"
        valuesLabel.text = "\(valuesArray)"
        }
    }
    

    @IBAction func resetBtn(_ sender: UIButton) {
        valuesArray.removeAll()
        resetAll()
        print(valuesArray)
    }
    @IBOutlet var textBox: UITextField!
    
    @IBAction func removeLast(_ sender: UIButton) {
        valuesArray.removeLast()
        calcAvg()
        avgLabel.text = "Average: \(calcAvg())"
        valuesLabel.text = "\(valuesArray)"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetAll()
        
        textBox.addDoneButtonToKeyboard(myAction:  #selector(self.textBox.resignFirstResponder))

    }
    
    func calcAvg() -> Int {
        let summedArr = valuesArray.reduce(0, {$0 + $1})
        let arrayCount = valuesArray.count
        let averageArray = summedArr / arrayCount
        return averageArray
    }
    
    func resetAll() {
        textBox.text = ""
        valuesLabel.text = "There be no values here... enter some shit"
        avgLabel.text = "Average: 0"
    }



}

