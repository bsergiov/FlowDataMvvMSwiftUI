//
//  ImgLoadingViewModel.swift
//  FlowDataMvvM
//
//  Created by BSergio on 20.03.2022.
//

import Foundation
import SwiftUI
import Combine
 
class ImgLoadingViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private var cancellabel = Set<AnyCancellable>()
    
    // Saving to caches
    private let manager = ImgCacheManager.instance
    
    //  Saving to local file/LocalManager
//    private let manager = ImgFileManager.instance
    
    let urlString: String
    let imgKey: String
    
    init(url: String, key: String) {
        urlString = url
        imgKey = key
        
        getImage()
    }
    
    func getImage() {
        if let savedImg = manager.get(key: imgKey) {
            image = savedImg
            print("Getting saved img!")
        } else {
            fetchImg()
            print("Downloading img now!")
        }

    }
    
    func fetchImg() {
        isLoading = true
        guard let url = URL(string: urlString ) else {
            isLoading = false
            return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data)}
            .receive(on: DispatchQueue.main)
            .sink {[weak self] _ in
                self?.isLoading = false
            } receiveValue: { [weak self] returnedImage in
                guard
                    let self = self,
                let image = returnedImage
                else { return}
                self.image = returnedImage
                self.manager.add(key: self.imgKey, value: image)
            }
            .store(in: &cancellabel)
    }
    
}
