//
//  Extensions.swift
//  YoutubeMenuBar
//
//  Created by Manikanta Varma on 5/20/18.
//  Copyright © 2018 Manikanta Varma. All rights reserved.
//

import UIKit

extension CGFloat {
    
    func roundValueOfSize() -> CGFloat {
        let value = Int(self)
        let f = self - CGFloat(value)
        
        if (f > 0 && f < 0.5) {
            return CGFloat(value)
        }else if (f > 0.5 && f < 1 ){
            let val = Double(value) + 0.5
            return CGFloat(val)
        }else{
            return self
        }
    }
    
}
