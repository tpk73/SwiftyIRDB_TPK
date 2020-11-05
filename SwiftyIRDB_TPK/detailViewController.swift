//
//  ViewController.swift
//  SwiftyIRDB_TPK
//
//  Created by Tanner Parker on 10/20/20.
//  Changes were made

import UIKit

class detailViewController: UIViewController {
    
    
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var stadium: UILabel!
    @IBOutlet weak var division: UILabel!
    @IBOutlet weak var imageURL: UIImageView!
    @IBOutlet weak var superBowlWins: UILabel!
    @IBOutlet weak var summary: UITextView!
    @IBOutlet weak var castListButton: UIButton!
    
    func configureView() {
        if let detail = detailItem {
            if let label = teamName {
                label.text = detail.teamName
                title = detail.teamName
            }

            if let label = location {
                label.text = detail.location
            }
            if let label = stadium {
                label.text = detail.stadium
            }
            if let label = division {
                label.text = detail.division
            }
            if let imageView = imageURL {
                let url = URL(string: detail.imageURL)
                let data = try? Data(contentsOf: url!)
                imageView.image = UIImage(data: data!)
            }
            if let thisLabel = superBowlWins {
                thisLabel.text = detail.superBowlWins
            }
            if let label = summary {
                label.text = detail.summary
            }
        }
    }
    
    var detailItem: Entry? {
        didSet{
            configureView()
        }
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()

        let nav = self.navigationController?.navigationBar

        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.init(red: 245/255, green: 196/255, blue: 72/255, alpha: 1)
        
        title = detailItem?.teamName
        
        configureView()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toTheNextOne" {
            let controller = segue.destination as! castTableViewController
            controller.castListArray = detailItem?.coaching

        }
    }

}

