//
//  BaseRequest.swift
//  AlamofireJson
//
//  Created by  lenway on 2019/4/30.
//  Copyright © 2019 lenway. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import HandyJSON

class RespResult<T: Codable> : Codable, HandyJSON {
    required init(){}
    var status: Int = 0
    var message: String? = ""
    // 嵌套模型
    var result: T? = nil
}

class BaseRequest:NSObject {
    let GET: String = "get"
    let POST: String = "post"
    let PUT: String = "put"
    let DELETE: String = "delete"
    typealias startBlock = (()->())
    typealias SuccessBlock = ((_ body: Codable)->())
    typealias errorBlock = ((_ body: Codable)->())
    typealias finishBlock = (()->())
    
    func url() -> String {
        return ""
    }
    
    func method() -> String {
        return "GET"
    }
    
    func postBody() -> [String:Any] {
        // JSONObject
        let emptyDict = [String: Any]()
        return emptyDict;
    }
    
    //重写
    override init() {
        //super.init()
    }
    
    func send<T: Codable>(entity: T, onStart:startBlock?, onSuccess:SuccessBlock?, onError:errorBlock?, onFinish:finishBlock?) -> Void{
        
        let strUrl = url().addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        if onStart != nil {
            onStart!()
        }
        
        Alamofire.request(strUrl).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                //当响应成功是，使用临时变量value接受服务器返回的信息并判断是否为[String: AnyObject]类型 如果是那么将其传给其定义方法中的success
                print("\(value)")
                // 装箱拆箱可以参考 https://www.jianshu.com/p/bf6aeaad273e
                let dict = value as! NSDictionary
                let body = RespResult<T>.deserialize(from: dict)
                
                if body == nil || body!.status != 0{
                    if  onError != nil {
                        onError!(body)
                    }
                }
                else{
                    if onSuccess != nil {
                        onSuccess!(body)
                    }
                }
                print(value)
            case .failure(let error):
                print("request error: \(error.localizedDescription)")
                
                if  onError != nil {
                    let body = RespResult<T>()
                    body.message = "error: \(error.localizedDescription)"
                    onError!(body)
                }
            }
            
            if onFinish != nil {
                onFinish!()
            }
        }
        
        /*Alamofire.request(strUrl).responseCustomObject(type: RespResult<T>.self) {
            (response) in
            switch response.result {
            case .success(let value):
                //print(StringUtil.getClassName(cls: type(of : self)) + ".RespResult:\n\(value)")
                print("request value:\n\(value.toJsonString()!) \n")
                
                let body = value
                
                if body.status != 0{
                    if  onError != nil {
                        onError!(body)
                    }
                }
                else{
                    if onSuccess != nil {
                        onSuccess!(body)
                    }
                }
                print(value)
            case .failure(let error):
                print("request error: \(error.localizedDescription)")
                
                if  onError != nil {
                    let body = RespResult<T>()
                    body.message = "error: \(error.localizedDescription)"
                    onError!(body)
                }
            }
            
            if onFinish != nil {
                onFinish!()
            }
        }*/
    }
}

extension DataRequest {
    static func customResponseSerializer<T: Codable>(type: T.Type) -> DataResponseSerializer<T> {
        return DataResponseSerializer(serializeResponse: { (request, response, data, error) -> Result<T> in
            guard error == nil else {
                return .failure(error!)
            }
            
            let result = Request.serializeResponseData(response: response, data: data, error: nil)
            switch result {
            case .success(let validData):
                print(validData)
                do {
                    let entity = try JSONDecoder().decode(T.self, from: validData)
                    //let parsed = try decoder.decode(T.self, from: validData)
                    return .success(entity)
                } catch {
                    return .failure(error)
                }
            case .failure(let error):
                return .failure(error)
            }
        })
    }
    
    @discardableResult
    func responseCustomObject<T: Codable>(queue: DispatchQueue? = nil, type: T.Type, completion: @escaping (DataResponse<T>) -> Void) -> Self {
        return response(queue: queue, responseSerializer: Alamofire.DataRequest.customResponseSerializer(type: type), completionHandler: completion)
    }
}
