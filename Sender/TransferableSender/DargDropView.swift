//
//  DargDropView.swift
//  TransferableSender
//
//  Created by HEssam on 1/2/25.
//

import SwiftUI

struct DargDropView: View {
    
    @Environment(\.personManager) private var personManager
    
    var body: some View {
        ScrollView {
            if personManager.persons.isEmpty {
                Text("Add a new person from another tab until they appear here.")
                
            } else {
                LazyVStack(alignment: .center, spacing: 20) {
                    ForEach(personManager.persons) { person in
                        HStack {
                            VStack(alignment: .leading, spacing: 12) {
                                Text(person.firstName)
                                    .font(.headline)
                                Text(person.sureName)
                                    .font(.caption)
                            }
                            Spacer()
                            Circle()
                                .fill(Color(codableColor: person.colorData))
                                .frame(width: 30, height: 30)
                        }
                        .contentShape(Rectangle())
                        .draggable(person, preview: {
                            Label("\(person.firstName) on the air", systemImage: "person.circle")
                        })
                        .padding()
                        
                        Divider()
                    }
                }
            }
        }
    }
}

#Preview {
    DargDropView()
}
