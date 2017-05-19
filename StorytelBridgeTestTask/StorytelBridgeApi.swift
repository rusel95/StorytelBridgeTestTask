//
//  StorytelBridgeApi.swift
//  StorytelBridgeTestTask
//
//  Created by Admin on 19.05.17.
//  Copyright © 2017 rusel95. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class StorytelBridgeApi {
    
    static let shared = StorytelBridgeApi()
    private init() { }
    
    private let apiUrl = "http://api.storytelbridge.com/consumables/list/1"
    
    func getList(giveList: @escaping (List?) -> Void) -> Void {
        
        let urlForRequest = apiUrl
        
        Alamofire.request(urlForRequest).responseJSON { (response) in
            switch response.result {
                
            case .success:
                let list = List(response: response.result.value)
                giveList(list)
                
            case .failure(let error):
                print(error.localizedDescription, urlForRequest)
                giveList(nil)
            }
        }
    }
    
}
