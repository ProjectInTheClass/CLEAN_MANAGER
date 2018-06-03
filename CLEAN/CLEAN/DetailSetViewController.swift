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
    
    @IBOutlet weak var label_cycle: UILabel!
    
    let muteForPickerData = ["1", "2", "3"]
    let month = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16"]
    let day = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30"]
    var countries = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        alarm_picker.delegate = self
        alarm_picker.dataSource = self
        cycle_picker.delegate = self
        cycle_picker.dataSource = self
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
                return month.count
            }
            else {
                return day.count
            }
        }
        else {
            return muteForPickerData.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(pickerView == cycle_picker){
            if component == 0 {
                return month[row]
            }
            else {
                return day[row]
            }
        }
        else {
            return muteForPickerData[row]
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == cycle_picker
        {
            label_cycle.text = "주기: \(month[pickerView.selectedRow(inComponent: 0)])개월 \(day[pickerView.selectedRow(inComponent: 1)])일"
            pickerView.reloadComponent(1)
        }
        
    }

}
