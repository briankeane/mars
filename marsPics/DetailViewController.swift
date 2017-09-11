//
//  DetailViewController.swift
//  marsPics
//
//  Created by Barry Keane on 9/11/17.
//  Copyright © 2017 Brian D Keane. All rights reserved.
//

import UIKit
import Haneke

class DetailViewController: ViewController {
    
    var urlString: String = ""

    @IBOutlet weak var marsImageView: UIImageView!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.marsImageView.hnk_setImageFromURL(URL(string: urlString)!)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
