//
//  NumberStyleAccessory.swift
//  
//
//  Created by Niklas Fahl on 3/27/20.
//

import SwiftUI

internal struct NumberStyleAccessory: View {
    public var symbol: String
    public var font: Font
    public var textColor: Color
    public var accessaryPaddingEnabled: Bool
    
    public var body: some View {
        Text(symbol)
            .font(font)
            .foregroundColor(textColor)
            .padding([.leading, .trailing], accessaryPaddingEnabled ? 1 : 0)
    }
}
