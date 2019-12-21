//
//  Article.swift
//  NYArticles
//
//  Created by Intercell Testing on 27/07/19.
//  Copyright © 2019 Intercell Testing. All rights reserved.
//

import Foundation
struct ArticleApiResponse {
    let status: String
    let numberOfResults: Int
    let copyright: String
    let article: [Article]
}

extension ArticleApiResponse: Decodable {
    
    private enum ArticleApiResponseCodingKeys: String, CodingKey {
        case status
        case numberOfResults = "num_results"
        case copyright
        case article = "results"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ArticleApiResponseCodingKeys.self)
        
        status = try container.decode(String.self, forKey: .status)
        numberOfResults = try container.decode(Int.self, forKey: .numberOfResults)
        copyright = try container.decode(String.self, forKey: .copyright)
        article = try container.decode([Article].self, forKey: .article)
        
    }
}


struct Article {
    let byline: String
    let abstract: String
    let title: String
    let publishedDate: String
    let media: [Media]
}

extension Article: Decodable {
    
    enum ArticleCodingKeys: String, CodingKey {
        case byline
        case abstract
        case title
        case publishedDate = "published_date"
        case media
    }
    
    
    init(from decoder: Decoder) throws {
        let articleContainer = try decoder.container(keyedBy: ArticleCodingKeys.self)
        
        byline = try articleContainer.decode(String.self, forKey: .byline)
        abstract = try articleContainer.decode(String.self, forKey: .abstract)
        title = try articleContainer.decode(String.self, forKey: .title)
        publishedDate = try articleContainer.decode(String.self, forKey: .publishedDate)
        media = try articleContainer.decode([Media].self, forKey: .media)
    }
}

struct Media {
    let type: String
    let subtype: String
}

extension Media: Decodable {
    enum MediaCodingKeys: String, CodingKey {
        case type
        case subtype
    }
    
    
    init(from decoder: Decoder) throws {
        let mediaContainer = try decoder.container(keyedBy: MediaCodingKeys.self)
        
        type = try mediaContainer.decode(String.self, forKey: .type)
        subtype = try mediaContainer.decode(String.self, forKey: .subtype)
    }
}
