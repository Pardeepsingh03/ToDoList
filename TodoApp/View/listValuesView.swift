//
//  listValuesView.swift
//  TodoApp
//
//  Created by MBA-0019 on 09/08/23.
//

import SwiftUI

struct listValuesView: View {
    var title: ListModel
    var body: some View {
        
            HStack{
                Image(systemName: title.isCompleted ? "checkmark.circle" : "circle")
                    .foregroundColor(title.isCompleted ? .green : .red)
                    
                Text(title.title)
            }
            .padding(.vertical,10)
            
            
        
    }
}
struct listValuesView_Previews: PreviewProvider {
    static var item1 = ListModel(title: "First items", isCompleted: false)
    static var item2 = ListModel(title: "Second item", isCompleted: true)
    static var previews: some View {
        Group{
           listValuesView(title: item1)
            listValuesView(title: item2)
        }
        .previewLayout(.sizeThatFits)
       
    }
}
