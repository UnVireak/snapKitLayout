//
//  TableModel.swift
//  snapKitLayout
//
//  Created by unvireak on 10/6/24.
//

import Foundation

class Folder {
    var id: UUID
    var title: String
    var items: [Item] = []

    init(id: UUID = UUID(), title: String, items: [Item] = []) {
        self.id = id
        self.title = title
        self.items = items
    }
}

struct Item {
    var id: UUID
    var title: String
    var detail: String

    init(id: UUID = UUID(), title: String, detail: String) {
        self.id = id
        self.title = title
        self.detail = detail
    }
}
