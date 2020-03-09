//
//  DatabaseManager.swift
//  CreativeCV
//
//  Created by Vladimir Vasilyev on 09/03/2020.
//  Copyright © 2020 Vladimir Vasilyev. All rights reserved.
//

import UIKit

class DatabaseManager: NSObject {

    private var infoModel: InfoModel? = nil
    private var experienceWorks: [WorkExperienceModel] = []
    private var skills: [SkillModel] = []
    
    private let urlString = "https://gist.githubusercontent.com/Snakendead/9ce9cc098d06126c5491ddef2d2530fe/raw/42678529ceff99db90441fcefdf84e27204d1de5/gistfile1.txt"
    
    private var successCallback: (() -> Void)? = nil
    private var failureCallback: ((Error) -> Void)? = nil
    
    private let errorDomain = "com.revolage"
    
    //MARK: Public
    
    func downloadDatabaseFile(with success: @escaping () -> Void, failure: @escaping (Error) -> Void) {
        successCallback = success
        failureCallback = failure
        
        guard let url = URL(string: urlString) else {
            let error = NSError(domain: errorDomain, code: 100, userInfo: [NSLocalizedDescriptionKey: "Wrong request URL"])
            failure(error)
            return
        }
        
        load(url: url)
    }
    
    //MARK: Private
    
    private func load(url: URL) {
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        let request = URLRequest(url: url)
        
        let task = session.dataTask(with: request) {
            [weak self]
            (data, response, error) in
            
            guard let self_ = self else { return }
            
            if let error_ = error {
                self_.failureCallback?(error_)
                return
            }
            
            guard let data_ = data else {
                let dataError = NSError(domain: self_.errorDomain, code: 100, userInfo: [NSLocalizedDescriptionKey: "Request data is empty"])
                self_.failureCallback?(dataError)
                return
            }
            
            let jsonObject = try? JSONSerialization.jsonObject(with: data_, options: JSONSerialization.ReadingOptions.allowFragments)
            
            guard let jsonDict = jsonObject as? [String: AnyObject] else {
                let dataError = NSError(domain: self_.errorDomain, code: 100, userInfo: [NSLocalizedDescriptionKey: "Request data is not dict"])
                self_.failureCallback?(dataError)
                return
            }
            
            self_.parseResult(dict: jsonDict)
        }
        
        task.resume()
    }
    
    private func parseResult(dict: [String: AnyObject]) {
        print(dict)
    }

}
