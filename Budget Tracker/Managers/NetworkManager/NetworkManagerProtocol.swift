//
//  NetworkManagerProtocol.swift
//  Budget Tracker
//
//  Created by Петр on 09/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Moya

protocol NetworkManagerProtocol {
    
    /// Provides netwrok requests using Moya
    ///
    /// - Parameters:
    ///   - target: destination
    ///   - successCallback: success block
    ///   - errorCallback: error block
    func request(
        target: NetworkAPI,
        success successCallback: @escaping (Response) -> Void,
        error errorCallback: @escaping (Swift.Error) -> Void)
}
