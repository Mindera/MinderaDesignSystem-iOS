import SwiftUI

struct Secondary: ButtonStyle {
    @Environment(\.colorScheme) private var colorScheme
    private let isDisabled: Bool

    init(isDisabled: Bool) {
        self.isDisabled = isDisabled
    }

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(backgroundColor(isPressed: configuration.isPressed))
            .foregroundColor(foregroundColor(isPressed: configuration.isPressed))
            .cornerRadius(4)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(
                        borderColor(isPressed: configuration.isPressed),
                        style: StrokeStyle(lineWidth: 1)
                    )
            )
    }
}

// MARK: BackgroundColor

extension Secondary {
    private func backgroundColor(isPressed: Bool) -> Color {
        switch colorScheme {
        case .light:
            return lightBackgroundColor(isPressed: isPressed)
        case .dark:
            return darkBackgroundColor(isPressed: isPressed)
        @unknown default:
            return lightBackgroundColor(isPressed: isPressed)
        }
    }

    private func lightBackgroundColor(isPressed: Bool) -> Color {
        if isPressed {
            return .indigo(._000)
        }
        if isDisabled {
            return .white(._600)
        }
        return .white(._900)
    }

    private func darkBackgroundColor(isPressed: Bool) -> Color {
        if isPressed {
            return .white(._300)
        }
        if isDisabled {
            return .white(._200)
        }
        return .clear
    }
}

// MARK: BorderColor

extension Secondary {
    private func borderColor(isPressed: Bool) -> Color {
        switch colorScheme {
        case .light:
            return lightBorderColor(isPressed: isPressed)
        case .dark:
            return darkBorderColor(isPressed: isPressed)
        @unknown default:
            return lightBorderColor(isPressed: isPressed)
        }
    }

    private func lightBorderColor(isPressed: Bool) -> Color {
        if isPressed {
            return .clear
        }
        if isDisabled {
            return .clear
        }
        return .greyBlue(._000)
    }

    private func darkBorderColor(isPressed: Bool) -> Color {
        if isPressed {
            return .white(._900)
        }
        if isDisabled {
            return .clear
        }
        return .white(._900)
    }
}

// MARK: ForegroundColor

extension Secondary {
    private func foregroundColor(isPressed: Bool) -> Color? {
        switch colorScheme {
        case .light:
            return .indigo(._600)
        case .dark:
            return darkForegroundColor(isPressed: isPressed)
        @unknown default:
            return .indigo(._600)
        }
    }

    private func darkForegroundColor(isPressed: Bool) -> Color {
        if isPressed {
            return .white(._900)
        }
        if isDisabled {
            return .white(._700)
        }
        return .white(._900)
    }
}

// MARK: Previews

struct Secondary_Previews: PreviewProvider {
    struct Content: View {
        var isDisabled: Bool

        var body: some View {
            Button(
                action: { },
                label: {
                    HStack {
                        Text("Hello world")
                            .customFont(size: .S, weight: .semiBold)
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal, 16)
                }
            )
            .buttonStyle(Secondary(isDisabled: isDisabled))
        }
    }

    static var previews: some View {
        Content(isDisabled: false)
            .previewDisplayName("Enabled")

        Content(isDisabled: true)
            .previewDisplayName("Disabled")

        Content(isDisabled: false)
            .previewDisplayName("Dark mode - Enabled")
            .preferredColorScheme(.dark)

        Content(isDisabled: true)
            .previewDisplayName("Dark mode - Disabled")
            .preferredColorScheme(.dark)
    }
}
