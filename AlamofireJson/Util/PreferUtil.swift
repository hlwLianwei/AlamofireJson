//
//  PreferUtil.swift
//  charger_ios
//
//  Created by  xiulin on 2019/3/20.
//  Copyright © 2019 ttkc. All rights reserved.
//

import Foundation

class PreferUtil {
    static let msUserDefault = UserDefaults.standard
    
    init(){
    }
    
    /**
     * 清除所有数据
     */
    class func clearAll() -> Void{
        let dics = msUserDefault.dictionaryRepresentation()
        for key in dics {
            msUserDefault.removeObject(forKey: key.key)
        }
        msUserDefault.synchronize()
    }
    
    /**
     * 移除项
     * @param name 键值
     */
    class func remove(name: String) -> Void{
        msUserDefault.removeObject(forKey: name)
    }
    
    /**
     * 返回 bool 值
     * @param key 键值
     * @param defValue 默认值
     */
    class func  getBooleanPreference(key: String, defValue: Bool) -> Bool{
        let value = msUserDefault.bool(forKey: key)
        if (Checker.isEmpty(obj: value)){
            return defValue
        }
        return value
    }
    
    /**
     * 设置 bool 值
     * @param key 键值
     * @param value 值
     *
     */
    class func setBooleanPreference(key: String, value: Bool) -> Void{
        msUserDefault.set(value, forKey: key)
    }
    
    /*
     * 返回字符串
     * @param key 键值
     */
    class func getStringPreference(key: String) -> String{
        let value = msUserDefault.string(forKey: key)
        if (Checker.isEmpty(obj: value)){
            return ""
        }
        
        return value!
    }
    
    
    /**
     * 设置字符串
     * @param key 键值
     * @param value 值
     */
    class func setStringPreference(key: String, value: String) -> Void{
        msUserDefault.set(value, forKey: key)
    }
    
    /**
     * 返回整数类型
     * @param key 键值
     * @param defValue 默认值
     */
    class func getIntPreference(key: String, defValue: Int) -> Int{
        let value = msUserDefault.integer(forKey: key)
        if (Checker.isEmpty(obj: value)){
            return defValue
        }
        return value
    }
    
    /**
     * 设置整数类型
     * @param key 键值
     * @param value 值
     */
    class func setIntPreference(key: String, value: Int) -> Void{
        msUserDefault.set(value, forKey: key)
    }
    
    /**
     * 返回长整形
     * @param key 键值
     * @param defValue 默认值
     */
    class func getLongPreference(key: String, defValue: Int64) -> Int64{
        let value = msUserDefault.object(forKey: key)
        if (Checker.isNotEmpty(obj: value) )
        {
            return value as! Int64
        }
        return 0
    }
    
    /**
     * 设置长整形
     * @param key 键值
     * @param value 值
     */
    class func setLongPreference(key: String, value: Int64) -> Void{
        msUserDefault.set(value, forKey: key)
    }
    
    /**
     * 返回Array类型
     * @param key 键值
     * @param defValue 默认值
     */
    class func getArrayPreference(key: String) -> [String]{
        let value = msUserDefault.array(forKey: key)
        if (Checker.isNotEmpty(obj: value) )
        {
            return value as! [String]
        }
        return [String].init()
    }
    
    /**
     * 设置Array类型
     * @param key 键值
     * @param value 值
     */
    class func setArrayPreference(key: String, value: [String]) -> Void{
        msUserDefault.set(value, forKey: key)
    }
}
