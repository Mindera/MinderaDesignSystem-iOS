import SwiftUI

struct Destructive: ButtonStyle {
    // MARK: Private Properties

    @Environment(\.colorScheme) private var colorScheme
    private let isDisabled: Bool

    // MARK: Lifecycle

    init(isDisabled: Bool) {
        self.isDisabled = isDisabled
    }

    // MARK: Public Methods

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

extension Destructive {
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
            return .red(._900)
        }
        if isDisabled {
            return .red(._400)
        }
        return .red(._700)
    }

    private func darkBackgroundColor(isPressed: Bool) -> Color {
        if isPressed {
            return .red(._900)
        }
        if isDisabled {
            return .red(._900)
        }
        return .red(._700)
    }
}

// MARK: BorderColor

extension Destructive {
    private func borderColor(isPressed: Bool) -> Color {
        .clear
    }
}

// MARK: ForegroundColor

extension Destructive {
    private func foregroundColor(isPressed: Bool) -> Color? {
        switch colorScheme {
        case .light:
            return .white(._900)
        case .dark:
            return darkForegroundColor(isPressed: isPressed)
        @unknown default:
            return .white(._900)
        }
    }

    private func darkForegroundColor(isPressed: Bool) -> Color {
        if isPressed {
            return .white(._900)
        }
        if isDisabled {
            // TODO: fix on figma
            return .white(._900)
        }
        return .white(._900)
    }
}

// MARK: Previews

struct Destructive_Previews: PreviewProvider {
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
            .buttonStyle(Destructive(isDisabled: isDisabled))
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
