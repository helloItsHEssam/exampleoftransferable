//
//  PastboardView.swift
//  TransferableSender
//
//  Created by HEssam on 1/2/25.
//

import SwiftUI
import UniformTypeIdentifiers

struct PastboardView: View {
    enum Field {
            case firstName
            case surName
        }
    
    @FocusState private var focusedField: Field?
    @State private var person = Person(
        firstName: "",
        sureName: "",
        colorData: CodableColor(color: .red),
        id: UUID()
    )
    
    @Environment(\.personManager) private var personManager
    
    var body: some View {
        VStack(spacing: 20) {
            // TextField for First Name
            TextField("First Name", text: $person.firstName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .focused($focusedField, equals: .firstName)
                .padding(.horizontal)
            
            // TextField for Surname
            TextField("Surname", text: $person.sureName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .focused($focusedField, equals: .surName)
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
            
            Button {
                let encoder = JSONEncoder()
                if let encoded = try? encoder.encode(person) {
                    UIPasteboard.general.setData(encoded, forPasteboardType: UTType.person.identifier)
                    
                    personManager.addNewPerson(person)
                    
                    // reset
                    person.firstName = ""
                    person.sureName = ""
                    person.color = .red
                    person.id = UUID()
                    
                } else {
                    print("cannot encode person data")
                }
                focusedField = nil
                
            } label: {
                Text("Save in Clipboard")
                    .foregroundStyle(.blue)
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
