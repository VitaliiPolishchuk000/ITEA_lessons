//
//  MainViewController.swift
//  HomeWorkContriesTravller
//
//  Created by Vitalii on 17.06.2020.
//  Copyright © 2020 Vitalii Polishchuk. All rights reserved.
//

import UIKit

extension UIImage {
    
    var scaleToSafeUploadSize: UIImage? {
        let maxImageSideLenght: CGFloat = 480
        let largerSide: CGFloat = max(size.width, size.height)
        let ratioScale: CGFloat = largerSide > maxImageSideLenght ? largerSide / maxImageSideLenght : 1
        let newImageSize = CGSize(width: size.width / ratioScale, height: size.height / ratioScale)
        return image(scaledTo: newImageSize)
    }
    
    func image(scaledTo size: CGSize) -> UIImage? {
        defer { UIGraphicsEndImageContext() }
        UIGraphicsBeginImageContextWithOptions(size, true, 0)
        draw(in: CGRect(origin: .zero, size: size))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
}
