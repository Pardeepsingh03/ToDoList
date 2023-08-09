//
//  ListViewModel.swift
//  TodoApp
//
//  Created by MBA-0019 on 09/08/23.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var item: [ListModel] = [] {
        didSet{
            saveItems()
        }
    }
    init() {
        getallItems()
    }
    
    func getallItems(){
//        let items = [ListModel(title: "This is first item", isCompleted: false),ListModel(title: "This is second", isCompleted: true),ListModel(title: "This is third", isCompleted: false)]
//        item.append(contentsOf: items)
        guard let data = UserDefaults.standard.data(forKey: "list_items") else {return}
        guard let items = try? JSONDecoder().decode([ListModel].self, from: data) else {return}
        self.item = items
    }
    
    func addItem(title: String){
        let newItem = ListModel(title: title, isCompleted: false)
        item.append(newItem)
    }
    func updateValue(items: ListModel){
        if let index = item.firstIndex(where: {$0.id == items.id}){
            item[index] = items.updateItems()
        }
    }
    func saveItems(){
        if let data = try? JSONEncoder().encode(item) {
            UserDefaults.standard.set(data, forKey: "list_items")
        }
    }
}
