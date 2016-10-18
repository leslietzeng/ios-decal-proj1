//
//  AddTaskViewController.swift
//  To-Do List
//
//  Created by Leslie Tzeng on 10/16/16.
//  Copyright © 2016 Leslie Tzeng. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController, UITextFieldDelegate {
    var delegate: ListDelegate? = nil
    var inputBox: UITextField? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Add Task"
        
        self.view.backgroundColor = UIColor.white
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(AddTaskViewController.done(_:)))
        // Do any additional setup after loading the view.
        let displayContainer = UIView(frame: UIScreen.main.bounds)
        inputBox = UITextField(frame: CGRect(x:15,y:100,width:UIScreen.main.bounds.width - 30, height: 50))
        inputBox?.delegate = self
        inputBox?.placeholder = "Buy a hyperdrive..."
        inputBox?.backgroundColor = UIColor.white
        inputBox?.isEnabled = true
        inputBox?.borderStyle = UITextBorderStyle.roundedRect //change this to none.
        displayContainer.addSubview(inputBox!)
        self.view.addSubview(displayContainer)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func done(_ sender: UIBarButtonItem) {
        print(inputBox?.text)
        if let toDo = inputBox?.text {
            delegate?.addToList(newItem: toDo)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
