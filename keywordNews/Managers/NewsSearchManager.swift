//
//  NewsSearchManager.swift
//  keywordNews
//
//  Created by Byapps on 2022/01/12.
//

import Foundation
import Alamofire

protocol NewsSearchManagerProtocol {
    func request(
        from keyword: String,
        start: Int,
        display: Int,
        completionHandler: @escaping([News]) -> Void
    )
}

struct NewsSearchManager: NewsSearchManagerProtocol {
    func request(
        from keyword: String,
        start: Int,
        display: Int,
        completionHandler: @escaping([News]) -> Void
    ) {
        guard let url = URL(string: "https://openapi.naver.com/v1/search/news.json") else { return }
        
        let parameters = NewsRequestModel(start: start, display: display, query: keyword)
        let headers: HTTPHeaders = [
            "X-Naver-Client-Id": "pObLxxLRFIDvslSsXRUH",
            "X-Naver-Client-Secret": "eVrBDNgR7F"
        ]
        
        AF.request(url, method: .get, parameters: parameters, headers: headers).responseDecodable(of: NewsResponseModel.self) { response in
            switch response.result {
            case .success(let result):
                completionHandler(result.items)
            case .failure(let error):
                print(error)
            }
        }.resume()
    }
}
