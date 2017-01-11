//
//  FirstViewController.swift
//  assignment4
//
//  Created by Raghav Nyati on 10/20/16.
//  Copyright © 2016 Raghav Nyati. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    
    @IBOutlet weak var foodPicker: UIPickerView!
    @IBOutlet weak var slider: UISlider!

    var countryAndFoods:Dictionary<String,Array<String>>?
    var foodCountries:Array<String>? //Sorted list of keys from countriesAndFood
    var selectedCountry:String?
    var foods:Array<String>?  //Foods for current selected food type
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(foodPicker != nil){
            foodPicker.dataSource = self
            foodPicker.delegate = self
        }
        let data:Bundle = Bundle.main
        let foodPlist:String? = data.path(forResource: "Food", ofType: "plist")
        if foodPlist != nil {
            countryAndFoods = (NSDictionary.init(contentsOfFile: foodPlist!) as! Dictionary)
            foodCountries = countryAndFoods?.keys.sorted()
            selectedCountry = foodCountries![0]
            foods = countryAndFoods![selectedCountry!]!.sorted()
        }
        slider.setValue(0, animated: true);
    }

    @IBAction func sliderValueChanged(_ sender: AnyObject) {
        slider.minimumValue = 0
        slider.maximumValue = Float((foods?.count)!)-1
        foodPicker.selectRow(Int(slider.value), inComponent: 1, animated: true)
        foodPicker.delegate = self
        foodPicker.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        guard (foodCountries != nil) && foods != nil else { return 0 }
        slider.minimumValue = 0
        slider.maximumValue = Float((foods?.count)!)-1
        switch component {
            case 0: return foodCountries!.count
            case 1: return foods!.count
            default: return 0
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int,
                    forComponent component: Int) -> String? {
        guard (foodCountries != nil) && foods != nil else { return "None" }
        slider.minimumValue = 0
        slider.maximumValue = Float((foods?.count)!)-1
        switch component {
            case 0: return foodCountries![row]
            case 1: return foods![row]
            default: return "None"
        }
    }
    
    //Updating View when user selects Foods Country
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int,
                    inComponent component: Int) {
        guard (foodCountries != nil) && foods != nil else { return }
        
        if component == 0 {
            slider.minimumValue = 0
            slider.maximumValue = Float((foods?.count)!)-1
            selectedCountry = foodCountries![row]
            foods = countryAndFoods![selectedCountry!]!.sorted()
            pickerView.reloadComponent(1)
        }
        
        if(component == 1){
            slider.minimumValue = 0
            slider.maximumValue = Float((foods?.count)!)-1
            let n = row
            slider.setValue(Float(n), animated: true)
        }
    }
    
}

