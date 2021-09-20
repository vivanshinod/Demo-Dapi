//
//  ContentView.swift
//  Demo Dapi
//
//  Created by Vivan on 21/09/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: SiteModel = SiteModel()
    @State private var isVisibleStart = true
    
    var body: some View {
        NavigationView {
            
            List(viewModel.sites) { site in
                SiteCellView(site: site)
            }
            .navigationBarTitle("Sites")
            
            .navigationBarItems(trailing:
                                    Button("Start") {
                                        isVisibleStart = false
                                        viewModel.callAPI()
                                    }.foregroundColor(.blue)
                                    .opacity(isVisibleStart ? 1 : 0))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
