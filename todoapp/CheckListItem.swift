//
//  CheckListItem.swift
//  todoapp
//
//  Created by Jason Kinsfather on 7/10/17.
//  Copyright © 2017 Jason Kinsfather. All rights reserved.
//

import Foundation
class CheckListItem {
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
}
