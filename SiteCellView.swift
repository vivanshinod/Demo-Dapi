//
//  SiteCellView.swift
//  Demo Dapi
//
//  Created by Vivan on 21/09/21.
//

import SwiftUI
struct SiteCellView: View {
    
    @ObservedObject var site: SiteProduct
    
    var body: some View {
        HStack(alignment: .top) {

            if let favicon = site.favicon {
                Image(uiImage: favicon)
                    .resizable()
                    .aspectRatio(contentMode: .fit).frame(width: 40, height: 40)
            }
            
            VStack(alignment: .leading) {
                Text(site.url).bold()
                if let contentLength = site.contentLength
                {
                    Text(contentLength).foregroundColor(.gray)
                }
            }
            
        }
        
    }
}

struct SiteCellView_Previews: PreviewProvider {
    static var previews: some View {
        SiteCellView(site: SiteProduct("apple.com"))
    }
}
