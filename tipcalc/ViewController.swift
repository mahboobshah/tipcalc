//
//  ViewController.swift
//  tipcalc
//
//  Created by Mohammed, Mahboob Shah on 3/3/17.
//  Copyright © 2017 Mohammed, Mahboob Shah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipControl.addTarget(self, action: #selector(ViewController.calculateTip(_:)),for : .valueChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tipControl.selectedSegmentIndex = defaults.integer(forKey: "segmentIndex")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        billField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        let tipPercentages = [0.18,0.2,0.25]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
    
        tipLabel.text = String.init(format: "$%.2f", tip)
        totalLabel.text = String.init(format: "$%.2f", total)
        UserDefaults.standard.set(1, forKey: "Key")
    }
    
    
}
