//
//  NetworkManager.swift
//  Budget Tracker
//
//  Created by Петр on 09/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Moya

class NetworkManager: NetworkManagerProtocol {
    
    fileprivate static let provider = MoyaProvider<NetworkAPI>()
    
    func request(
        target: NetworkAPI,
        success successCallback: @escaping (Response) -> Void,
        error errorCallback: @escaping (Swift.Error) -> Void) {

        NetworkManager.provider.request(target) { (result) in
            switch result {
            case .success(let response):
                if response.statusCode >= 200 && response.statusCode <= 300 {
                    successCallback(response)
                }
                else {
                    do
                    {
                        let responseMessage = try JSONDecoder().decode(ErrorResponse.self, from: response.data)
                        let error = NSError(domain: String(), code: response.statusCode, userInfo: [NSLocalizedDescriptionKey: responseMessage])
                        errorCallback(error)
                    }
                    catch {
                        let error = NSError(
                            domain: String(),
                            code: response.statusCode,
                            userInfo: [NSLocalizedDescriptionKey: "Cannot parse data"])
                        errorCallback(error)
                    }
                    
                }
            case .failure(let error):
                errorCallback(error)
            }
        }
    }
}
