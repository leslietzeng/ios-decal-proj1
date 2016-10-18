//
//  ViewController.swift
//  To-Do List
//
//  Created by Leslie Tzeng on 10/16/16.
//  Copyright © 2016 Leslie Tzeng. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, ListDelegate, BEMCheckBoxDelegate {
    
    var array = [String]()
    var checkedarray = [Bool]()
    var timeArray = [Int]()
    var timer: Timer?
    let clearInterval = 86400
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector(addListItem(sender:)))
        self.navigationItem.title = "To-Do List"
        
        //placeholder for now. Need to make custom button.
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Stats", style: .plain, target: self, action: #selector(checkStats(sender:))) //1 parameter...
        
        self.tableView.register(MyCell.self, forCellReuseIdentifier: "cell")
        
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown(sender:)), userInfo: nil, repeats: true)
        //note: the UITableViewCell.self returns the class itself
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    var temp = 0
    func countDown(sender: Timer) {
        print("called")
        for index in 0..<timeArray.count {
            if checkedarray[index] {
                timeArray[index] -= 1
            }
            if timeArray[index] == 0 {
                array.remove(at: index)
                checkedarray.remove(at: index)
                timeArray.remove(at: index)
                // Delete the row from the data source
                tableView.reloadData()
                break
                //only remove first thing since user isn't going to add multiple things at once...
            }
        }
        temp = temp + 1
        print("TimeArray: \(timeArray)\tRealTime: \(temp)")
    }
    func addListItem(sender: UIBarButtonItem) {
        print(checkedarray)
        let vc = AddTaskViewController()
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true) //push new view on top of this class
    }
    func checkStats(sender: UIBarButtonItem) {
        let vc = StatsViewController()
        print(vc.completedTasksLabel)
        var ct: Int = 0
        for i in checkedarray {
            if i == true {
                ct += 1
            }
        }
        print(ct)
        self.navigationController?.pushViewController(vc, animated: true) //push new view on top of this class
        vc.updateLabel(newNum: ct)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the number of rows
        return array.count //will need to change when I make DataSource
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MyCell
        //going to try to use open source BEMCheckBox Instead
        //        //citation: http://stackoverflow.com/questions/8755506/put-checkmark-in-the-left-side-of-uitableviewcell
        //        if (checkedarray[indexPath.row]) {
        //            cell.textLabel?.text = "\u{2612} \(array[indexPath.row])"
        //        } else {
        //            cell.textLabel?.text = "\u{2610} \(array[indexPath.row])"
        //        }
        cell?.delegate = self
        cell?.textLabel?.text = array[indexPath.row]
        
        
        
        return cell as UITableViewCell!
    }
    
    func addToList(newItem: String) {
        array.append(newItem)
        checkedarray.append(false)
        timeArray.append(clearInterval)
        tableView.reloadData()
    }
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            array.remove(at: indexPath.row)
            checkedarray.remove(at:indexPath.row)
            timeArray.remove(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
            for i in array {
                print(i)
            }
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    func checkOff(cell: UITableViewCell) {
        let atIndex:IndexPath = self.tableView.indexPath(for: cell)!
        checkedarray[atIndex.row] = true
        // Delete the row from the data source
    }
    func undoCheckOff(cell: UITableViewCell) {
        let atIndex:IndexPath = self.tableView.indexPath(for: cell)!
        timeArray[atIndex.row] = clearInterval
        checkedarray[atIndex.row] = false
        // Delete the row from the data source
    }
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    
    
    
}


