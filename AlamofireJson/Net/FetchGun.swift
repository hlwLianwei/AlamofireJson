//
//  FetchGun.swift
//  AlamofireJson
//
//  Created by  lenway on 2019/4/11.
//  Copyright © 2019 lenway. All rights reserved.
//

import Foundation

class FetchGun: BaseRequest {
    private var reqId: Int = 0
    
    required override init() {
    }
    
    init(id: Int) {
        reqId = id
    }
    
    override func url() -> String {
        return "https://raw.githubusercontent.com/hlwLianwei/AlamofireJson/master/gun.json"
    }
}
