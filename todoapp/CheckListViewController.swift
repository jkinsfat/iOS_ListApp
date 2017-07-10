//
//  ViewController.swift
//  todoapp
//
//  Created by Jason Kinsfather on 7/10/17.
//  Copyright © 2017 Jason Kinsfather. All rights reserved.
//

import UIKit

class CheckListViewController: UITableViewController {
    var items = [CheckListItem]()
    required init?(coder aDecoder: NSCoder) {
        let row0 = CheckListItem()
        row0.text = "Walk the dog"
        row0.checked = false
        items.append(row0)
        let row1 = CheckListItem()
        row1.text = "Brush my teeth"
        row1.checked = false
        items.append(row1)
        let row2 = CheckListItem()
        row2.text = "Learn iOS Development"
        row2.checked = false
        items.append(row2)
        let row3 = CheckListItem()
        row3.text = "Soccer Practice"
        row3.checked = false
        items.append(row3)
        let row4 = CheckListItem()
        row4.text = "Eat Ice Cream"
        row4.checked = false
        items.append(row4)
        super.init(coder: aDecoder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell( withIdentifier: "CheckListItem", for: indexPath)
        let item = items[indexPath.row]
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            let item = items[indexPath.row]
            item.toggleChecked()
            configureCheckmark(for: cell, with: item)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
    
    func configureCheckmark(for cell: UITableViewCell, with item: CheckListItem) {
        if item.checked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
    
    @IBAction func addItem(_ sender: UIBarButtonItem) {
        let newRowIndex = items.count
        let item = CheckListItem()
        item.text = "I am a new row"
        item.checked = false
        items.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
    }
}

