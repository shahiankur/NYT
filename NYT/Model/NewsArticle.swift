import Foundation

// MARK: - Model

struct NewsData {
    var articles: [Article]?
}

extension NewsData: Parsable {
    static func parseObject(dictionary: [String : AnyObject]) -> Result<NewsData, ErrorResult> {
        if let results = dictionary["results"] as? [[String: Any]] {
            let articles = results.map({ Article(articleDict: $0)}).compactMap{$0}
            let meta = NewsData(articles: articles)
            return Result.success(meta)
        } else {
            return Result.failure(ErrorResult.parser(string: "Unable to parse API response"))
        }
    }
}

// MARK: - Model

struct Article {
    
    // MARK: - Model Keys
    
    let name:String!
    let byLineString:String?
    let abstractInfo:String?
    let source: String?
    let updatedDate: String?
    let type: String?
    var caption: String?
    var imageUrl:String?
    var publishedDate:Date!
    
    // MARK: - Intializer
    
    init(articleDict:Dictionary<String,Any>) {
        self.name = articleDict[kServerDataJSONKeyTitle] as? String
        self.byLineString = articleDict[kServerDataJSONKeyByLine] as? String
        self.abstractInfo = articleDict[kServerDataJSONKeyAbstract] as? String
        self.source = articleDict[kServerDataJSONKeySource] as? String
        self.updatedDate = articleDict[kServerDataJSONKeyUpdatedDate] as? String
        self.type = articleDict[kServerDataJSONKeyType] as? String
        if let dateString = articleDict[kServerDataJSONKeyPublishedDate] as? String {
            self.publishedDate = Utils.getDateFromString(dateString: dateString)! as Date
        }
        if let media = articleDict[kServerDataJSONKeyMedia] as? [Dictionary<String,Any>] {
            if let media_metaData = media.first?[kServerDataJSONKeyMediaMetaData] as? [Dictionary<String,Any>] {
                self.imageUrl = media_metaData.first?[kServerDataJSONKeyImageURL] as? String
            }
            self.caption = media.first?[kServerDataJSONKeyCaption] as? String
        }
    }
}
