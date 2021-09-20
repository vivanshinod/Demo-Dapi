//
//  SiteProduct.swift
//  Demo Dapi
//
//  Created by Vivan on 21/09/21.
//

import Foundation
import Combine
import UIKit

class SiteProduct:Identifiable,ObservableObject {
    var id = UUID()
        @Published var url: String
        @Published var contentLength: String?
        @Published var favicon: UIImage?
        
        var fullURL: String {
            if url.hasPrefix("http") {
                return url
            } else {
                return "https://\(url)"
            }
        }
        
        init(_ urlString: String) {
            url = urlString
        }
    
}
