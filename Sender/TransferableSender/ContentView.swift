//
//  ContentView.swift
//  TransferableSender
//
//  Created by HEssam on 1/2/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            PastboardView()
                .tabItem {
                    Label("Pastboard", systemImage: "document.on.clipboard")
                }
            
            DargDropView()
                .tabItem {
                    Label("DragDrop", systemImage: "list.dash")
                }
        }
    }
}

#Preview {
    ContentView()
}
