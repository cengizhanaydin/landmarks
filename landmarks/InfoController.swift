//
//  InfoController.swift
//  landmarks
//
//  Created by cengizhan aydin on 19.11.2021.
//

import UIKit

class InfoController : UIViewController {
    
    var landmarkName = ""
    var landmarkImage = UIImage()
    
    @IBOutlet weak var landmarkImageView: UIImageView!
    @IBOutlet weak var landmarkLabel: UILabel!
    
    override func viewDidLoad() {
    
        landmarkImageView.image = landmarkImage
        landmarkLabel.text = landmarkName
        
        navigationItem.title = landmarkName
    }
}
