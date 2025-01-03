//
//  TransferableSenderApp.swift
//  TransferableSender
//
//  Created by HEssam on 1/2/25.
//

import SwiftUI

@main
struct TransferableSenderApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.personManager, PersonManager())
        }
    }
}
