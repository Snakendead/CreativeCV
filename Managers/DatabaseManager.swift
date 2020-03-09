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
    
    
    //TODO: move into build settings user defined
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
    
    func getSkills() -> [SkillModel] {
        return skills
    }
    
    func getInfo() -> InfoModel? {
        return infoModel
    }
    
    func getWorks() -> [WorkExperienceModel] {
        return experienceWorks
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
        
        if let infoObject = dict["info"] as? [String: AnyObject] {
            parseInfo(dict: infoObject)
        }
        
        if let experienceObject = dict["experience"] as? [String: AnyObject] {
            let array = parseArray(with: "e", dict: experienceObject)
            parseExperienceArray(dictArray: array)
        }
        
        if let skillsObject = dict["skills"] as? [String: AnyObject] {
            let array = parseArray(with: "s", dict: skillsObject)
            parseSkillsArray(dictArray: array)
        }
        
        successCallback?()
    }
    
    private func parseArray(with prefix: String, dict: [String: AnyObject]) -> [[String:AnyObject]] {
        var result = [[String:AnyObject]]()

        var increment = 1
        while let object = dict["\(prefix)\(increment)"] as? [String: AnyObject] {
            result.append(object)
            increment += 1
        }
        
        return result
    }
    
    //MARK: parsing objects
    
    private func parseInfo(dict: [String: AnyObject]) {
        guard let name = dict["name"] as? String,
            let surname = dict["surname"] as? String,
            let phone = dict["phone"] as? String,
            let lat = dict["locationLat"] as? Double,
            let lon = dict["locationLon"] as? Double else {
                return
        }
        
        let info = InfoModel(with: name,
                             surname: surname,
                             phone: phone,
                             locationLatitude: lat,
                             locationLongitude: lon)
        
        self.infoModel = info
    }
    
    private func parseExperienceArray(dictArray: [[String: AnyObject]]) {
        for dict in dictArray {
            guard let role = dict["role"] as? String,
                let start = dict["start"] as? String,
                let end = dict["end"] as? String,
                let company = dict["company"] as? String,
                let info = dict["description"] as? String else {
                    continue
            }

            let object = WorkExperienceModel(with: company,
                                             role: role,
                                             info: info,
                                             startTime: start,
                                             endTime: end)
            experienceWorks.append(object)
        }
    }
    
    private func parseSkillsArray(dictArray: [[String: AnyObject]]) {
        for dict in dictArray {
            guard let name = dict["name"] as? String,
                let grade = dict["grade"] as? String,
                let info = dict["description"] as? String else {
                    continue
            }

            guard let gradeInt = Int(grade) else { continue }
            let object = SkillModel(with: name, grade: gradeInt, info: info)
            skills.append(object)
        }
    }

}
