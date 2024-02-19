//
//  ViewController.swift
//  Param_Moradiya_8856423_lab6
//  Created by user221628 on 6/15/23.
//

import UIKit

class ViewController: UITableViewController {
    
    var todoArray:[String] = ["Email", "HomeWork", "Learn", "Assignment"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as! MyTableViewCell
        cell.titleLabel.text = todoArray[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            todoArray.remove(at: indexPath.row)
            self.tableView.reloadData()
        }
    }
    
    @IBAction func plusButtonAction(_ sender: UIButton) {
        let alert = UIAlertController(title: "Add Item", message: "", preferredStyle: .alert)

        alert.addTextField { (textField) in
            textField.placeholder = "Write ToDo List"
        }

        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0]
            self.todoArray.append(textField?.text ?? "")
            self.tableView.reloadData()
        }))

        self.present(alert, animated: true, completion: nil)
    }

    
    @IBAction func editButon(_ sender: Any) {
        
            if isEditing {
                (sender as AnyObject).setTitle("Edit", for: .normal)
                setEditing(false, animated: true)
            } else {
                (sender as AnyObject).setTitle("Done", for: .normal)
                setEditing(true, animated: true)
            }
        }
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = self.todoArray[sourceIndexPath.row]
        todoArray.remove(at: sourceIndexPath.row)
        todoArray.insert(movedObject, at: destinationIndexPath.row)
    }
        
}
