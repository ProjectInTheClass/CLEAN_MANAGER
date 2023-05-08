//
//  DetailSetViewController.swift
//  CLEAN
//
//  Created by eunjiev on 2018. 6. 2..
//  Copyright © 2018년 clean. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications


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
    let week = Constants.DetailSet.week
    let day = Constants.DetailSet.day
    let memo_place_holder = Constants.DetailSet.memo_place_holder
    let event_data = EventData()
    
    let event_info = EventInfo(valid: -1, eid: -1, sid: -1, ename: "", front_date: "", cycle: "", alarm: 0, memo: "")
    
    var offset = 0
    var isInsert = false
    
    func init_space_holder (_ text: String?, _ textView: UITextView) {
        textView.text = text
        if text != nil {
            txt_memo.textColor = Constants.TextShow.space_holder_color
        }
        else {
            txt_memo.textColor = Constants.TextShow.text_color
        }
    }
    
    @IBAction func alarmStart() {
        
        CreateNotice()
        
    }
    
    
    
    
    
    func CreateNotice() {
        
        let content = UNMutableNotificationContent()
        
        content.title = "청소지역(화장실) 해당청소(변기)"
        
        //content.subtitle = "Too hard"
        
        content.body = "청소해야돼 or 청소했니?"
        
        content.sound = UNNotificationSound.default()
        
        content.badge = 1
        
        
        
        content.categoryIdentifier = "selectCategory"
        
        
        
        
        
        //    버튼 클릭 후에 홈으로 나갔을 때 5초뒤에 알람 나오는것, 시간차이를 이용해서 알람내고싶을때 이거 사용
        
        //    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        
        
        // 년,월,일 까지 받음
        
        let date = start_picker.date
        
        
        
        var triggerDate = Calendar.current.dateComponents([.year,.month,.day,], from: date)
        
        
        
        // 해당 날짜의 알람 울릴 시각 설정
        
        triggerDate.hour = 14
        
        triggerDate.minute = 16
        
        triggerDate.second = 0
        
        
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
        
        
        
        
        
        let requestIdentifier = "requset Identifier"
        
        let request = UNNotificationRequest(identifier: requestIdentifier, content: content, trigger: trigger)
        
        
        
        //foreground 에서도 작동하기위해 추가한것중하나  as   추가
        
        UNUserNotificationCenter.current().delegate = self as UNUserNotificationCenterDelegate
        
        
        
        UNUserNotificationCenter.current().add(request) { (error) in
            
            print(error as Any)
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        alarm_picker.delegate = self
        alarm_picker.dataSource = self
        cycle_picker.delegate = self
        cycle_picker.dataSource = self
        
        
        let now = Date()
        let formmater = DateFormatter()
        let format: String = "yyyy-MM-dd"
        
        btn_done.title = Constants.Button.done
        
        UNUserNotificationCenter.current().delegate = self as UNUserNotificationCenterDelegate
        
        txt_memo.text = String(offset)
        event_data.find_event(event_id: offset, get_data: event_info)
        formmater.dateFormat = format
        event_info.front_date = formmater.string(from: now as Date)
        event_info.debug()
        
        //event_info.cycle = "0/0"
        
        print(isInsert)
        
        //navigationController?.title = String(offset)
        self.navigationItem.title = cleanArray[CleanObjects(rawValue: offset) ?? .floor]?.name ?? String(offset)
        print("offset: " + String(offset))
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        init_space_holder(memo_place_holder, txt_memo)
        txt_memo.delegate = self
    }
    
    @IBAction func btn_done(_ sender: Any) {
        print("haha")
        if(event_info.valid == 0){
            event_info.valid = 1
        }
        print("\n\n\n\n\n\nbtn_done\n\n\nn\n\n")
        event_info.memo = txt_memo.text
        event_info.eid = offset
        
        if offset == 00 {
            event_info.ename = "쇼파"
        } else if offset == 01{
            event_info.ename = "바닥"
        } else if offset == 10{
            event_info.ename = "전자레인지"
        } else if offset == 11{
            event_info.ename = "바닥"
        } else if offset == 20{
            event_info.ename = "욕실"
        } else if offset == 21{
            event_info.ename = "세면대"
        } else if offset == 22{
            event_info.ename = "바닥"
        } else if offset == 23{
            event_info.ename = "변기"
        } else if offset == 30{
            event_info.ename = "침대"
        } else if offset == 31{
            event_info.ename = "바닥"
        } else if offset == 40{
            event_info.ename = "침대"
        } else if offset == 41{
            event_info.ename = "바닥"
        } else if offset == 50{
            event_info.ename = "침대"
        } else if offset == 51{
            event_info.ename = "바닥"
        } else if offset == 60{
            event_info.ename = "옷장"
        } else if offset == 61{
            event_info.ename = "바닥"
        } else if offset == 70{
            event_info.ename = "TV"
        } else if offset == 71{
            event_info.ename = "컴퓨터"
        } else if offset == 72{
            event_info.ename = "드라이기"
        }
        
        
        event_data.undate_event(get_data: event_info)
        event_info.debug()
        event_data.debug()
        
        let alert = UIAlertController(title: "알림", message: "저장 되었습니다.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: { action in
            self.navigationController?.popViewController(animated: true)
        }))
        
        
        self.present(alert, animated: true)
        
        
        //        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MainBoard")
        //        vc?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        //        self.present(vc!, animated: true, completion: nil)
        
        //        if let uvc = self.storyboard?.instantiateViewController(withIdentifier: "MainBoard") {
        //            uvc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        //            // 인자값으로 받은 뷰 컨트롤러로 화면
        //            self.present(uvc, animated: true, completion: nil)
        //        }
        if let vc = UIStoryboard.init(name: "Calendar", bundle: nil).instantiateInitialViewController() as? DetailSetViewController {
            self.navigationController?.pushViewController(vc, animated: true)
        }
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
        event_info.front_date = formatter.string(from: start_picker.date)
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
                return week.count
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
                return week[row]
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
            label_cycle.text = "주기: \(week[pickerView.selectedRow(inComponent: 0)])주 \(day[pickerView.selectedRow(inComponent: 1)])일"
            event_info.cycle = "\(week[pickerView.selectedRow(inComponent: 0)])/\(day[pickerView.selectedRow(inComponent: 1)])"
            pickerView.reloadComponent(1)
        }
        else
        {
            label_alarm.text = "알람: \(alarm_data[pickerView.selectedRow(inComponent: 0)])"
            event_info.alarm = pickerView.selectedRow(inComponent: 0)
        }
    }
    
}

extension DetailSetViewController: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        completionHandler([.alert, .badge, .sound])
        
    }
    
    
    
    // 알람 눌러서 스크롤내리면 2가지 항목이 나오는데 각각 선택했을때 어떤식으로 처리할지 여기서
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        switch response.actionIdentifier {
            
        case "answerYes":
            
            let alert1 = UIAlertController(title: "화장실-변기", message: "청소 완료", preferredStyle: .alert)
            let action1 = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert1.addAction(action1)
            present(alert1, animated: true, completion: nil)
            
            // test
            print("*******************")
            
        case "answerNo":
            let alert2 = UIAlertController(title: "화장실-변기", message: "청소 처리 안됨", preferredStyle: .alert)
            let action2 = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert2.addAction(action2)
            present(alert2, animated: true, completion: nil)
            
        default:
            break
            
        }
        
        completionHandler()
    }
    
    
    
}
