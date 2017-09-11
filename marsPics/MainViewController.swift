//
//  MainViewController.swift
//  marsPics
//
//  Created by Barry Keane on 9/11/17.
//  Copyright © 2017 Brian D Keane. All rights reserved.
//

import UIKit

class MainViewController: ViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var pictureTable: UITableView!
    @IBOutlet weak var goButton: UIButton!
  
    @IBAction func goButtonPressed(_ sender: Any) {
        self.makeRequest()
    
    
    
    }
  
    var photoInfos: [PhotoInfo] = Array()
  
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
   
        self.photoInfos = [
                            PhotoInfo(id: "1", urlString: "http://mars.jpl.nasa.gov/msl-raw-images/proj/msl/redops/ods/surface/sol/01000/opgs/edr/fcam/FLB_486265257EDR_F0481570FHAZ00323M_.JPG", earthDate: Date(), cameraName: "Camera 1"),
                            PhotoInfo(id: "2", urlString: "http://mars.jpl.nasa.gov/msl-raw-images/proj/msl/redops/ods/surface/sol/01000/opgs/edr/fcam/FRB_486265257EDR_F0481570FHAZ00323M_.JPG", earthDate: Date(), cameraName: "Camera 2"),
                            PhotoInfo(id: "3", urlString: "http://mars.jpl.nasa.gov/msl-raw-images/proj/msl/redops/ods/surface/sol/01000/opgs/edr/fcam/FLB_486265257EDR_F0481570FHAZ00323M_.JPG", earthDate: Date(), cameraName: "Camera 3"),
                            PhotoInfo(id: "4", urlString: "http://mars.jpl.nasa.gov/msl-raw-images/proj/msl/redops/ods/surface/sol/01000/opgs/edr/rcam/RRB_486265291EDR_F0481570RHAZ00323M_.JPG", earthDate: Date(), cameraName: "Camera 4")
                        ]
    }
    
    // The following required by UITableViewDelegate and UITableViewDataSource in class
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.photoInfos.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}
