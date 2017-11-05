//
//  UIImage+Extension.swift
//  ARecipe
//
//  Created by kingcos on 05/11/2017.
//  Copyright © 2017 kingcos. All rights reserved.
//

import UIKit

extension UIImage {
    func scale(by scale: CGFloat) -> UIImage {
        let newSize = CGSize(width: size.width / scale,
                             height: size.height / scale)
        UIGraphicsBeginImageContextWithOptions(newSize,
                                               false,
                                               UIScreen.main.scale)
        draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        guard let result = newImage else { fatalError() }
        return result
    }
}
