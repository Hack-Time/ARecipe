//
//  Network.swift
//  ARecipe
//
//  Created by kingcos on 04/11/2017.
//  Copyright © 2017 kingcos. All rights reserved.
//

import Foundation
import Moya

enum Network {
    case getResult(imageName: String, imageData: Data)
}

extension Network: TargetType {
    var baseURL: URL { return URL(string: API_URL)! }
    var path: String {
        switch self {
        case .getResult:
            return "/"
        }
    }
    var method: Moya.Method {
        switch self {
        case .getResult:
            return .post
        }
    }
    var task: Task {
        switch self {
        case .getResult(let imageName, let imageData):
            let data = MultipartFormData(provider: .data(imageData),
                                         name: "file",
                                         fileName: imageName,
                                         mimeType: "multipart/form-data")
            return .uploadMultipart([data])
        }
    }
    var sampleData: Data {
        return Data()
    }
    var headers: [String: String]? {
        return [:]
    }
}

extension Network {
    static let provider = MoyaProvider<Network>()
}
