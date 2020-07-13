//
//  addViewController.swift
//  tomorowTodo
//
//  Created by Shota Ishii on 2020/07/08.
//  Copyright © 2020 is. All rights reserved.
//

import UIKit
import RealmSwift

class addViewController: UIViewController,UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource {
    
    
    @IBOutlet weak var deadlineDP: UIDatePicker!
    
    @IBOutlet weak var todoTextField: UITextField!
    
    @IBOutlet weak var randPicker: UIPickerView!
    
    var rank = ["高","中","低"]
    
    var rankString = "高"
    
    let realm = try! Realm()
    var task:Task!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(task as Any)
        todoTextField.delegate = self
        randPicker.delegate = self
        randPicker.dataSource = self

    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return rank[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        rankString = rank[row]
    }
    
    func setNotification(task:Task){
        let content = UNMutableNotificationContent()
        content.title = "期限が迫っています！！"
        content.body = "\(task.title)の期限が迫っています！！"
        content.sound = UNNotificationSound.default
        
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.year,.month,.day,.hour,.minute], from: task.deadline)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        let request = UNNotificationRequest(identifier: String(task.id), content: content, trigger: trigger)
        
        let center = UNUserNotificationCenter.current()
        center.add(request){(error) in
            print(error ?? "ローカル通知登録OK")
        }
        
        center.getPendingNotificationRequests{(requests: [UNNotificationRequest]) in
            for request in requests{
                print("------------")
                print(request)
                print("------------")
            }
        }
    }
        
    @IBAction func add(_ sender: Any) {
        print(todoTextField.text!)
        print(rankString)
        try! realm.write{
            self.task.title = self.todoTextField.text!
            self.task.deadline = deadlineDP.date
            if rankString == "高"{
                self.task.rank = 1
            }else if rankString == "中"{
                self.task.rank = 2
            }else if rankString == "低"{
                self.task.rank = 3
            }else{
                print("ERROR")
            }
            self.realm.add(self.task,update: .modified)
        }
        print(task as Any)
        setNotification(task: task)
        dismiss(animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        todoTextField.resignFirstResponder()
        return true
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated :true,completion :nil)
    }
    
}
