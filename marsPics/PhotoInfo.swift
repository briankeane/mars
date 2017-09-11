//
//  PhotoInfo.swift
//  marsPics
//
//  Created by Barry Keane on 9/11/17.
//  Copyright © 2017 Brian D Keane. All rights reserved.
//

import Foundation

class PhotoInfo {
  
  var id: String
  var urlString: String
  var earthDate: Date
  var cameraName: String
  
  init (id: String, urlString: String, earthDate: Date, cameraName: String) {
    
    self.id = id
    self.urlString = urlString
    self.earthDate = earthDate
    self.cameraName = cameraName
    
  }
  
  
}
