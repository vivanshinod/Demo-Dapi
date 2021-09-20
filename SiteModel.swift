//
//  SiteModel.swift
//  Demo Dapi
//
//  Created by Vivan on 21/09/21.
//

import Foundation
import SwiftUI
import Alamofire
import Combine

let urls = [
    "apple.com",
    "spacex.com",
    "dapi.co",
    "facebook.com",
    "microsoft.com",
    "amazon.com",
    "boomsupersonic.com",
    "twitter.com"
]

final class SiteModel: ObservableObject
{
    @Published var sites: [SiteProduct] = urls.compactMap { SiteProduct($0) }
    let apiService = MyApi()
    
    func callAPI() {
        apiService.callAPI(sites: sites) { (contentLength, image, index) in
            self.sites[index].contentLength = contentLength
            self.sites[index].favicon = image
        }
    }
}
