//
//  ParserHelper.swift
//  NYTestApp
//
//  Created by Rupesh Kumar on 26/06/18.
//  Copyright © 2018 Rupesh Kumar. All rights reserved.
//

import Foundation
import UIKit

typealias APIResult<T> = (Result<T, ErrorResult>) -> Void

protocol Parsable {
    static func parseObject(dictionary: [String: AnyObject]) -> Result<Self, ErrorResult>
}

final class ParserHelper {
    
    static func parse<T: Parsable>(data: Data, completion :  @escaping (Result<T, ErrorResult>) -> Void) {
        let dispatchCompletion = dispatchMain(completion)
        do {
            
            if let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: AnyObject] {
                switch T.parseObject(dictionary: dictionary) {
                case .failure(let error):
                    dispatchCompletion(.failure(error))
                    break
                case .success(let newModel):
                    dispatchCompletion(.success(newModel))
                    break
                }                
            } else {
                NSLog("Json data is not an array")
                dispatchCompletion(.failure(.parser(string:kAPIParseErrorMessgae)))
            }
        } catch {
            // can't parse json
            NSLog("Error while parsing json data")
            dispatchCompletion(.failure(.parser(string:kAPIParseErrorMessgae)))
        }
    }
    
    static func dispatchMain<T>(_ completion: @escaping (Result<T, ErrorResult>) -> Void) -> (Result<T, ErrorResult>) -> Void {
        return { result in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
}
