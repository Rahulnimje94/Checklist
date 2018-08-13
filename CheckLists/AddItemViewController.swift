//
//  AddItemViewController.swift
//  CheckLists
//
//  Created by Anand on 10/08/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import UIKit

protocol AddItemViewControllerDelegate: class {
    func addItemViewControllerDidCancel(_ controller: AddItemViewController)
    func addItemViewController(_ controller: AddItemViewController, didFinishAdding item: ChecklistItem)
    func addItemViewController(_ controller: AddItemViewController, didFinishEditing item: ChecklistItem)
}

// Mark:- Refactor Class name to ItemDetailV
class AddItemViewController: UITableViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    @IBOutlet weak var cancelBarButton: UIBarButtonItem!
    var itemToEdit: ChecklistItem?
    
    weak var delegate: AddItemViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        UnComment in iOS 11
//        navigationItem.largeTitleDisplayMode = .never
        
        if let item = itemToEdit {
            title = "Edit Item"
            textField.text = item.text
            doneBarButton.isEnabled = true
        }
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        textField.becomeFirstResponder()
//        done.isEnabled = false
    }
    
    @IBAction func cancel() {
        navigationController?.popViewController(animated: true)
        delegate?.addItemViewControllerDidCancel(self)
    }
    
    @IBAction func done() {
        
        if let itemToEdit = itemToEdit {
            itemToEdit.text = textField.text!
            delegate?.addItemViewController(self, didFinishEditing: itemToEdit)
        } else {
            let item = ChecklistItem()
            item.text = textField.text!
            item.checked = false
            
            delegate?.addItemViewController(self, didFinishAdding: item)
        }
        
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let oldText = textField.text!
//        let stringRange = Range(range, in:oldText)
        
//        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        
        
//      Mark:- Replace oldtext with newText after uncommenting previous 2 lines in iOS 11
        
        if oldText.isEmpty {
            doneBarButton.isEnabled = false
        } else {
            doneBarButton.isEnabled = true
        }
        return true
    }
}




