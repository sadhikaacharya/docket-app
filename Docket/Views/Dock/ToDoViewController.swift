//
//  ToDoViewController.swift
//  Docket
//
//  Created by Sadhika Acharya on 6/29/22.
//

import UIKit

class ToDoViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet var textField: UITextField!
    var priority = ""
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.becomeFirstResponder()
        textField.delegate = self
        //picker.reloadAllComponents()
        
       
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(save))

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didChangeSegment(_ sender: UISegmentedControl){
        if sender.selectedSegmentIndex == 0{
            priority = "low"
        } else if sender.selectedSegmentIndex == 1{
            priority = "medium"
        } else if sender.selectedSegmentIndex == 2{
            priority = "high"
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    @objc func save(){
        if let text = textField.text, !text.isEmpty{
            //save data using create item
            let sendValue = DockViewController()
            sendValue.createItem(name: text, completed: false, priority: priority)
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


