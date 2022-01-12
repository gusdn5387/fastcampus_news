//
//  NewsResponseModel.swift
//  keywordNews
//
//  Created by Byapps on 2022/01/12.
//

import Foundation

struct NewsResponseModel: Decodable {
    var items: [News] = []
}

struct News: Decodable {
    let title: String
    let link: String
    let description: String
    let pubDate: String
}
