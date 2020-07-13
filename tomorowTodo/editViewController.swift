//
//  editViewController.swift
//  tomorowTodo
//
//  Created by Shota Ishii on 2020/07/06.
//  Copyright © 2020 is. All rights reserved.
//

import UIKit
import UserNotifications

class editViewController: UIViewController{

    @IBOutlet weak var wakeUpTimePicker: UIDatePicker!
    
    @IBOutlet weak var bedTimePicker: UIDatePicker!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wakeUpTimePicker.datePickerMode = UIDatePicker.Mode.time
        bedTimePicker.datePickerMode = UIDatePicker.Mode.time
    }
    
    func setWakeUpNotification(date:Date){
        let center = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = "今日のタスク"
        content.body = "おはようございます。今日のタスクを確認しましょう。"
        content.sound = UNNotificationSound.default
        
        let triger = UNTimeIntervalNotificationTrigger(timeInterval: 60*60*24, repeats: false)
        
        let request = UNNotificationRequest(identifier: "samplePuch", content: content, trigger: triger)
        
        center.add(request)
        
        
    }

    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func edit(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm"
        print(formatter.string(from: wakeUpTimePicker.date))
        setWakeUpNotification(date: wakeUpTimePicker.date)
        print(formatter.string(from: bedTimePicker.date))
        dismiss(animated: true, completion: nil)
    }
    
    
}
