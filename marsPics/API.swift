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

public class PlayolaAPI:NSObject
{
    // temporary
    var baseURL = "https://api.nasa.gov"
    var API_KEY = NASA_API_KEY
    // -----------------------------------------------------------------------------
    //                          func getMe
    // -----------------------------------------------------------------------------
    /**
     Gets the current user from the playola server
     
     ### Usage Example: ###
     ````
     authService.getMe()
     .then
     {
     (user) -> Void in
     print(user.name)
     }
     .catch (err)
     {
     print(err)
     }
     ````
     
     - returns:
     `Promise<User>` - a promise
     
     * resolves to: a User
     * rejects: an AuthError
     */
    public func getMe() -> Promise<User>
    {
        let url = "\(self.baseURL)/mars-photos/api/v1/rovers/curiosity/photos"
        let parameters:Parameters? = ["api_key": self.API_KEY]
        
        return Promise
            {
                (fulfill, reject) -> Void in
                Alamofire.request(url, parameters:parameters, headers: headers)
                    .validate(statusCode: 200..<300)
                    .responseJSON
                    {
                        (response) -> Void in
                        switch response.result
                        {
                        case .success:
                            let user:User = User(userInfo: response.result.value! as! NSDictionary)
                            NotificationCenter.default.post(name: PlayolaEvents.currentUserUpdated, object: nil, userInfo: ["user": user])
                            fulfill(user)
                        case .failure:  // could add (let error) later if needed
                            print(response.result.value as Any)
                            let authErr = AuthError(response: response)
                            reject(authErr)
                        }
                }
        }
    }
}
