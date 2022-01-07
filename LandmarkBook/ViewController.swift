//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Muhammed Süha Demirel on 7.01.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var landmarkNamess = [String]()
    var landmarkImages = [UIImage]()

    var chosenLandmarkName = ""
    var chosenLandmarkImage = UIImage()

    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myTableView.delegate = self
        myTableView.dataSource = self
        
        landmarkNamess.append("collesseum")
        landmarkNamess.append("eiffel")
        landmarkNamess.append("pyramid")
        landmarkNamess.append("statueOfLiberty")
        
        landmarkImages.append(UIImage(named: "collesseum")!)
        landmarkImages.append(UIImage(named: "eiffel")!)
        landmarkImages.append(UIImage(named: "pyramid")!)
        landmarkImages.append(UIImage(named: "statueOfLiberty")!)

        navigationItem.title = "Landmark Book Ez"
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            landmarkNamess.remove(at: indexPath.row )
            landmarkImages.remove(at: indexPath.row )
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)

        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = landmarkNamess[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNamess.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        chosenLandmarkName = landmarkNamess[indexPath.row]
        chosenLandmarkImage = landmarkImages[indexPath.row]
        
        performSegue(withIdentifier: "toImageViewController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toImageViewController" {
            let destinationVC = segue.destination as! imageViewController
            destinationVC.selectedLandmarkName = chosenLandmarkName
            destinationVC.selectedLandmarkImage = chosenLandmarkImage
        }
    }

}

