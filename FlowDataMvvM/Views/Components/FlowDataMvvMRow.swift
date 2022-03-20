//
//  FlowDataMvvMRow.swift
//  FlowDataMvvM
//
//  Created by BSergio on 20.03.2022.
//

import SwiftUI

struct FlowDataMvvMRow: View {
    
    let img: ImgModel
    
    var body: some View {
        HStack {
            FlowDataMvvMImageView(url: img.url, key: "\(img.id)")
                .frame(width: 75, height: 75)
            VStack(alignment: .leading) {
                Text(img.title)
                    .font(.headline)
                Text(img.url)
                    .foregroundColor(.gray)
            }
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct FlowDataMvvMRow_Previews: PreviewProvider {
    static var previews: some View {
        FlowDataMvvMRow(img: ImgModel(albumId: 1, id: 1, title: "Some Title", url: "https://via.placeholder.com/600/92c952", thumbnailUrl: "This thumbnailUrl"))
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
