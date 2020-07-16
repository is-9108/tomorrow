

import UIKit
import RealmSwift
import UserNotifications

class todoViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var todoTableView: UITableView!
    
    let realm = try! Realm()
    
    var taskArray = try! Realm().objects(Task.self).sorted(byKeyPath: "rank",ascending: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todoTableView.delegate = self
        todoTableView.dataSource = self
        
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        todoTableView.register(nib, forCellReuseIdentifier: "Cell")
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        todoTableView.reloadData()
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = todoTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        cell.setCell(task: taskArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let task = taskArray[indexPath.row]
            let center = UNUserNotificationCenter.current()
            center.removePendingNotificationRequests(withIdentifiers: [String(task.id)])
            try! realm.write{
                self.realm.delete(task)
                todoTableView.deleteRows(at: [indexPath], with: .fade)
            }
            
            center.getPendingNotificationRequests{(requests: [UNNotificationRequest]) in
                for request in requests{
                print("------------")
                print(request)
                print("------------")
                }
            }
        }
    }
    
    @IBAction func add(_ sender: Any) {
        let addViewController = self.storyboard?.instantiateViewController(withIdentifier: "addViewController") as! addViewController
        
        
        let task = Task()
        
        let allTask = realm.objects(Task.self)
        if allTask.count != 0{
            task.id = allTask.max(ofProperty: "id")! + 1
            print("+1")
        }else{
            print("no")
        }
        print(realm)
        print(taskArray)
        addViewController.task = task
        self.present(addViewController,animated: true,completion: nil)
        
    }
    

}

