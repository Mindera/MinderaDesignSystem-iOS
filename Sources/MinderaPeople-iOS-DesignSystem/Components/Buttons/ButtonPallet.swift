import SwiftUI

struct ButtonPallet {
    let lightMode: ButtonPalletColorScheme
    let darkMode: ButtonPalletColorScheme
}

struct ButtonPalletColorScheme {
    let standard: ButtonPalletState
    let pressed: ButtonPalletState
    let disabled: ButtonPalletState
}

struct ButtonPalletState {
    let backgroundColor: Color
    let foregroundColor: Color
    let borderColor: Color
}
