//
//  FetchGunList.swift
//  AlamofireJson
//
//  Created by  lenway on 2019/4/30.
//  Copyright © 2019 lenway. All rights reserved.
//

import Foundation

class FetchGunList: BaseRequest {
    private var reqPageNo: Int = 0
    private var reqPageSize: Int = 0
    private var reqPileId: Int = 0
    
    required override init() {
    }
    
    init(pageNo: Int, pageSize: Int, pileId: Int) {
        reqPageNo = pageNo
        reqPageSize = pageSize
        reqPileId = pileId
    }
    
    override func url() -> String {
        return "https://raw.githubusercontent.com/hlwLianwei/AlamofireJson/master/gunlist.json"
    }
}
