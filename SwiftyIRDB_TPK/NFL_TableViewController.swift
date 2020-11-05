//
//  IRDb_TableViewController.swift
//  SwiftyIRDB_TPK
//
//  Created by Tanner Parker on 10/20/20.
//  Changes were made

import UIKit

class NFL_TableViewController: UITableViewController {

    var mediaModel: IRDb_MediaDataModel? {
        didSet {
            tableView.reloadData()
        }
    }
    
    var dataController = NFL_DataController()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "NFL"
        
        // 1
         let nav = self.navigationController?.navigationBar
       
         // 2
         nav?.barStyle = UIBarStyle.black
         nav?.tintColor = UIColor.init(red: 245/255, green: 196/255, blue: 72/255, alpha: 1)
       
         // 3
         let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 44))
         imageView.contentMode = .scaleAspectFit
           
         // 4
         let image = UIImage(named: "nfl")
         imageView.image = image
           
         // 5
         navigationItem.titleView = imageView
        
        // call data controller
        dataController.getJSONData(completion: {dataModel in self.mediaModel = dataModel})

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return mediaModel?.NFL.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return mediaModel?.NFL[section].divisionName
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return mediaModel?.NFL[section].teams.count ?? 0
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mediaCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = mediaModel?.NFL[indexPath.section].teams[indexPath.row].teamName
        
        cell.detailTextLabel?.text = mediaModel?.NFL[indexPath.section].teams[indexPath.row].location
        
        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showMediaDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let selectedObject = mediaModel!.NFL[indexPath.section].teams[indexPath.row]
                let controller = segue.destination as! detailViewController
                controller.detailItem = selectedObject
            }
        }
    }
}
