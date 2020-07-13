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
