//
//  ListView.swift
//  TodoApp
//
//  Created by MBA-0019 on 09/08/23.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel
   
  
    var body: some View {
        ZStack{
            if listViewModel.item.isEmpty{
               NoItemsView()
            } else{
                List{
                    ForEach(listViewModel.item) { item in
                        listValuesView(title: item)
                            .font(.system(size: 17))
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateValue(items: item)
                                }
                            }
                    }
                    .onDelete { index in
                        listViewModel.item.remove(atOffsets: index)
                    }
                    .onMove { Index, of in
                        listViewModel.item.move(fromOffsets: Index, toOffset: of)
                    }
                }
                .listStyle(PlainListStyle())
            }
        }
       
        .navigationTitle("To do List")
        .navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add", destination: {
           AddItemsView()
        }))
        
       
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}

