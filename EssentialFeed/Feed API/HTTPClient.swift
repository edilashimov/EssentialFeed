//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by Edil Ashimov on 6/26/21.
//

import Foundation

//MARK: MAIN HTTPCLIENT PROTOCOL
public enum HTTPClientResult {
    case success(Data, HTTPURLResponse)
    case failure(Error)
}

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}
