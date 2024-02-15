//
//  NetworkConstants.swift
//  MovieExplorer
//
//  Created by Md Omar Faruq on 16/2/24.
//

import Foundation
class NetworkConstants {
    public static var shared: NetworkConstants = NetworkConstants()
    public var apiKey: String {
        get {
            return "8cb15aa4aa8011e577af1a6059db4243"
        }
    }
    public var serverAddress: String {
        get {
            return "https://api.themoviedb.org/3/"
        }
    }
    
    public var imageServerAddress: String {
        get {
            return "https://image.tmdb.org/t/p/w500/"
        }
    }
    
}
