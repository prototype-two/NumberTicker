//
//  NumberComponent.swift
//  
//
//  Created by Niklas Fahl on 3/30/20.
//

import SwiftUI

internal struct NumberComponent: View {
    public var numberComponent: NumberComponentsManager.NumberComponent
    public var animation: Animation? = .default
    public var font: Font
    public var textColor: Color
    public var accessaryPaddingEnabled: Bool
    
    private var digit: Int?
    private var nonDigit: String?
    
    @Binding public var digitFrame: CGSize
    
    public init(numberComponent: NumberComponentsManager.NumberComponent, animation: Animation? = .default,
                font: Font, textColor: Color = Color.black, accessaryPaddingEnabled: Bool = true, digitFrame: Binding<CGSize>) {
        self.numberComponent = numberComponent
        self.animation = animation
        self.font = font
        self.textColor = textColor
        self.accessaryPaddingEnabled = accessaryPaddingEnabled
        self._digitFrame = digitFrame
        
        digit = getDigit(from: numberComponent)
        nonDigit = getNonDigit(from: numberComponent)
    }
    
    public var body: some View {
        Group {
            if digit != nil {
                NumberWheel(visibleNumber: digit!, animation: self.animation, font: self.font, textColor: self.textColor, frame: self.$digitFrame)
            } else if nonDigit != nil {
                NumberStyleAccessory(symbol: nonDigit!, font: self.font, textColor: self.textColor,
                                     accessaryPaddingEnabled: self.accessaryPaddingEnabled)
                    .animation(.none)
            }
        }
    }
}

extension NumberComponent {
    // NOTE: These functions are used as a workaround because control flows like switch or if let are not available in view builder yet
    
    private func getDigit(from numberComponent: NumberComponentsManager.NumberComponent) -> Int? {
        if case NumberComponentsManager.NumberComponent.digit(let digit) = numberComponent {
            return digit
        }
        return nil
    }
    
    private func getNonDigit(from numberComponent: NumberComponentsManager.NumberComponent) -> String? {
        if case NumberComponentsManager.NumberComponent.nonDigit(let separator) = numberComponent {
            return separator
        }
        return nil
    }
}
