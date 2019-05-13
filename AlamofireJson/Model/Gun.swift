//
//  Gun.swift
//  AlamofireJson
//
//  Created by  lenway on 2019/4/30.
//  Copyright © 2019 lenway. All rights reserved.
//

import Foundation

class Gun: GsonObj {
    /**
     * id : 1
     * name : 体育中心1号桩A枪
     * state : 2空闲, 3使用, 4故障
     * gunid : 1
     * qrcode : 00010906001A
     * qrcode1 : 0001090600100000A
     */
    
    /** 所有充电站的电枪id */
    var id: Int = 0
    var name: String = ""
    /** 电枪状态：2：空闲；3：使用中；4：离线 */
    var state: Int = 0
    /** 所属电桩的电枪id(一般不大于4) */
    var gunId: Int = 0
    var qrcode: String = ""
    var qrcode1: String = ""
    
}
