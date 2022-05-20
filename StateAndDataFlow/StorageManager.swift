//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by Aleksandr Kretov on 19.05.2022.
//

import Foundation
import SwiftUI

protocol StorageProtocol {
    var username: String { get }
    var isRegistered: Bool { get }
    func saveUserState(with name: String?, isRegistered: Bool)
}

final class StorageManager: StorageProtocol {
    
    @AppStorage("username") var username: String = ""
    @AppStorage("isRegistered") var isRegistered: Bool = false

    func saveUserState(with name: String?, isRegistered: Bool) {
        username = name ?? ""
        self.isRegistered = isRegistered
    }
}
