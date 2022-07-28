//
//  DockViewController.swift
//  Docket
//
//  Created by Sadhika Acharya on 6/20/22.
//

import UIKit
import Foundation

class DockViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    
    //@IBOutlet var table: UITableView!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var userName = "";
    var emoji = ""
    private var items = [DockItem]()
    
    let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        title = "\(UserDefaults.standard.userName)'s Dock View"
        view.addSubview(tableView)
        getAllItems()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: item.itemName!)
        if (item.completed == true){
            attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attributedString.length))
        }
        cell.textLabel?.text =  getEmoji(value: item.priority!) + "  " + attributedString.string as NSString as String
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            
            tableView.beginUpdates()
            
            let item = items[indexPath.row]
            self.deleteItem(item: item)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            tableView.endUpdates()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? EditViewController{
            destination.item = items[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
   

 
    @IBAction func tappedAdd(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "toDoList") as? ToDoViewController else{
            return
        }
        
        vc.title = "New Item"
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func getEmoji(value:String) -> String{
        if (value == "low"){
            return "🟢"
        } else if (value == "medium"){
            return "🟡"
        } else if (value == "high"){
            return "🔴"
        }
        return "🟢"
    }
    
    func getAllItems(){
        do{
             items = try context.fetch(DockItem.fetchRequest())
             DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } catch {
            //error
        }
       
        
    }
    
    func createItem(name:String, completed: Bool, priority: String){
        
        let newItem = DockItem(context: context)
        newItem.itemName = name
        newItem.completed = completed
        newItem.priority = priority
        
        
        do {
            try context.save()
            getAllItems()
            //print("function called")
        } catch{
            
        }
        
    }
    
    func deleteItem(item: DockItem){
        context.delete(item)
        do{
            try context.save()
            getAllItems()
        } catch{
            
        }
        
    }
    
    func updateItem(item: DockItem, newName: String, completed: Bool,newPriority: String){
        
        item.completed = completed
        item.itemName = newName
        item.priority = newPriority
        
        do{
            try context.save()
            getAllItems()
        } catch{
            
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

