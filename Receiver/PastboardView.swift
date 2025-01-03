//
//  PastboardView.swift
//  TransferableReceiver
//
//  Created by HEssam on 1/2/25.
//

import SwiftUI
import UniformTypeIdentifiers

struct PastboardView: View {
    
    @Environment(\.personManager) private var personManager
    
    @State private var person = Person(
        firstName: "",
        sureName: "",
        colorData: CodableColor(color: .red),
        id: UUID()
    )
    
    var body: some View {
        VStack(spacing: 20) {
            // TextField for First Name
            TextField("First Name", text: $person.firstName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .disabled(true)
            
            // TextField for Surname
            TextField("Surname", text: $person.sureName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .disabled(true)
                .padding(.horizontal)
            
            // Color Picker
            VStack {
                Text("Choose a Color:")
                ColorPicker("Select Color", selection: Binding(
                    get: {
                        Color(codableColor: person.colorData)
                    },
                    set: { newColor in
                        person.colorData = CodableColor(color: newColor)
                    }
                ))
                .disabled(true)
                .padding(.horizontal)
            }
            
            // Preview of Selected Color
            HStack {
                Text("Selected Color:")
                Circle()
                    .fill(Color(codableColor: person.colorData))
                    .frame(width: 30, height: 30)
            }
            
            Divider()
            
            PasteButton(payloadType: Person.self) { items in
                guard let first = items.first else { return }
                person.firstName = first.firstName
                person.sureName = first.sureName
                person.colorData = first.colorData
                person.id = first.id
                
                personManager.addNewPerson(first)                
            }
            .padding(.top, 20)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    PastboardView()
}
