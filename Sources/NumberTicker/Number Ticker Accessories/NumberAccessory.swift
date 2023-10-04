//
//  NumberAccessory.swift
//  
//
//  Created by Niklas Fahl on 3/27/20.
//

import SwiftUI

internal struct NumberAccessory: View {
    public enum Style {
        case prefix
        case suffix
    }
    
    public var text: String
    public var style: Style
    public var font: Font
    public var textColor: Color
    public var accessaryPaddingEnabled: Bool
    
    private var paddingEdge: Edge.Set {
        switch style {
        case .prefix:
            return .trailing
        case .suffix:
            return .leading
        }
    }
    
    public var body: some View {
        Text(text)
            .font(font)
            .foregroundColor(textColor)
            .padding(paddingEdge, accessaryPaddingEnabled ? 2 : 0)
    }
}
