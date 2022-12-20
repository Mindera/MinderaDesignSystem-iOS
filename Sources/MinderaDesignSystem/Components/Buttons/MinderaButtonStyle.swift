import SwiftUI

struct MinderaButtonStyle: ButtonStyle {
    // MARK: Private Properties

    @Environment(\.colorScheme) private var colorScheme
    private let appearance: ButtonAppearance
    private let isDisabled: Bool

    // MARK: Lifecycle

    init(appearance: ButtonAppearance, isDisabled: Bool) {
        self.appearance = appearance
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
    private func color(for property: KeyPath<ButtonAppearanceState, Color>, isPressed: Bool) -> Color {
        let colorSchemeKeyPath: KeyPath<ButtonAppearance, ButtonAppearanceColorScheme>
        switch colorScheme {
        case .light:
            colorSchemeKeyPath = \.lightMode
        case .dark:
            colorSchemeKeyPath = \.darkMode
        @unknown default:
            colorSchemeKeyPath = \.lightMode
        }

        var stateKeyPath: KeyPath<ButtonAppearanceColorScheme, ButtonAppearanceState> = \.standard
        if isPressed {
            stateKeyPath = \.pressed
        }
        if isDisabled {
            stateKeyPath = \.disabled
        }

        return appearance[keyPath: colorSchemeKeyPath][keyPath: stateKeyPath][keyPath: property]
    }
}
