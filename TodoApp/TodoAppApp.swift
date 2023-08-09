//
//  TodoAppApp.swift
//  TodoApp
//
//  Created by MBA-0019 on 09/08/23.
//

import SwiftUI

@main
struct TodoAppApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
