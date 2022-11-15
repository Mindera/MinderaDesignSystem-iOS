import SwiftUI

struct Tertiary: ButtonStyle {
    // MARK: Private Properties

    private let size: MinderaButton.Size
    private let isDisabled: Bool

    // MARK: Lifecycle

    init(size: MinderaButton.Size, isDisabled: Bool) {
        self.size = size
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

extension Tertiary {
    private func backgroundColor(isPressed: Bool) -> Color {
        .clear
    }
}

// MARK: BorderColor

extension Tertiary {
    private func borderColor(isPressed: Bool) -> Color {
        .clear
    }
}

// MARK: ForegroundColor

extension Tertiary {
    private func foregroundColor(isPressed: Bool) -> Color? {
        switch size {
        case .big:
            return bigForegroundColor(isPressed: isPressed)
        case .small:
            return smallForegroundColor(isPressed: isPressed)
        }
    }

    private func bigForegroundColor(isPressed: Bool) -> Color? {
        if isPressed {
            return .indigo(._600)
        }
        if isDisabled {
            return .greyBlue(._400)
        }
        return .indigo(._600)
    }

    private func smallForegroundColor(isPressed: Bool) -> Color? {
        if isPressed {
            return .indigo(._600)
        }
        if isDisabled {
            return .greyBlue(._400)
        }
        return .greyBlue(._900)
    }
}

// MARK: Previews

struct Tertiary_Previews: PreviewProvider {
    struct Content: View {
        var size: MinderaButton.Size
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
            .buttonStyle(Tertiary(size: size, isDisabled: isDisabled))
        }
    }

    static var previews: some View {
        Content(size: .big, isDisabled: false)
            .previewDisplayName("Big - Enabled")

        Content(size: .small, isDisabled: false)
            .previewDisplayName("Small - Enabled")

        Content(size: .big, isDisabled: true)
            .previewDisplayName("Big - Disabled")

        Content(size: .small, isDisabled: true)
            .previewDisplayName("Small - Disabled")

        Content(size: .big, isDisabled: false)
            .previewDisplayName("Dark mode - Big - Enabled")
            .preferredColorScheme(.dark)

        Content(size: .small, isDisabled: false)
            .previewDisplayName("Dark mode - Small - Enabled")
            .preferredColorScheme(.dark)

        Content(size: .big, isDisabled: true)
            .previewDisplayName("Dark mode - Big - Disabled")
            .preferredColorScheme(.dark)

        Content(size: .small, isDisabled: true)
            .previewDisplayName("Dark mode - Small - Disabled")
            .preferredColorScheme(.dark)
    }
}
