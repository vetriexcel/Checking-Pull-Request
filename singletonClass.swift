//
//  singletonClass.swift
//  autoLayout
//
//  Created by excelencia on 16/06/16.
//  Copyright © 2016 excelencia. All rights reserved.
//

import Foundation



class singletonClass {
    
    var indexValue:Int = 0;
    var shouldRotate: Bool = true;
    
    class var sharedInstance : singletonClass
    {
        struct Static {
            static let instance: singletonClass = singletonClass();
        }
        
        return Static.instance;
    }
    
    private init()
    {
        print("Singleton Class initialized");
        
    }
}
