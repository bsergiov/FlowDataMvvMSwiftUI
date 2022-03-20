//
//  ContentView.swift
//  FlowDataMvvM
//
//  Created by BSergio on 20.03.2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = FlowDataMvvMViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.imgs) { img in
                    FlowDataMvvMRow(img: img)
                }
            }
            .navigationTitle("Flow Data MvvM")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
