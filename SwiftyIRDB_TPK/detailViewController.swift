//
//  ViewController.swift
//  SwiftyIRDB_TPK
//
//  Created by Tanner Parker on 10/20/20.
//  Changes were made

import UIKit

class detailViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var formatLabel: UILabel!
    @IBOutlet weak var episodeLabel: UILabel!
    @IBOutlet weak var studioNetworkLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var summaryTextView: UITextView!
    @IBOutlet weak var castListButton: UIButton!
    
    func configureView() {
        if let detail = detailItem {
            if let label = titleLabel {
                label.text = detail.name
            }
            title = detail.name
            if let label = yearLabel {
                if let ended = detail.yearEnd {
                    label.text = "\(detail.yearStart) - \(ended)"
                } else {
                    label.text = detail.yearStart
                }
            }
            if let label = formatLabel {
                label.text = detail.format
            }
            if let label = episodeLabel {
                if let countEpisodes = detail.episodes {
                    if countEpisodes > 1 {
                        label.text = "\(countEpisodes) Episodes"
                    } else {
                        label.text = "\(countEpisodes) Episodes"
                    }
                } else {
                    label.text = ""
                }
            }
            if let label = studioNetworkLabel {
                if let network = detail.network {
                    label.text = network
                } else if let studio = detail.studio {
                    label.text = studio
                }
            }
            if let textview = summaryTextView {
                textview.text = detail.summary
            }
            if let imageView = posterImageView {
                let url = URL(string: detail.imageURL)
                let data = try? Data(contentsOf: url!)
                imageView.image = UIImage(data: data!)
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
        
        // Do any additional setup after loading the view.
        
        // 1
         let nav = self.navigationController?.navigationBar
       
         // 2
         nav?.barStyle = UIBarStyle.black
         nav?.tintColor = UIColor.init(red: 245/255, green: 196/255, blue: 72/255, alpha: 1)
        
    }
    
//    override func prepare (for segue: UIStoryboard, sender: Any?) {
//        if segue.identifier == "showMediaDetail" {
//            let controller = (segue.destination as! UINavigationController).topViewController as! CastListTableViewController
//            if let castList = detailItem?.starring {
//                controller.castList = castlist
//            }
//        }
//    }



}

