//
//  UserDataManager.swift
//  SwiftAppDay2
//
//  Created by cse on 2020. 2. 4..
//  Copyright © 2020년 cse. All rights reserved.
//

import UIKit

class UserDataManager: NSObject {

    static let LIST_KEY_DEFAULT = "defalut"
    
    static let shared = UserDataManager()
    private override init () {
        super.init()
    }
    
    func saveList(with key:String,
                  list:[TimeInterval])->Bool {
        UserDefaults.standard.set(list, forKey: key)
        
        //최신 데이터로 유지
        return UserDefaults.standard.synchronize()
    }
    
    func getList(with key:String)->[TimeInterval]{
        if let list = UserDefaults.standard.value(forKey: key) as? [TimeInterval] {//가져온 데이터의 타입이 TimeInterval인지 타입체킹,null체킹.
            return list
        }
        return []
    }
    
    func getMemo(with timeStampString:String)->String {
        if let memo = UserDefaults.standard.value(forKey: timeStampString) as? String {
            return memo
        }
        
        return ""
    }
    
    func saveMemo(with timeStampStr:String, memo:String)->Bool {
        UserDefaults.standard.set(memo, forKey: timeStampStr)
        return UserDefaults.standard.synchronize()
    }
}
