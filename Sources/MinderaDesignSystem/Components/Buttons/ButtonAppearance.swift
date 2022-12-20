import SwiftUI

struct ButtonAppearance {
    let lightMode: ButtonAppearanceColorScheme
    let darkMode: ButtonAppearanceColorScheme

    struct ButtonAppearanceColorScheme {
        let standard: ButtonAppearanceState
        let pressed: ButtonAppearanceState
        let disabled: ButtonAppearanceState

        struct ButtonAppearanceState {
            let backgroundColor: Color
            let foregroundColor: Color
            let borderColor: Color
        }
    }
}
