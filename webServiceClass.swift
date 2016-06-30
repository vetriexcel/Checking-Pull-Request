//
//  webServiceClass.swift
//  autoLayout
//
//  Created by excelencia on 16/06/16.
//  Copyright © 2016 excelencia. All rights reserved.
//

import Foundation

class webServiceClass {
    
    var indexValue:Int = 0;
    
    class var webServiceSharedInstance : webServiceClass
    {
        struct Static {
            static let instance: webServiceClass = webServiceClass();
        }
        
        return Static.instance;
    }
    
    private init()
    {
        print("webServiceSharedInstance Class initialized");
        
    }
    
    func getMethod(path:String) {
        
        var resultDict:NSDictionary = NSDictionary()
        
        dispatch_async(dispatch_get_main_queue()) {
            
            //Convert into URL
            
            let urlStr = NSURL(string: path);
            
            //Create session
            
            let session = NSURLSession.sharedSession()
            
            //create Task
            
            let Task = session.dataTaskWithURL(urlStr!, completionHandler: {(data, response, error) in
                
                do{
                    if let jsonResult = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary
                    {                        
                        resultDict = jsonResult;
                        
                        NSNotificationCenter.defaultCenter().postNotificationName("webServiceLoaded", object: resultDict);
                    }
                }
                catch
                {
                    print("something wrong")
                }
            })
            
            Task.resume();
            

        };
     
    }
}
