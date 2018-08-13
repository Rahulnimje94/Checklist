//
//  ChecklistItem.swift
//  CheckLists
//
//  Created by Anand on 10/08/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject {
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
}
