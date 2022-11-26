import SwiftUI

struct MinderaButtonStyle: ButtonStyle {
    // MARK: Private Properties

    @Environment(\.colorScheme) private var colorScheme
    private let pallet: ButtonPallet
    private let isDisabled: Bool

    // MARK: Lifecycle

    init(pallet: ButtonPallet, isDisabled: Bool) {
        self.pallet = pallet
        self.isDisabled = isDisabled
    }

    // MARK: Public Methods

    func makeBody(configuration: Configuration) -> some View {
        let isPressed = configuration.isPressed
        return configuration.label
            .background(color(for: \.backgroundColor, isPressed: isPressed))
            .foregroundColor(color(for: \.foregroundColor, isPressed: isPressed))
            .cornerRadius(4)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .strokeBorder(
                        color(for: \.borderColor, isPressed: isPressed),
                        style: StrokeStyle(lineWidth: 1)
                    )
            )
    }
}

// MARK: Color

extension MinderaButtonStyle {
    private func color(for property: KeyPath<ButtonPalletState, Color>, isPressed: Bool) -> Color {
        let colorSchemeKeyPath: KeyPath<ButtonPallet, ButtonPalletColorScheme>
        switch colorScheme {
        case .light:
            colorSchemeKeyPath = \.lightMode
        case .dark:
            colorSchemeKeyPath = \.darkMode
        @unknown default:
            colorSchemeKeyPath = \.lightMode
        }

        var stateKeyPath: KeyPath<ButtonPalletColorScheme, ButtonPalletState> = \.standard
        if isPressed {
            stateKeyPath = \.pressed
        }
        if isDisabled {
            stateKeyPath = \.disabled
        }

        return pallet[keyPath: colorSchemeKeyPath][keyPath: stateKeyPath][keyPath: property]
    }
}
