//
//  ObjectUtils.swift
//  MyNews App
//
//  Created by sibaprasad on 24/03/18.
//  Copyright © 2018 SP inc. All rights reserved.
//

import Foundation
import UIKit
class ObjectUtils {
    
    
    public static func isNotNull(object:Any) -> Bool{
        if(object != nil){
            return true
        }
        else{
            return false
        }
    }
    
    public static func isEmpty(stringValue:String) -> Bool{
        return (stringValue ).isEmpty
    }
    
    public static func getStringFromInt(intValue:Int) -> String{
        return String(intValue)
    }
    
    public static func getIntFromString(stringValue:String) -> Int{
        let returnValue:Int? = Int(stringValue)
        return returnValue!
    }
    
    public static func getDoubleFromString(stringValue:String) -> Double{
        let returnValue:Double? = Double(stringValue)
        return returnValue!
    }
    
    public static func getgetLongFromString(stringValue:String) -> CLong{
        let returnValue:CLong? = CLong(stringValue)
        return returnValue!
    }
    
    public static func getgetFLoatFromString(stringValue:String) -> Float{
        let returnValue:Float? = Float(stringValue)
        return returnValue!
    }
    
    public static func getgetShortFromString(stringValue:String) -> CShort{
        let returnValue:CShort? = CShort(stringValue)
        return returnValue!
    }
    
}
