//
//  ViewController.swift
//  AlamofireJson
//
//  Created by  xiulin on 2019/5/13.
//  Copyright © 2019 lenway. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        fetchGunData()
        fetchGunListData()
    }
    
    func fetchGunData() -> Void {
        FetchGun(id: 1).send(entity: Gun(), onStart:{
            () -> Void in
            //NSLog("Login:%@", "onStart")
        }, onSuccess: {
            (response) -> Void in
            let body = response as! RespResult<Gun>
            if body.status == 0{
                //print("result:\n \(body.result!.toJsonString()!) \n")
            }
        }, onError:nil, onFinish: nil)
    }
    
    func fetchGunListData() -> Void {
        FetchGunList(pageNo: 0, pageSize: 100, pileId: 1).send(entity: [Gun](), onStart:{
            () -> Void in
            //NSLog("Login:%@", "onStart")
        }, onSuccess: {
            (response) -> Void in
            let body = response as! RespResult<[Gun]>
            if body.status == 0{
                //print("result:\n \(body.result!.toJsonString()!) \n")
            }
        }, onError:nil, onFinish: nil)
    }

}

