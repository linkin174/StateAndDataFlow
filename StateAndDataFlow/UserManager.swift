//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 18.05.2022.
//

import Foundation
import SwiftUI

final class UserManager: ObservableObject {
    
    @Published var isRegistered = false
    var name = ""
    
    private var storageManager: StorageManager
    
    init(storageManager: StorageManager) {
        self.storageManager = storageManager
        name = storageManager.username
        isRegistered = storageManager.isRegistered
    }
    
    func logIn() {
        isRegistered.toggle()
        storageManager.isRegistered = isRegistered
        storageManager.username = name
    }
    
    func logOut() {
        isRegistered.toggle()
        storageManager.username = ""
        storageManager.isRegistered = isRegistered
    }
    
}
