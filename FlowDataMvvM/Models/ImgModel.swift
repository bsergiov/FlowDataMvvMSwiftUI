//
//  ImgModel.swift
//  FlowDataMvvM
//
//  Created by BSergio on 20.03.2022.
//

import Foundation

/*
{
    "albumId": 1,
    "id": 1,
    "title": "accusamus beatae ad facilis cum similique qui sunt",
    "url": "https://via.placeholder.com/600/92c952",
    "thumbnailUrl": "https://via.placeholder.com/150/92c952"
  }
 */
struct ImgModel: Codable, Identifiable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
