//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by Aleksandr Kretov on 19.05.2022.
//

import Foundation
import SwiftUI

final class StorageManager {
    @AppStorage("username") var username: String = ""
    @AppStorage("isRegistered") var isRegistered: Bool = false
}
