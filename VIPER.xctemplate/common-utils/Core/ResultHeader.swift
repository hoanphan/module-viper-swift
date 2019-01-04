//
//  Response.swift
//  Library
//
//  Created by Cosmin Stirbu on 2/23/17.
//  MIT License
//
//  Copyright (c) 2017 Fortech
//


import Foundation


// See https://github.com/antitypical/Result
enum ResultHeader<T, HTTPURLResponse> {
    case success(T, HTTPURLResponse)
    case failure(Error)
    
    public func dematerialize() throws -> (T, HTTPURLResponse) {
        switch self {
        case let .success(value, header):
            return (value, header)
        case let .failure(error):
            throw (error)
        }
    }
}
