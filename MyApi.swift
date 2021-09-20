//
//  MyApi.swift
//  Demo Dapi
//
//  Created by Vivan on 21/09/21.
//

import Foundation
import Alamofire
import FavIcon

class MyApi{
    let dispatchQueue = DispatchQueue(label: "myQueue", qos: .background)
        
        let semaphore = DispatchSemaphore(value: 0)
        
        func callAPI(sites: [SiteProduct], completion: @escaping (String, UIImage, Int) -> Void) {
            dispatchQueue.async {
                for (index, site) in sites.enumerated() {
                    
                    let url = site.fullURL
                    var length = ""
                    var image = UIImage(named: "no_image.png")!
                    
                    self.downloadFaviconIcon(url: url) { (imageFavicon) in
                        image = imageFavicon
                        AF.request(url, method: .get).response() { response in
                            
                            if response.error == nil {
                                if let data = response.data {
                                    let bcf = ByteCountFormatter()
                                    bcf.countStyle = .file
                                    let sizeString = bcf.string(fromByteCount: Int64(data.count))
                                    length = sizeString
                                }
                            } else {
                                length = "0 Bytes"
                            }
                            completion(length, image, index)
                            self.semaphore.signal()
                        }
                    }
                    self.semaphore.wait()
                }
            }
            
        }
        
        
        private func downloadFaviconIcon(url : String, completion: @escaping (UIImage) -> Void) {
            do {
                try FavIcon.downloadPreferred(url, width: 40, height: 40) { result in
                    if case let .success(image) = result {
                        completion(image)
                    } else {
                        completion(UIImage(named: "no_image.png")!)
                    }
                }
            } catch {
                completion(UIImage(named: "no_image.png")!)
            }
        }
}
