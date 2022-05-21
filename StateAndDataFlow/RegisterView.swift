//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 18.05.2022.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject private var userManager: UserManager
    @State private var name = ""
    @State private var count = 0

    private func registerUser() {
        userManager.registerUser(name: name)
    }

    var body: some View {
        VStack(spacing: 32) {
            TextField("Enter your name...", text: $name)
                .multilineTextAlignment(.center)
                .textFieldStyle(.roundedBorder)
                .onChange(of: name) { newValue in
                    count = newValue.count
                }.padding()
            Text("Name contains \(count) characters")
                .foregroundColor(count >= 3 ? .green : .red)
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }.disabled(count < 3 ? true : false)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .environmentObject(UserManager(storageManager: StorageManager()))
    }
}
