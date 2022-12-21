import SwiftUI

struct ButtonAppearance {
    let lightMode: ColorScheme
    let darkMode: ColorScheme

    struct ColorScheme {
        let standard: State
        let pressed: State
        let disabled: State

        struct State {
            let backgroundColor: Color
            let foregroundColor: Color
            let borderColor: Color
        }
    }
}
