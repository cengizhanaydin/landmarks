//
//  ViewController.swift
//  landmarks
//
//  Created by cengizhan aydin on 19.11.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var landmarksNames = [String]()
    var landmarksImages = [UIImage]()
    var selectedName = ""
    var selectedImage = UIImage()
    
    @IBOutlet weak var landmarksTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        landmarksTableView.delegate = self
        landmarksTableView.dataSource = self
        
        landmarksNames.append("Sümela Manastırı")
        landmarksNames.append("Sultan Ahmet Camisi")
        landmarksNames.append("Ayasofya")
        landmarksNames.append("Kuleli Askeri Lisesi")
        
        landmarksImages.append(UIImage(named: "sümela")!)
        landmarksImages.append(UIImage(named: "sultan")!)
        landmarksImages.append(UIImage(named: "ayasofya")!)
        landmarksImages.append(UIImage(named: "kuleli")!)

        navigationItem.title = "Landmark Book"
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            landmarksNames.remove(at: indexPath.row)
            landmarksImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = landmarksNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarksNames.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedName = landmarksNames[indexPath.row]
        selectedImage = landmarksImages[indexPath.row]
        performSegue(withIdentifier: "toInfoController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toInfoController" {
            let destinationInfoController = segue.destination as! InfoController
            destinationInfoController.landmarkImage = selectedImage
            destinationInfoController.landmarkName = selectedName
        }
    }

}

