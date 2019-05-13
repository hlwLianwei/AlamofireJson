//
//  Checker.swift
//  charger_ios
//
//  Created by  xiulin on 2019/3/20.
//  Copyright © 2019 ttkc. All rights reserved.
//

import Foundation

class Checker {
    init(){
    }
    
    class func isEmpty(obj: Any?) -> Bool {
        if (obj != nil)
        {
            if (obj is String)
            {
                return (obj as! String) == ""
            }
            else if obj is Array<Any> {
                return (obj as! Array<Any>).count == 0
            }
            else if obj is Dictionary<String, Any> {
                return (obj as! Dictionary<String, Any>).count == 0
            }
            
            return false
        }
        
        return true
    }
    
    class func isNotEmpty(obj: Any?) -> Bool {
        return !isEmpty(obj: obj)
    }
    
    static func checkPhone(phone: String?) -> Bool
    {
        return regex(pattern: "^1[3456789]\\d{9}$", str: phone)
    }
    
    static func checkPwd(pwd: String?) -> Bool
    {
        return regex(pattern: "^[A-Za-z0-9]+$", str: pwd)
    }
    
    static func checkNum(num: String) -> Bool
    {
        return regex(pattern: "^[0-9]+$", str: num)
    }
    
    /**
     正则表达判断是否含有结果值
     - parameter pattern: 一个字符串类型的正则表达式
     - parameter str: 需要比较判断的对象
     - returns: 返回布尔值判断结果
     - warning: 注意匹配到结果的话就会返回true，没有匹配到结果就会返回false
     */
    static func regex(pattern: String?, str: String?) -> Bool {
        let regex = try! NSRegularExpression(pattern: pattern!, options:[NSRegularExpression.Options.caseInsensitive])
        let resultNum = regex.numberOfMatches(in: str!, options: NSRegularExpression.MatchingOptions(rawValue: 0) , range: NSMakeRange(0, str!.count))
        
        return resultNum >= 1;
    }
}
