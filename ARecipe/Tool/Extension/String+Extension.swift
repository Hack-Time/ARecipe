//
//  String+Extension.swift
//  ARecipe
//
//  Created by kingcos on 04/11/2017.
//  Copyright © 2017 kingcos. All rights reserved.
//

import UIKit

extension String {
    // 722.024353,1278.094482,1911.626953,2394.639404,0.787994,jichi;
    func seprateString(by character: Character = ";") -> [String] {
        return self.split(separator: character).map {
            String($0)
        }
    }

    func getPoint(by character: Character = ",") -> (CGPoint, CGPoint, String) {
        var strings = self.seprateString(by: character)
        
        let key = strings.removeLast()
//        let toDoubles = strings.map { Double($0)! }
        let toDoubles = strings.map { string in
            return Double(string)! / Double(SCALE)
        }
        let startPoint = CGPoint(x: toDoubles[0], y: toDoubles[1])
        let endPoint = CGPoint(x: toDoubles[2], y: toDoubles[3])
        
        return (startPoint, endPoint, key)
    }
}
