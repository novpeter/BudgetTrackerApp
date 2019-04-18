//
//  NetworkManager.swift
//  Budget Tracker
//
//  Created by Петр on 09/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Moya

struct NetworkManager: NetworkManagerProtocol {
    
    private static let provider = MoyaProvider<NetworkAPI>()
    
    static func request(
        target: NetworkAPI,
        success successCallback: @escaping (Response) -> Void,
        error errorCallback: @escaping (Swift.Error) -> Void,
        failure failureCallback: @escaping (MoyaError) -> Void) {
        
        provider.request(target) { (result) in
            switch result {
            case .success(let response):
                if response.statusCode >= 200 && response.statusCode <= 300 {
                    successCallback(response)
                }
                else {
                    do
                    {
                        let responseMessage = try JSONDecoder().decode(ErrorResponse.self, from: response.data)
                        let error = NSError(domain: "", code: response.statusCode, userInfo: [NSLocalizedDescriptionKey: responseMessage])
                        errorCallback(error)
                    }
                    catch {
                        let error = NSError(domain: "", code: response.statusCode, userInfo: [NSLocalizedDescriptionKey: "Cannot parse data"])
                        errorCallback(error)
                    }
                    
                }
            case .failure(let error):
                failureCallback(error)
            }
        }
    }
}
