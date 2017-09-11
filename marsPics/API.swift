//
//  API.swift
//  marsPics
//
//  Created by Brian D Keane on 9/11/17.
//  Copyright © 2017 Brian D Keane. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit

class NasaAPI:NSObject
{
    // temporary
    var baseURL = "https://api.nasa.gov"
    var API_KEY = NASA_API_KEY
    // -----------------------------------------------------------------------------
    //                          func getPhotoInfos
    // -----------------------------------------------------------------------------
    
    
    override init() {
        super.init()
    }
    func getPhotos(date:Date) -> Promise<Array<PhotoInfo>>
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let reqDateString = formatter.string(from: date)
        
        let url = "\(self.baseURL)/mars-photos/api/v1/rovers/curiosity/photos"
        let parameters:Parameters? = ["api_key": self.API_KEY,
                                      "earth_date": reqDateString]
        
        return Promise
        {
            (fulfill, reject) -> Void in
            Alamofire.request(url, parameters:parameters)
                .validate(statusCode: 200..<300)
                .responseJSON
                {
                    (response) -> Void in
                    switch response.result
                    {
                    case .success:
                        let responseDict = response.result.value! as! [String:Any]
                        let pictDicts = responseDict["photos"] as! Array<[String:Any]>
                        var results:Array<PhotoInfo> = Array()
                        for pictDict in pictDicts
                        {
                                
                            if let id = self.extractIDFromPictDict(pictDict: pictDict)
                            {
                                if let cameraName = self.extractCameraNameFromPictDict(pictDict: pictDict)
                                {
                                    if let urlString = self.extractUrlStringFromPictDict(pictDict: pictDict)
                                    {
                                        if let earthDate = self.extractEarthDateFromPictDict(pictDict: pictDict)
                                            {
                                                results.append(PhotoInfo(id: id, urlString: urlString, earthDate: earthDate, cameraName: cameraName))
                                        }
                                    }
                                }
                            }
                        }
                        fulfill(results)
                    case .failure:
                        let err = response.error
                        reject(err!)
                    }
                }
        }
    }
    
    func extractCameraNameFromPictDict(pictDict:[String:Any]) -> String?
    {
        if let cameraInfo = pictDict["camera"] as? [String:Any]
        {
            if let cameraName = cameraInfo["full_name"] as? String
            {
                return cameraName
            }
        }
        return nil
    }
    
    func extractIDFromPictDict(pictDict:[String:Any]) -> String?
    {
        if let idInt = pictDict["id"] as? Int
        {
            return String(idInt)
        }
        return nil
    }
    
    func extractUrlStringFromPictDict(pictDict:[String:Any]) -> String?
    {
        return pictDict["img_src"] as? String
    }
    
    func extractEarthDateFromPictDict(pictDict:[String:Any]) -> Date?
    {
        if let dateString = pictDict["earth_date"] as? String
        {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-mm-dd"
            return formatter.date(from: dateString)
        }
        return nil
    }
}
