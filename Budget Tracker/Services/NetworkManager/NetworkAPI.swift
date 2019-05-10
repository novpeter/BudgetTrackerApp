//
//  BudgetTrackerAPI.swift
//  Budget Tracker
//
//  Created by Петр on 18/04/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Moya

enum NetworkAPI {
    case signIn(body: SignInRequestBody)
    case signUp(body: SignUpRequestBody)
    case logOut(token: String)
    case createOperation(token: String, operation: OperationRequestBody)
    case deleteOperation(token: String, id: String)
    case updateOperation(token: String, operation: OperationRequestBody)
    case getOperation(token: String, id: String)
    case getOperations(token: String)
    case forgotPassword(email: String)
}

extension NetworkAPI: TargetType {
    
    var baseURL: URL {
        get {
            guard let url = URL(string: URLConstants.baseURLString)
            else { fatalError("Cannot set base url") }
            return url
        }
    }
    
    var path: String {
        switch self {
        case .signIn:
            return "/user/sign-in"
        case .signUp:
            return "/user/sign-up"
        case .logOut:
            return "/user/log-out"
        case .deleteOperation(_, let id),
             .getOperation(_, let id): return "/operation/\(id)"
        case .getOperations,
             .createOperation,
             .updateOperation:
            return "/operation"
        case .forgotPassword(let email):
            return "/password-recovery/\(email)"
        }
    }
    
    var method: Method {
        switch self {
        case .getOperations,
             .getOperation:
            return .get
        case .signIn,
            .signUp,
            .logOut,
            .createOperation,
            .forgotPassword:
            return .post
        case .deleteOperation: return .delete
        case .updateOperation: return .put
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .signIn(let body):
             return .requestJSONEncodable(body)
        case .signUp(let body):
             return .requestJSONEncodable(body)
        case .createOperation(_, let body):
            return .requestJSONEncodable(body)
        case .updateOperation(_, let body):
            return .requestJSONEncodable(body)
        default:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .logOut(let token),
            .createOperation(let token, _),
            .deleteOperation(let token, _),
            .updateOperation(let token, _),
            .getOperation(let token, _),
            .getOperations(let token):
            return [
                "Authorization": "\(token)",
                "Content-Type": "application/json"
            ]
        default:
            return ["Content-Type": "application/json"]
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
}
