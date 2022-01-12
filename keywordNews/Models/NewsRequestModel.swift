//
//  NewsRequestModel.swift
//  keywordNews
//
//  Created by Byapps on 2022/01/12.
//

import Foundation

struct NewsRequestModel: Codable {
    /// 시작 Index, 1 ~ 1000
    let start: Int
    /// 검색 결과 출력 건수
    let display: Int
    /// 검색어
    let query: String
}
