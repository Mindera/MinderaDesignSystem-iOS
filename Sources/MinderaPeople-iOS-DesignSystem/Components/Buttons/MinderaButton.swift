import SwiftUI

public struct MinderaButton: View {
    public enum Size {
        case big
        case small
    }

    public enum Style {
        case primary
        case secondary
        case tertiary
        case destructive
        case danger
    }

    @Environment(\.colorScheme) private var colorScheme
    private let size: Size
    private let style: Style
    private var isDisabled = false

    public init(_ size: Size = .big, style: Style = .primary) {
        self.size = size
        self.style = style
    }

    public func disabled(_ isDisabled: Bool) -> Self {
        var copy = self
        copy.isDisabled = isDisabled
        return copy
    }

    public var body: some View {
        switch style {
        case .primary:
            content.buttonStyle(Primary(isDisabled: isDisabled))
        case .secondary:
            content.buttonStyle(Secondary(isDisabled: isDisabled))
        case .tertiary:
            content.buttonStyle(Tertiary(size: size, isDisabled: isDisabled))
        case .destructive:
            content.buttonStyle(Destructive(isDisabled: isDisabled))
        case .danger:
            content.buttonStyle(Danger(isDisabled: isDisabled))
        }
    }

    private var content: some View {
        Button {
        } label: {
            HStack {
                Text("Hello world")
                    .customFont(size: .S, weight: .semiBold)
            }
            .padding(.vertical, verticalPadding)
            .padding(.horizontal, horizontalPadding)
        }
        .disabled(isDisabled)
    }

    private var verticalPadding: CGFloat {
        switch size {
        case .big:
            return 10
        case .small:
            return 5
        }
    }

    private var horizontalPadding: CGFloat {
        switch size {
        case .big:
            return 16
        case .small:
            return 12
        }
    }
}

struct MinderaButton_Previews: PreviewProvider {
    static var previews: some View {
        MinderaButton(style: .primary)
            .previewDisplayName("Primary - Big")

        MinderaButton(.small, style: .primary)
            .previewDisplayName("Primary - Small")

        MinderaButton(style: .secondary)
            .previewDisplayName("Secondary - Big")

        MinderaButton(.small, style: .secondary)
            .previewDisplayName("Secondary - Small")

        MinderaButton(style: .tertiary)
            .previewDisplayName("Tertiary - Big")

        MinderaButton(.small, style: .tertiary)
            .previewDisplayName("Tertiary - Small")
        
        MinderaButton(style: .destructive)
            .previewDisplayName("Destructive - Big")

        MinderaButton(.small, style: .destructive)
            .previewDisplayName("Destructive - Small")
        
        MinderaButton(style: .danger)
            .previewDisplayName("Danger - Big")

        MinderaButton(.small, style: .danger)
            .previewDisplayName("Danger - Small")
    }
}
