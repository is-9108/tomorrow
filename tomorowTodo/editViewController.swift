//
//  editViewController.swift
//  tomorowTodo
//
//  Created by Shota Ishii on 2020/07/06.
//  Copyright © 2020 is. All rights reserved.
//

import UIKit

class editViewController: UIViewController {

    @IBOutlet weak var wakeUpTimePicker: UIDatePicker!
    
    @IBOutlet weak var bedTimePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func edit(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        print("test")
    }
}
