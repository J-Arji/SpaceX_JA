//
//  URLRequest+CURL.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/23/24.
//

import Foundation
extension URLRequest {

    /**
     Returns a cURL command representation of this URL request.
     */
    public var curlString: String {
        guard let url = url else { return "" }
#if swift(>=5.0)
        var baseCommand = #"curl "\#(url.absoluteString)""#
#else
        var baseCommand = "curl \"\(url.absoluteString)\""
#endif
        if httpMethod == "HEAD" {
            baseCommand += " --head"
        }

        var command = [baseCommand]

        if let method = httpMethod, method != "GET" && method != "HEAD" {
            command.append("-X \(method)")
        }

        if let headers = allHTTPHeaderFields {
            for (key, value) in headers where key != "Cookie" {
                command.append("-H '\(key): \(value)'")
            }
        }

        if let data = httpBody, let body = String(data: data, encoding: .utf8) {
            command.append("-d '\(body)'")
        }

        return command.joined(separator: " \\\n\t")
    }

}
