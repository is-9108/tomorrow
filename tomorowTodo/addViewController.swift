//
//  addViewController.swift
//  tomorowTodo
//
//  Created by Shota Ishii on 2020/07/08.
//  Copyright © 2020 is. All rights reserved.
//

import UIKit

class addViewController: UIViewController {

    @IBOutlet weak var todoTextField: UITextField!
    @IBOutlet weak var randPicker: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func add(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
