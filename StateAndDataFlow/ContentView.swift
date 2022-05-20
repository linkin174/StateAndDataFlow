//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 18.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var userManager: UserManager
    @StateObject private var timer = TimeCounter()

    var body: some View {
       
        VStack {
            Text("Hi, \(userManager.name)")
                .font(.largeTitle)
                .padding(.top, 100)
            
            Text("\(timer.counter)")
                .font(.largeTitle)
                .padding(.top, 200)
            
            Spacer()
            
            ButtonView(timer: timer)
            
            Spacer()
            
            Button(action: userManager.unregisterUser) {
                Text("Log Out")
                    .font(.title).bold()
                    .foregroundColor(.white)
            }
            .frame(width: 200, height: 60)
            .background(.blue)
            .cornerRadius(20)
            .overlay {
                RoundedRectangle(cornerRadius: 20).stroke(.black, lineWidth: 4)
            }
        }.padding(.bottom, 64)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager(storageManager: StorageManager()))
    }
}

struct ButtonView: View {
    @ObservedObject var timer: TimeCounter
    
    var body: some View {
        Button(action: timer.startTimer) {
            Text(timer.buttonTitle)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(.red)
        .cornerRadius(20)
        .overlay {
            RoundedRectangle(cornerRadius: 20).stroke(.black, lineWidth: 4)
        }
    }
}
