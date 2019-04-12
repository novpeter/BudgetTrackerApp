//
//  NetworkManager.swift
//  Budget Tracker
//
//  Created by Петр on 09/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

class NetworkManager: NetworkManagerProtocol {
    
    func obtainImage(with url: URL, completionBlock: @escaping () -> Void) {
        
        
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
//            if let error = error {
//                completionBlock(.Error(error: error.localizedDescription))
//            }
//            else {
//                completionBlock(.Success(imageData: data!))
//            }
            
        }.resume()
    }
}
