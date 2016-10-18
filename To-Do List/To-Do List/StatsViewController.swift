//
//  StatsViewController.swift
//  To-Do List
//
//  Created by Leslie Tzeng on 10/16/16.
//  Copyright © 2016 Leslie Tzeng. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {
    var completedTasksLabel: UILabel? = UILabel()
    var titleLabel: UILabel? = UILabel()
    var numberCompleted: Int = 0
    
    
    enum Constants {
        
        /// titleLabel Constants
        static let LabelText: String = "Completed"
        static let titleColor: UIColor = UIColor.white

        
        /// completedTasksLabel Constants
        static let completedTasksColor: UIColor = UIColor.white

        
        /// Stack View Constants (try tweaking them!)
        static let StackviewSpacing: CGFloat = 10
        static let StackViewAxis: UILayoutConstraintAxis = .vertical
        static let StackViewDistribution: UIStackViewDistribution = .fillEqually
        static let sideMargin: CGFloat = 40
        static let topMargin: CGFloat = 100
        static let botMargin: CGFloat = 100
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Statistics"
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        
//        completedTasksLabel?.frame = CGRect(x:0, y:50, width: 100, height:50)
        completedTasksLabel?.text = "\(numberCompleted)"
        completedTasksLabel?.backgroundColor = Constants.completedTasksColor
        completedTasksLabel?.textAlignment = .center
        completedTasksLabel?.font = UIFont(name: (completedTasksLabel?.font.fontName)!, size: 38)

        titleLabel?.text = Constants.LabelText
        titleLabel?.backgroundColor = Constants.titleColor
        titleLabel?.textAlignment = .center
        titleLabel?.font = UIFont.systemFont(ofSize: 44, weight: UIFontWeightSemibold)

//        self.view.addSubview(completedTasksLabel!)
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel!, completedTasksLabel!])
        stackView.spacing = Constants.StackviewSpacing
        stackView.axis = Constants.StackViewAxis
        stackView.distribution = Constants.StackViewDistribution
        view.addSubview(stackView)
        print("Outside \(view.frame.size.width)\t\(view.frame.size.height)")
        
        pin(view: stackView, toAllSidesOfView: self.view, sideMargin: Constants.sideMargin, topMargin: Constants.topMargin, botMargin: Constants.botMargin)

    }
    
    func updateLabel(newNum: Int) {
        numberCompleted = newNum
        //        completedTasksLabel?.text = "\(numberCompleted)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func pin(view: UIView, toAllSidesOfView superview: UIView, sideMargin: CGFloat, topMargin: CGFloat, botMargin: CGFloat) {
        let w = self.view.frame.size.width
        let h = self.view.frame.size.height
        print("Inside \(w / 10)\t\(h)")
        /// Set to false since we are using AutoLayout
        view.translatesAutoresizingMaskIntoConstraints = false
        
        /// Set this view's leading anchor equal to its superview's leading anchor (+ margin)
        view.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: sideMargin).isActive = true
        
        /// Set this view's trailing anchor equal to its superview's trailing anchor (+ margin)
        view.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -sideMargin).isActive = true
        
        /// Set this view's top anchor equal to its superview's top anchor (- margin)
        view.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: h/5).isActive = true
        
        /// Set this view's bottom anchor equal to its superview's bottom anchor (- margin)
        view.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -(h/2)).isActive = true
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

