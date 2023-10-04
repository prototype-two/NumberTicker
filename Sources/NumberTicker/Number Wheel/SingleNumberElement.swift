//
//  SingleNumberElement.swift
//  
//
//  Created by Niklas Fahl on 3/27/20.
//

import SwiftUI

internal struct SingleNumberElement: View {
    public var number: Int = 0
    public var font: Font
    public var textColor: Color
    @Binding public var frame: CGSize
    
    public var body: some View {
        Text("\(self.number)")
            .font(font)
            .foregroundColor(textColor)
            .frame(width: frame.width, height: frame.height)
    }
}
