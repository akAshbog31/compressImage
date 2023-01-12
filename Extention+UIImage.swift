//
//  Extention+UIImage.swift
//  BodyRx
//
//  Created by mac on 12/01/23.
//

import UIKit

extension UIImage {
    func compressImg(to expectedSize: Float) -> Data? {
        let expectedByte = Int(expectedSize * 1024 * 1024)
        var needToCompress: Bool = true
        var imgData: Data?
        var compressingValue: CGFloat = 1.0
        while (needToCompress && compressingValue > 0.0) {
            if let data: Data = self.jpegData(compressionQuality: compressingValue) {
                if data.count < expectedByte {
                    needToCompress = false
                    imgData = data
                } else {
                    compressingValue -= 0.1
                }
            }
        }
        if let imgData = imgData {
            if imgData.count < expectedByte {
                return imgData
            }
        }
        return nil
    }
}
