
import Foundation

import UIKit

//API response keys
let kServerDataJSONKeyTitle:String  = "title"
let kServerDataJSONKeyByLine:String  = "byline"
let kServerDataJSONKeyPublishedDate:String  = "published_date"
let kServerDataJSONKeyMedia:String  = "media"
let kServerDataJSONKeyResult:String  = "results"
let kServerDataJSONKeyAbstract:String  = "abstract"
let kServerDataJSONKeyMediaMetaData:String  = "media-metadata"
let kServerDataJSONKeyImageURL:String  = "url"
let kServerDataJSONKeySource:String  = "source"
let kServerDataJSONKeyUpdatedDate:String  = "updated"
let kServerDataJSONKeyType:String  = "type"
let kServerDataJSONKeyCaption:String  = "caption"

// API URLS
let APIKey = "u9k9IXf5LUSoM8a0aaaHwkvJ2pExtBfa"
let kAPIPeriods:Int = 7
let kAPISections = "all-sections"
let API_BASE_URL: String = "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/"

let NEWS_API_URL = API_BASE_URL + "/\(kAPISections)" + "/\(kAPIPeriods)" + ".json?api-key=\(APIKey)"

//String constants
let kNewsTitleString = "NY Times Most Popular"
let kOkButtonTitle = "OK"
let kNoNetworkErrorMessgae = "Internet is not availble. please check your internet setting and try again."
let kNetworkErrorMessgae = "Network error occurred!. Please check your internet and try again."
let kAPIParseErrorMessgae = "An error occurred while processing response!. Please check your internet setting and try again later"

