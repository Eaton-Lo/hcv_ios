import UIKit
import Alamofire
import SwiftyJSON

class APIManager: NSObject {
    
    class func requestWithJsonContent(url:String, method:HTTPMethod = .get, parameters:Parameters?, encoding:ParameterEncoding = JSONEncoding.default, headers: HTTPHeaders? = nil , callback:@escaping (JSON,NSInteger) -> Void){
        var encodingMethod = encoding
        var passHeader:HTTPHeaders = headers == nil ? [:] : headers!;
        
        passHeader["Content-Type"] = "application/json"
        
        if(method == .get){
            encodingMethod = URLEncoding.default
        }
        
        print("Request to " , url)
        Alamofire.request(url, method: method, parameters: parameters, encoding:encodingMethod , headers: passHeader).responseJSON(completionHandler: { response in
            var responseJSON: JSON
            
            if(response.result.isFailure){
                responseJSON = JSON.null
            }else{
                responseJSON = SwiftyJSON.JSON(response.result.value!)
            }
            callback(responseJSON,response.response!.statusCode)
        })
    }
}

