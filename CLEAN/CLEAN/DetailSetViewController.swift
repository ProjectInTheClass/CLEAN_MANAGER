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
    @IBOutlet weak var txt_memo: UITextView!
    @IBOutlet weak var label_cycle: UILabel!
    @IBOutlet weak var label_alarm: UILabel!
    @IBOutlet weak var label_start: UILabel!
    @IBOutlet weak var btn_done: UIBarButtonItem!
    
    let alarm_data = Constants.DetailSet.alarm_data
    let month = Constants.DetailSet.month
    let day = Constants.DetailSet.day
    let memo_place_holder = Constants.DetailSet.memo_place_holder
    
    func init_space_holder (_ text: String?, _ textView: UITextView) {
        textView.text = text
        if text != nil {
            txt_memo.textColor = Constants.TextShow.space_holder_color
        }
        else {
            txt_memo.textColor = Constants.TextShow.text_color
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        alarm_picker.delegate = self
        alarm_picker.dataSource = self
        cycle_picker.delegate = self
        cycle_picker.dataSource = self
        
        btn_done.title = Constants.Button.done
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        init_space_holder(memo_place_holder, txt_memo)
        txt_memo.delegate = self
    }
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if txt_memo.textColor == UIColor.lightGray {
            init_space_holder( nil, txt_memo)
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if txt_memo.text.isEmpty {
            init_space_holder(memo_place_holder, txt_memo)
        }
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if txt_memo.textColor == UIColor.lightGray {
            init_space_holder(nil, txt_memo)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if (txt_memo.text?.isEmpty)! {
            init_space_holder(memo_place_holder, txt_memo)
        }
    }
    

    @IBAction func date_picker_changed(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = Constants.DetailSet.date_format
        label_start.text = "시작일: " + formatter.string(from: start_picker.date)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView == cycle_picker{
            return Constants.DetailSet.cycle_picker_num
        }
        else{
            return Constants.DetailSet.alarm_picker_num
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
