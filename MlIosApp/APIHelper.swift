import UIKit
import Alamofire
import SwiftyJSON

class APIHelper: NSObject {
    static let apiAddress = "https://requestb.in/1k8djra1"
    
    class func postParams (parameters:[String : Any],callback:@escaping(JSON,NSInteger) -> Void) {
        APIManager.requestWithJsonContent(url: apiAddress, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil, callback: callback)
    }
}

