
import Foundation


enum NetworkEnvironment {
    case qa
    case production
    case staging
}

public enum ArticleApi {
    case search
    case popular(days: Int)
    case moviesReview
}

extension ArticleApi: EndPointType {
    
    var environmentBaseURL : String {
        switch NetworkManager.environment {
        case .production: return "http://api.nytimes.com/svc/"
        case .qa: return ""
        case .staging: return ""
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .search:
            return "search"
        case .popular(let days):
            return "mostpopular/v2/viewed/\(days).json"
        case .moviesReview:
            return "moviesReview"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch self {
        case .popular( _):
            return .requestParameters(bodyParameters: nil,
                                      bodyEncoding: .urlEncoding,
                                      urlParameters: ["api-key":NetworkManager.ArticleAPIKey])
        default:
            return .request
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}


