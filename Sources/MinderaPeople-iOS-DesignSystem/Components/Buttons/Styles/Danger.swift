import SwiftUI

struct Danger: ButtonStyle {
    // MARK: Private Properties

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

extension Danger {
    private func backgroundColor(isPressed: Bool) -> Color {
        if isPressed {
            return .red(._000)
        }
        if isDisabled {
            return .clear
        }
        return .white(._900)
    }
}

// MARK: BorderColor

extension Danger {
    private func borderColor(isPressed: Bool) -> Color {
        if isPressed {
            return .clear
        }
        if isDisabled {
            return .clear
        }
        return .black(._000)
    }
}

// MARK: ForegroundColor

extension Danger {
    private func foregroundColor(isPressed: Bool) -> Color? {
        if isPressed {
            return .red(._900)
        }
        if isDisabled {
            return .red(._400)
        }
        return .red(._700)
    }
}

// MARK: Previews

struct Danger_Previews: PreviewProvider {
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
            .buttonStyle(Danger(isDisabled: isDisabled))
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
