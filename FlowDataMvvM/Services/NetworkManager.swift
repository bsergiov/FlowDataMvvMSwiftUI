//
//  NetworkManager.swift
//  FlowDataMvvM
//
//  Created by BSergio on 20.03.2022.
//
import Foundation
import Combine

class NetworkManager {
    
    static let instance = NetworkManager()
    @Published var imgs: [ImgModel] = []
    var cancellables = Set<AnyCancellable>()
    
    private init() {
        fetchData()
    }
    
    func fetchData() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else { return}
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: [ImgModel].self, decoder: JSONDecoder())
            .sink { (completion) in
                switch completion {
                    
                case .finished:
                    break
                case .failure(let error):
                    print("Error downlonding Data: \(error)")
                }
            } receiveValue: { [weak self] returnedImgs in
                guard let self = self else { return }
                self.imgs = returnedImgs
            }
            .store(in: &cancellables)
    }
    
    private func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
}
