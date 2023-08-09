//
//  ListModel.swift
//  TodoApp
//
//  Created by MBA-0019 on 09/08/23.
//

import Foundation

struct ListModel : Identifiable,Codable{
    var id = UUID().uuidString
    var title: String
    var isCompleted: Bool
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateItems() -> ListModel{
        return ListModel(id: id ,title: title, isCompleted: !isCompleted)
    }
}
