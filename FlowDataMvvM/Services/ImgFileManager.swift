//
//  ImgFileManager.swift
//  FlowDataMvvM
//
//  Created by BSergio on 20.03.2022.
//

import Foundation
import SwiftUI

class ImgFileManager {
    
    static let instance = ImgFileManager()
    
    private let folderName = "downloaded_img"
    private init() {
        createFolderNeeded()
    }
    
    
    func add(key: String, value: UIImage) {
        guard
            let data = value.pngData(),
            let url = getImgPath(key: key)
        else { return }
        
        do {
            try data.write(to: url)
        } catch  {
            print("Error saving to file manager. \(error)")
        }
    }
    
    func get(key: String) -> UIImage? {
        guard
            let url = getImgPath(key: key),
            FileManager.default.fileExists(atPath: url.path) else { return nil }
        return UIImage(contentsOfFile: url.path)
    }
    
    private func createFolderNeeded() {
        guard let url = getFolderPath() else { return }
        if !FileManager.default.fileExists(atPath: url.path) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true)
                print("created Folder")
            } catch  {
                print("Error created folder. \(error)")
            }
        }
    }
    
    private func getImgPath(key: String) -> URL? {
        guard let folder = getFolderPath() else {
            return nil
        }
        return folder.appendingPathComponent(key + ".png")
    }
    
    private func getFolderPath() -> URL? {
        FileManager
            .default
            .urls(for: .cachesDirectory, in: .userDomainMask)
            .first?
            .appendingPathComponent(folderName)
    }
}
