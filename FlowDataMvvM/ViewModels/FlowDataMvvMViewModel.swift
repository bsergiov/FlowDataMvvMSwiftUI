//
//  FlowDataMvvMViewModel.swift
//  FlowDataMvvM
//
//  Created by BSergio on 20.03.2022.
//

import Foundation
import Combine

class FlowDataMvvMViewModel: ObservableObject {
    
    @Published var imgs: [ImgModel] = []
    var cancellables = Set<AnyCancellable>()
    
    let networkManager = NetworkManager.instance
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        networkManager.$imgs
            .sink { [weak self] returnedImgs in
                guard let self = self else { return }
                self.imgs = returnedImgs
            }
            .store(in: &cancellables)
    }
}
