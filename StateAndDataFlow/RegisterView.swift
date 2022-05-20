//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 18.05.2022.
//

import SwiftUI

struct RegisterView: View {
    
    @EnvironmentObject private var userManger: UserManager
    
    @State private var name = ""
    @State private var count = 0
    
    var body: some View {
        VStack (spacing: 32){
            HStack {
                TextField("Enter your name...", text: $name)
                    .multilineTextAlignment(.center)
                    .textFieldStyle(.roundedBorder)
                    .onChange(of: name) { newValue in
                        count = newValue.count
                    }
                
            }
            .padding()
            Text("Name contains \(count) characters")
                .lineLimit(2)
                .foregroundColor(count >= 3 ? .green : .red)
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }.disabled(count < 3 ? true : false)
        }
    }
    
    private func registerUser() {
        if !name.isEmpty {
            userManger.registerUser(name: name)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .environmentObject(UserManager(storageManager: StorageManager()))
    }
}
