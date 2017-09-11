//
//  MainViewController.swift
//  marsPics
//
//  Created by Barry Keane on 9/11/17.
//  Copyright © 2017 Brian D Keane. All rights reserved.
//

import UIKit
import Haneke

class MainViewController: ViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var pictureTable: UITableView!
    @IBOutlet weak var goButton: UIButton!
  
    @IBAction func goButtonPressed(_ sender: Any) {
        self.makeRequest()
    }
  
    var photoInfos: [PhotoInfo] = Array()
    
    var photoUrl: String = ""
  
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.pictureTable.delegate = self
        self.pictureTable.dataSource = self
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    func makeRequest()
    {
        let api = NasaAPI()
        api.getPhotos(date: self.datePicker.date)
        .then
        {
            (photoInfosArray) -> Void in
            // handle here
            self.photoInfos = photoInfosArray
            self.pictureTable.reloadData()
        }
        .catch
        {
            (error) -> Void in
            // handle error here
                
        }
            }
    
    // The following required by UITableViewDelegate and UITableViewDataSource in class
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let photoInfo = self.photoInfos[indexPath.row]

        let cell = self.pictureTable.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PhotoInfoTableViewCell
        cell.idLabel.text = photoInfo.id
        cell.cameraNameLabel.text = photoInfo.cameraName
        cell.photoImageView.hnk_setImageFromURL(URL(string: photoInfo.urlString)!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.photoInfos.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        photoUrl = self.photoInfos[indexPath.row].urlString
        self.performSegue(withIdentifier: "MainToDetailViewSegue", sender: self)  // Does actual seguey
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MainToDetailViewSegue"
        {
            (segue.destination as! DetailViewController).urlString = self.photoUrl
        }
    }
    
}
