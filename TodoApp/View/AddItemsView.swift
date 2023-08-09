//
//  AddItemsView.swift
//  TodoApp
//
//  Created by MBA-0019 on 09/08/23.
//

import SwiftUI

struct AddItemsView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State private var textField: String = ""
    @State private var alertString: String = ""
    @State private var showAlert: Bool = false
    var body: some View {
        ScrollView{
            VStack {
                TextField("Type something...", text: $textField)
                    .navigationTitle("To add items")
                    .padding()
                    .frame(height: 50)
                    .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                Button {
                    addNewItem()
                } label: {
                    Text("Save")
                        .foregroundColor(.white)
                        .bold()
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .cornerRadius(10)
                }

            }
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Please enter a valid title for making a todo"))
            }
        }
    }
    
    func addNewItem(){
        if validation(){
            listViewModel.addItem(title: textField)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func validation() -> Bool{
        if textField.count < 3 {
            showAlert.toggle()
            return false
        }
        return true
    }
    
}

struct AddItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddItemsView()
        }
        .environmentObject(ListViewModel())
    }
        
}
