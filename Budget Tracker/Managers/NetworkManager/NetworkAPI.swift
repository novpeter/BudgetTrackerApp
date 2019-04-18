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
    case createOperation(token: String, operation: OperationModel)
    case deleteOperation(token: String, id: Int)
    case updateOperation(token: String, operation: OperationModel)
    case getOpearition(token: String, id: Int)
    case getOperations(token: String)
}

extension NetworkAPI: TargetType {
    
    var baseURL: URL { return URL(string: URLConstants.baseURLString)! }
    
    var path: String {
        switch self {
        case .signIn:
            return "/sign-in"
        case .signUp:
            return "/sign-up"
        case .logOut:
            return "/log-out"
        case .deleteOperation(_, let id),
             .getOpearition(_, let id): return "/operation/\(id)"
        case .getOperations,
             .createOperation,
             .updateOperation:
            return "/operation"
        }
    }
    
    var method: Method {
        switch self {
        case .getOperations,
             .getOpearition:
            return .get
        case .signIn,
            .signUp,
            .logOut,
            .createOperation:
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
            .getOpearition(let token, _),
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
