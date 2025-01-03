//
//  TransferableReceiverApp.swift
//  TransferableReceiver
//
//  Created by HEssam on 1/2/25.
//

import SwiftUI

@main
struct TransferableReceiverApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.personManager, PersonManager())
        }
    }
}
