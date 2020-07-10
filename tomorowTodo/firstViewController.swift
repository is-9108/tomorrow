//
//  firstViewController.swift
//  tomorowTodo
//
//  Created by Shota Ishii on 2020/07/06.
//  Copyright © 2020 is. All rights reserved.
//

import UIKit

class firstViewController: UIViewController {

    @IBOutlet weak var getUpTimePicker: UIDatePicker!
    
    @IBOutlet weak var bedTimePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let alert: UIAlertController = UIAlertController(title: "起床時間と就寝時間の設定", message: "起床時間と就寝時間を設定して下さい", preferredStyle: .alert)
        
        let cancelAction: UIAlertAction = UIAlertAction(title: "OK", style: .cancel, handler:{
            (action: UIAlertAction!) -> Void in
            print("OK")
        })
        
        alert.addAction(cancelAction)
        
        self.present(alert,animated: true,completion: nil)
    }
    
    @IBAction func edit(_ sender: Any) {
        let todoViewController = self.storyboard?.instantiateViewController(withIdentifier: "todoViewController") as! todoViewController
        present(todoViewController,animated: true,completion: nil)
    }
    

}
