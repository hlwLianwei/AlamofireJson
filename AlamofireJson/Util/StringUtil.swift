//
//  StringUtil.swift
//  charger_ios
//
//  Created by 刘继业 on 2019/4/19.
//  Copyright © 2019 ttkc. All rights reserved.
//

import Foundation

class StringUtil
{
    static func getClassName(cls : AnyClass) -> String
    {
        let str : String = NSStringFromClass(cls)
        return str
    }
}
