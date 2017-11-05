//
//  MainViewModel.swift
//  ARecipe
//
//  Created by kingcos on 05/11/2017.
//  Copyright © 2017 kingcos. All rights reserved.
//

import Foundation

class MainViewModel {
    var mlResult: MLResult?
    
    func request(imageData: Data, completion: @escaping (String?) -> ()) {
        Network
            .provider
            .request(.getResult(imageName: "\(UUID().uuidString).jpg",
                imageData: imageData)) { result in
                    switch result {
                    case .success(let response):
                        let decoder = JSONDecoder()
                        self.mlResult = try? decoder
                            .decode(MLResult.self,
                                    from: response.data)
//                        guard let strings = self.mlResult?.bbox.seprateString() else {
//                            return
//                        }
//                        completion(strings)
                        completion(self.mlResult?.bbox)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
        }
    }
}
