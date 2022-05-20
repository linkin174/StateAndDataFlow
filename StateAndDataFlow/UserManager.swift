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
    
    var name: String { storageManager.username }
    
    private let storageManager: StorageProtocol
    
    init(storageManager: StorageProtocol) {
        self.storageManager = storageManager
        isRegistered = storageManager.isRegistered
    }

    func registerUser(name: String) {
        isRegistered.toggle()
        storageManager.saveUserState(with: name, isRegistered: isRegistered)
    }

    func unregisterUser() {
        isRegistered.toggle()
        storageManager.saveUserState(with: nil, isRegistered: isRegistered)
    }
}
