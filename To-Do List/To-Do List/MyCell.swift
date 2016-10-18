//
//  MyCell.swift
//  To-Do List
//
//  Created by Leslie Tzeng on 10/16/16.
//  Copyright © 2016 Leslie Tzeng. All rights reserved.
//
//
import UIKit

class MyCell: UITableViewCell, BEMCheckBoxDelegate {
    var delegate:ListDelegate?
    
    override init(style: UITableViewCellStyle, reuseIdentifier:String?) {
        super.init(style:style, reuseIdentifier: reuseIdentifier)
        checkbox = BEMCheckBox()
        checkbox?.delegate = self
        setupViews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var checkbox: BEMCheckBox?
    
    func setupViews() {
        print("indentationWidth: \(self.contentView.frame.size.height)\t\(self.indentationWidth)")

        let checkBoxSize = 0.6 * self.contentView.frame.size.height
        let checkBoxMargin = 0.2 * self.contentView.frame.size.height
        
        self.indentationWidth = 0.9 * self.contentView.frame.size.height
        print("indentationWidth: \(self.contentView.frame.size.height)\t\(self.indentationWidth)")
        self.indentationLevel = 1
        
        self.addSubview(checkbox!)
        checkbox?.frame = CGRect(x: 2 * checkBoxMargin, y: checkBoxMargin, width: checkBoxSize, height: checkBoxSize)
        
        
        
        
    }
    
    func didTap(_ checkBox: BEMCheckBox) {
        if checkBox.on {
            print("ON")
            delegate?.checkOff(cell: self)
        } else {
            print("OFF")
            delegate?.undoCheckOff(cell: self)
        }
        
    }
}

