//
//  AlarmTestViewController.swift
//  CLEAN
//
//  Created by admin on 2018. 6. 2..
//  Copyright © 2018년 김장현. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications

class AlarmTestViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func CreateAlarm() {
        CreateNotice()
    }
    
    func CreateNotice() {
        let content = UNMutableNotificationContent()
        content.title = "Test alarm"
        content.subtitle = "Too hard"
        content.body = "This is body"
        content.sound = UNNotificationSound.default()
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        
        let requestIdentifier = "requset Identifier"
        let request = UNNotificationRequest(identifier: requestIdentifier, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { (error) in
            print(error as Any)
        }
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
