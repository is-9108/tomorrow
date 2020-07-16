//
//  TableViewCell.swift
//  tomorowTodo
//
//  Created by Shota Ishii on 2020/07/16.
//  Copyright © 2020 is. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var todoLabel: UILabel!
    
    @IBOutlet weak var limitLabel: UILabel!
    
    @IBOutlet weak var checkBox: UIButton!
    
    var done: Bool = true
    
    func setCell(task:Task){
        todoLabel.text = task.title
        limitLabel.text = task.timeString
    }
    
    
    @IBAction func checkButton(_ sender: Any) {
        let doneImage = UIImage(named: "done")

        let yetImage = UIImage(named: "yet")

        if done == true{
            done = false
            checkBox.setImage(doneImage, for: .normal)
        }else if done == false{
            done = true
            checkBox.setImage(yetImage, for: .normal)
        }else{
            print("done:\(done)")
        }
    }
    
}
