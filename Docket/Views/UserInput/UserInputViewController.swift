//
//  UserInputViewController.swift
//  Docket
//
//  Created by Sadhika Acharya on 6/19/22.
//

import UIKit

class UserInputViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var field: UITextField!
    
    let userDefaults = UserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func button(_ sender: UIButton) {
        
        userDefaults.setValue(field.text, forKey: "name")
        
        if let value = userDefaults.value(forKey: "name") as? String {
            UserDefaults.standard.userName = value
    }
        
        let controller = storyboard?.instantiateViewController(identifier: "ListNC") as! UINavigationController
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .coverVertical
        UserDefaults.standard.hasOnboarded = true
        present(controller, animated: true, completion: nil)
        
        //field.resignFirstResponder()
    }
    
    

   
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let userName = field.text ?? ""
                
            // Create a new variable to store the instance of the SecondViewController
            // set the variable from the SecondViewController that will receive the data
            let destinationVC = segue.destination as! DockViewController
            destinationVC.userName = userName
    }*/

}
