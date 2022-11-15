import SwiftUI

struct Primary: ButtonStyle {
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

extension Primary {
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
            return .indigo(._800)
        }
        if isDisabled {
            return .indigo(._400)
        }
        return .indigo(._600)
    }

    private func darkBackgroundColor(isPressed: Bool) -> Color {
        if isPressed {
            return .yellow(._700)
        }
        if isDisabled {
            return .yellow(._200)
        }
        return .yellow(._500)
    }
}

// MARK: BorderColor

extension Primary {
    private func borderColor(isPressed: Bool) -> Color {
        .clear
    }
}

// MARK: ForegroundColor

extension Primary {
    private func foregroundColor(isPressed: Bool) -> Color? {
        switch colorScheme {
        case .light:
            return .white(._900)
        case .dark:
            return .black(._900)
        @unknown default:
            return .white(._900)
        }
    }
}

// MARK: Previews

struct Primary_Previews: PreviewProvider {
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
            .buttonStyle(Primary(isDisabled: isDisabled))
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
