//
//  SettingsViewController.swift
//  tipcalc
//
//  Created by Mohammed, Mahboob Shah on 3/4/17.
//  Copyright © 2017 Mohammed, Mahboob Shah. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultControl: UISegmentedControl!

    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var tipStepper: UIStepper!
    @IBAction func tipStepperAction(_ sender: Any) {
        defaultControl.setTitle(String(Int(tipStepper.value))+"%", forSegmentAt: defaultControl.selectedSegmentIndex)
    }
    
    @IBAction func resetAction(_ sender: Any) {
        resetDefaults()
    }
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        defaultControl.addTarget(self, action: #selector(SettingsViewController.setDefault(_:)),for : .valueChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        defaultControl.selectedSegmentIndex = defaults.integer(forKey: "segmentIndex")
        defaultControl.setTitle(defaults.string(forKey: "segmentTitle0") ?? "10%", forSegmentAt: 0)
        defaultControl.setTitle(defaults.string(forKey: "segmentTitle1") ?? "15%", forSegmentAt: 1)
        defaultControl.setTitle(defaults.string(forKey: "segmentTitle2") ?? "20%", forSegmentAt: 2)
        setTipperValue()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        defaults.set(defaultControl.selectedSegmentIndex, forKey: "segmentIndex")
        defaults.set(defaultControl.titleForSegment(at: 0), forKey: "segmentTitle0")
        defaults.set(defaultControl.titleForSegment(at: 1), forKey: "segmentTitle1")
        defaults.set(defaultControl.titleForSegment(at: 2), forKey: "segmentTitle2")
        defaults.synchronize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func setDefault(_ sender: Any) {
        
        setTipperValue()
    }
    
    func setTipperValue() {
        tipStepper.value = getSegmentValue(str: defaultControl.titleForSegment(at: defaultControl.selectedSegmentIndex)!)
    }
    
    func getSegmentValue(str: String) -> Double {
        return (Double(str.substring(to: str.index(before: str.endIndex))) ?? 0.0)
    }
    
    func resetDefaults() {
        defaultControl.setTitle("10%", forSegmentAt: 0)
        defaultControl.setTitle("15%", forSegmentAt: 1)
        defaultControl.setTitle("20%", forSegmentAt: 2)
        defaultControl.selectedSegmentIndex = 0
        setTipperValue()
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
