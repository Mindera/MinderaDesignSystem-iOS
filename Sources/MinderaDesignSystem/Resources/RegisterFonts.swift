
import CoreGraphics
import CoreText
import SwiftUI
import UIKit

// MARK: Internal Methods

func registerFonts() {
    if hasRegisteredFonts { return }
    fonts.forEach { name in
        registerFont(named: name)
    }
    hasRegisteredFonts = true
}

// MARK: Private Properties

private var hasRegisteredFonts = false

private let fonts = [
    "Inter",
    "Inter-SemiBold",
    "Inter-Bold"
]

// MARK: Private Types

private enum FontError: Error {
    case failedToRegisterFont
}

// MARK: Private Methods

private func registerFont(named name: String) {
    guard
        let asset = NSDataAsset(name: "Fonts/\(name)", bundle: Bundle.module),
        let provider = CGDataProvider(data: asset.data as NSData),
        let font = CGFont(provider),
        CTFontManagerRegisterGraphicsFont(font, nil)
    else {
        assertionFailure("")
        return
    }
}
