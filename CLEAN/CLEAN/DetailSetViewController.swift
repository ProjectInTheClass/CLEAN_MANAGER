//
//  DetailSetViewController.swift
//  CLEAN
//
//  Created by 김장현 on 2018. 6. 2..
//  Copyright © 2018년 김장현. All rights reserved.
//

import Foundation
import UIKit


class Country{
    var country: String
    var cities: [String]
    
    init(country:String, cities:[String]) {
        self.cities = cities
        self.country = country
    }
}

class DetailSetViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var start_picker: UIDatePicker!
    @IBOutlet weak var cycle_picker: UIPickerView!
    @IBOutlet weak var alarm_picker: UIPickerView!
    let muteForPickerData = ["1", "2", "3"]
    
    
    var countries = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        alarm_picker.delegate = self
        alarm_picker.dataSource = self
        cycle_picker.delegate = self
        cycle_picker.dataSource = self
        
        countries.append(Country(country: "a", cities: ["a1", "a2", "a3"]))
        countries.append(Country(country: "b", cities: ["b1", "b2", "b3"]))
        countries.append(Country(country: "c", cities: ["c1", "c2", "c3"]))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView == cycle_picker{
            return 2
        }
        else{
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == cycle_picker {
            if component == 0 {
                return countries.count
            }
            else {
                let i = pickerView.selectedRow(inComponent: 0)
                return countries[i].cities.count
            }
        }
        else {
            return muteForPickerData.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(pickerView == cycle_picker){
            if component == 0 {
                return countries[row].country
            }
            else {
                let i = pickerView.selectedRow(inComponent: 0)
                return countries[i].cities[row]
            }
        }
        else {
            return muteForPickerData[row]
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == cycle_picker{
        pickerView.reloadComponent(1)
        }
        
    }

}
