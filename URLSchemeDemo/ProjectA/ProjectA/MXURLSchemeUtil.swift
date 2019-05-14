//
//  MXURLSchemeUtil.swift
//  ProjectA
//
//  Created by muhlenXi on 2019/5/13.
//  Copyright © 2019 muhlenXi. All rights reserved.
//

import UIKit

public class MXURLSchemeEntity {
    var scheme: String
    var action: String?
    var parameters: [String : String]?
    
    init(scheme: String, action: String?, parameters: [String: String]?) {
        self.scheme = scheme
        self.action = action
        self.parameters = parameters
    }
}

public class MXURLSchemeUtil {

    static let actionKey = "action"
    
    /// 打开其他 App
    public static func OpenApp(urlScheme: MXURLSchemeEntity,
                               succeedHandler: (() -> Void)? = nil,
                               failedHandler: ((String) -> Void)? = nil) {
        
        var scheme = String.init(format: "%@://", urlScheme.scheme)
        
        if let action = urlScheme.action {
            scheme.append("\(action)")
        }
        
        if let parameters = urlScheme.parameters, parameters.count > 0 {
            var components = [(String, String)]()
            for key in parameters.keys.sorted(by: <) {
                let value = parameters[key]!
                components.append((key, value))
            }
            var queryString = "?"
            queryString += (components.map {"\($0)=\($1)"}).joined(separator: "&")
            scheme.append(queryString)
        }
        
        if let url = URL(string: scheme) {
            if UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                } else {
                    UIApplication.shared.openURL(url)
                }
                succeedHandler?()
            } else {
                failedHandler?("Can not open URL: \(scheme)")
            }
        } else {
            failedHandler?("Can not create URL: \(scheme)")
        }
    }
    
    /// "tel://login?uid=2017"
    public static func convetURLScheme2Dictionary(schemeURL: URL) -> [String: String]? {
        var dictionary = [String: String]()
        if let action = schemeURL.host {
            dictionary[actionKey] = action
        }
        let componetns = URLComponents.init(url: schemeURL, resolvingAgainstBaseURL: true)
        if let queryItems = componetns?.queryItems {
            for item in queryItems {
                dictionary[item.name] = item.value
            }
        }
        if dictionary.count == 0 {
            return nil
        } else {
            return dictionary
        }
    }
}
