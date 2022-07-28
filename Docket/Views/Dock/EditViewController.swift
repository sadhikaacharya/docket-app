//
//  EditViewController.swift
//  Docket
//
//  Created by Sadhika Acharya on 7/3/22.
//

import UIKit

class EditViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var priority: UISegmentedControl!
    
    
    var item: DockItem?
    
    var newItem = ""
    var newPriority = ""
    var newState = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.becomeFirstResponder()
        textField.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(save))
                
        textField.text = item?.itemName
        
        
        if (item?.priority == "low"){
            priority.selectedSegmentIndex = 0
            newPriority = "low"
        } else if (item?.priority == "medium"){
            priority.selectedSegmentIndex = 1
            newPriority = "medium"
        } else if (item?.priority == "high"){
            priority.selectedSegmentIndex = 2
            newPriority = "high"
        }
        
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    @IBAction func didChangeSegment(_ sender: UISegmentedControl){
        if sender.selectedSegmentIndex == 0{
            newPriority = "low"
        } else if sender.selectedSegmentIndex == 1{
            newPriority = "medium"
        } else if sender.selectedSegmentIndex == 2{
            newPriority = "high"
        }
    }
    

    @objc func save(){
        if let text = textField.text, !text.isEmpty{
            //save data using create item
            let sendValue = DockViewController()
            
            sendValue.updateItem(item: item!, newName: text, completed: newState, newPriority: newPriority)
            
            let controller = storyboard?.instantiateViewController(identifier: "ListNC") as! UINavigationController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .coverVertical
            present(controller, animated: true, completion: nil)
            
        
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
