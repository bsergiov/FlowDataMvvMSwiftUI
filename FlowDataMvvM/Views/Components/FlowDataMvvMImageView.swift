//
//  FlowDataMvvMImageView.swift
//  FlowDataMvvM
//
//  Created by BSergio on 20.03.2022.
//

import SwiftUI

struct FlowDataMvvMImageView: View {
    
    @StateObject var loader: ImgLoadingViewModel
    
    init(url: String, key: String) {
        _loader = StateObject(wrappedValue: ImgLoadingViewModel(url: url, key: key))
    }
    
    var body: some View {
        ZStack {
            if loader.isLoading {
                ProgressView()
            } else if let img = loader.image {
                Image(uiImage: img)
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
    }
}

struct FlowDataMvvMImageView_Previews: PreviewProvider {
    static var previews: some View {
        FlowDataMvvMImageView(url: "https://via.placeholder.com/600/92c952", key: "1")
            .frame(width: 75, height: 75)
            .previewLayout(.sizeThatFits)
    }
}
