//
//  PreferenceUtils.swift
//  MyNews App
//
//  Created by sibaprasad on 28/03/18.
//  Copyright © 2018 SP inc. All rights reserved.
//

import Foundation
class PreferenceUtils{
    
    public static let USER_NAME = "userName"
    public static  let STATE = "State"
    public static  let USER_ID = "userId"
    public static  let TOTAL_POINTS = "total_points"
    public static  let USER_PIC = "userPicture"
    public static  let STATE_ID = "stateId"
    
     public static  let QUESTION_AVAILABLE = "questionAvailable"
    
    private func getUserDefaults() -> UserDefaults{
        return UserDefaults.standard
    }
    
    public static func setUserID(userId:String){
        let defaults = UserDefaults.standard
        defaults.set(userId, forKey:USER_ID)
    }
    
    public static func getUserID()->String{
        let defaults = UserDefaults.standard
        return defaults.string(forKey: USER_ID)!
    }
    
    
    public static func setUserName(userName:String){
        let defaults = UserDefaults.standard
        defaults.set(userName, forKey:USER_NAME)
    }
    
    public static func getUserName()->String{
        let defaults = UserDefaults.standard
        return defaults.string(forKey: USER_NAME)!
    }
    
    
    public static func setState(state:String){
        let defaults = UserDefaults.standard
        defaults.set(state, forKey:STATE)
    }
    
    public static func getState()->String{
        let defaults = UserDefaults.standard
        return defaults.string(forKey: STATE)!
    }
    
    public static func setStateId(stateId:String){
        let defaults = UserDefaults.standard
        defaults.set(stateId, forKey:STATE_ID)
    }
    
    public static func getStateId()->String{
        let defaults = UserDefaults.standard
        return defaults.string(forKey: STATE_ID)!
    }
    
    public static func setUserPic(state:String){
        let defaults = UserDefaults.standard
        defaults.set(state, forKey:USER_PIC)
    }
    
    public static func getUserPic()->String{
        let defaults = UserDefaults.standard
        return defaults.string(forKey: USER_PIC)!
    }
    
    public static func setPoints(state:String){
        let defaults = UserDefaults.standard
        defaults.set(state, forKey:TOTAL_POINTS)
    }
    
    public static func getPoints()->String{
        let defaults = UserDefaults.standard
        return defaults.string(forKey: TOTAL_POINTS)!
    }
    
    public static func setIsDataAvailable(state:Bool){
        let defaults = UserDefaults.standard
        defaults.set(state, forKey:QUESTION_AVAILABLE)
    }
    
    public static func getIsDataAvailable()->Bool{
        let defaults = UserDefaults.standard
        return (defaults.string(forKey: QUESTION_AVAILABLE) != nil)
    }
    
}
