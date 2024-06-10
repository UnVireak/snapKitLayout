//
//  DataManager.swift
//  snapKitLayout
//
//  Created by unvireak on 10/6/24.
//
import Foundation
class DataManager {
    static let shared = DataManager()
    var folders: [Folder] = []

    func saveFolder(_ folder: Folder) {
        if let index = folders.firstIndex(where: { $0.id == folder.id }) {
            folders[index] = folder
        } else {
            folders.append(folder)
        }
    }

    func removeFolder(at index: Int) {
        folders.remove(at: index)
    }
}

