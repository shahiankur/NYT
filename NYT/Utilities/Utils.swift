
import Foundation

final class Utils {
    
    static func getDateFromString(dateString:String) -> NSDate? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = dateFormatter.date(from:dateString) else {
            NSLog("Date conversion failed due to mismatched format.")
            return NSDate()
        }
        return date as NSDate
    }
    
    static func getStringFromDate(date:Date) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let newDate = dateFormatter.string(from: date)
        return newDate
    }
}
