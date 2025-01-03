//
//  Person.swift
//  TransferableSender
//
//  Created by HEssam on 1/2/25.
//

import SwiftUI
import CoreTransferable
import UniformTypeIdentifiers

extension UTType {
    static var person: UTType { UTType(exportedAs: "io.github.helloItsHEssam.transferablesender.person") }
}

struct Person: Identifiable, Codable, Sendable {
    var firstName: String
    var sureName: String
    var colorData: CodableColor
    var id: UUID = UUID()
    
    var color: Color {
        get {
            Color(codableColor: colorData)
        }
        set {
            colorData = CodableColor(color: newValue)
        }
    }
    
    init(
        firstName: String,
        sureName: String,
        colorData: CodableColor,
        id: UUID
    ) {
        self.firstName = firstName
        self.sureName = sureName
        self.colorData = colorData
        self.id = id
    }
}

extension Person: Transferable {
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(for: Person.self, contentType: .person)
        ProxyRepresentation(exporting: \.firstName)
    }
}

struct CodableColor: Codable {
    let red: Double
    let green: Double
    let blue: Double
    let alpha: Double

    init(color: Color) {
        let components = color.cgColor?.components ?? [0, 0, 0, 1]
        red = Double(components[0])
        green = Double(components[1])
        blue = Double(components[2])
        alpha = components.count > 3 ? Double(components[3]) : 1.0
    }
}

extension Color {
    init(codableColor: CodableColor) {
        self.init(
            red: codableColor.red,
            green: codableColor.green,
            blue: codableColor.blue,
            opacity: codableColor.alpha
        )
    }
}
