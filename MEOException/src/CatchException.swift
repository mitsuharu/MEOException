//
//  CatchException.swift
//  MEOException
//
//  Created by Mitsuhau Emoto on 2019/01/18.
//  Copyright © 2019 Mitsuhau Emoto. All rights reserved.
//

import UIKit

class CatchException: NSObject {
    static func doBlock(block:@escaping Block){
        ExcBlock.execute(block) { (exception) in
            print("exc \(exception.name), \(exception.description)")
        }
    }
}
