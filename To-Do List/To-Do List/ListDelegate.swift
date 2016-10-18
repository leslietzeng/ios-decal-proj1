//
//  ListDelegate.swift
//  To-Do List
//
//  Created by Leslie Tzeng on 10/16/16.
//  Copyright © 2016 Leslie Tzeng. All rights reserved.
//

import Foundation
protocol ListDelegate {
    func addToList(newItem: String)
    func checkOff(cell: UITableViewCell)
    func undoCheckOff(cell: UITableViewCell)
}
