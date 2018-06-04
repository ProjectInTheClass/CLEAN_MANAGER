//
//  DetailSetViewController.swift
//  CLEAN
//
//  Created by 김장현 on 2018. 6. 2..
//  Copyright © 2018년 김장현. All rights reserved.
//

import Foundation
import UIKit



class DetailSetViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextViewDelegate, UITextFieldDelegate {
    @IBOutlet weak var start_picker: UIDatePicker!
    @IBOutlet weak var cycle_picker: UIPickerView!
    @IBOutlet weak var alarm_picker: UIPickerView!
    @IBOutlet weak var label_cycle: UILabel!
    @IBOutlet weak var label_alarm: UILabel!
    @IBOutlet weak var label_start: UILabel!
    @IBOutlet weak var txt_memo: UITextView!
    
    let alarm_data = ["소리", "진동", "무음"]
    let month = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16"]
    let day = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        alarm_picker.delegate = self
        alarm_picker.dataSource = self
        cycle_picker.delegate = self
        cycle_picker.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        txt_memo.text = "memo..."
        txt_memo.textColor = UIColor.lightGray
        txt_memo.delegate = self
    }
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if txt_memo.textColor == UIColor.lightGray {
            txt_memo.text = nil
            txt_memo.textColor = UIColor.black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if txt_memo.text.isEmpty {
            txt_memo.text = "memo..."
            txt_memo.textColor = UIColor.lightGray
        }
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if txt_memo.textColor == UIColor.lightGray {
            txt_memo.text = nil
            txt_memo.textColor = UIColor.black
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if (txt_memo.text?.isEmpty)! {
            txt_memo.text = "memo..."
            txt_memo.textColor = UIColor.lightGray
        }
    }
    

    @IBAction func date_picker_changed(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM - dd - YYYY"
        label_start.text = "시작일: " + formatter.string(from: start_picker.date)
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
            return alarm_data.count
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
            return alarm_data[row]
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == cycle_picker
        {
            label_cycle.text = "주기: \(month[pickerView.selectedRow(inComponent: 0)])개월 \(day[pickerView.selectedRow(inComponent: 1)])일"
            pickerView.reloadComponent(1)
        }
        else
        {
            label_alarm.text = "알람: \(alarm_data[pickerView.selectedRow(inComponent: 0)])"
        }
    }

}
