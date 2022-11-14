import SwiftUI

struct MinderaButton: View {
    enum Size {
        case big
        case small
    }

    enum Style {
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

    init(_ size: Size = .big, style: Style = .primary) {
        self.size = size
        self.style = style
    }

    func disabled(_ isDisabled: Bool) -> Self {
        var copy = self
        copy.isDisabled = isDisabled
        return copy
    }

    var body: some View {
        switch style {
        case .primary:
            content.buttonStyle(Primary(isDisabled: isDisabled))
        case .secondary:
            // TODO
            content.buttonStyle(Primary(isDisabled: isDisabled))
        case .tertiary:
            // TODO
            content.buttonStyle(Primary(isDisabled: isDisabled))
        case .destructive:
            // TODO
            content.buttonStyle(Primary(isDisabled: isDisabled))
        case .danger:
            // TODO
            content.buttonStyle(Primary(isDisabled: isDisabled))
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
    }
}
