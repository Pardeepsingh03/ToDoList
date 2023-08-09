//
//  NoItemsView.swift
//  TodoApp
//
//  Created by MBA-0019 on 09/08/23.
//

import SwiftUI

struct NoItemsView: View {
    var body: some View {
        ScrollView{
           
            VStack{
                Text("There are no items")
                    .font(.system(size: 30))
                    .bold()
                    .padding()
                Text("Are you a productive person and do your things on time ? Lets make it happen together !")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                NavigationLink {
                    AddItemsView()
                } label: {
                    Text("Lets make a list")
                        .padding()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .cornerRadius(10)
                }
                .padding()

            }
            .padding(20)
            .padding(.top,100)
        }
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            NoItemsView()
        }
      
    }
}
