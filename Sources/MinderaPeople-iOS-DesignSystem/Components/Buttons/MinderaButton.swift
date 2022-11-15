import SwiftUI

public struct MinderaButton: View {
    // MARK: Inner Types

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

    public enum ImagePosition {
        case leading
        case trailing
    }

    private struct ImageConfiguration {
        let position: ImagePosition
        let image: Image
    }

    // MARK: Private Properties

    @Environment(\.colorScheme) private var colorScheme
    private var size: Size = .big
    private var style: Style = .primary
    private var isDisabled = false
    private var imageConfiguration: ImageConfiguration?

    private let title: String?
    private let action: () -> Void

    // MARK: Lifecycle

    public init(_ title: String?, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }

    // MARK: Public Methods

    public func size(_ size: Size) -> Self {
        var copy = self
        copy.size = size
        return copy
    }

    public func style(_ style: Style) -> Self {
        var copy = self
        copy.style = style
        return copy
    }

    public func disabled(_ isDisabled: Bool) -> Self {
        var copy = self
        copy.isDisabled = isDisabled
        return copy
    }

    public func image(_ position: ImagePosition, image: Image) -> Self {
        var copy = self
        copy.imageConfiguration = .init(position: position, image: image)
        return copy
    }

    // MARK: Public Properties

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

    // MARK: Private Properties

    private var content: some View {
        Button(
            action: action,
            label: {
                HStack(spacing: 8) {
                    if
                        let configuration = imageConfiguration,
                        configuration.position == .leading {
                        configuration.image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: imageSize, height: imageSize)
                    }
                    if let title = title {
                        Text(title)
                            .customFont(size: .S, weight: .semiBold)
                    }
                    if
                        let configuration = imageConfiguration,
                        configuration.position == .trailing {
                        configuration.image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: imageSize, height: imageSize)
                    }
                }
                .padding(.vertical, verticalPadding)
                .padding(.horizontal, horizontalPadding)
            }
        )
        .disabled(isDisabled)
    }

    private var verticalPadding: CGFloat {
        let onlyIcon = title == nil
        switch size {
        case .big:
            return onlyIcon ? 9 : 10
        case .small:
            return onlyIcon ? 8 : 5
        }
    }

    private var horizontalPadding: CGFloat {
        let onlyIcon = title == nil
        switch size {
        case .big:
            return onlyIcon ? 9 : 16
        case .small:
            return onlyIcon ? 8 : 12
        }
    }

    private var imageSize: CGFloat {
        let onlyIcon = title == nil
        switch size {
        case .big:
            return onlyIcon ? 16 : 11
        case .small:
            return 11
        }
    }
}

// MARK: Previews

struct MinderaButton_Previews: PreviewProvider {
    static var previews: some View {
        MinderaButton("Hello world", action: {})
            .style(.primary)
            .previewDisplayName("Primary - Big")

        MinderaButton("Hello world", action: {})
            .size(.small)
            .style(.primary)
            .previewDisplayName("Primary - Small")

        MinderaButton(nil, action: {})
            .style(.primary)
            .previewDisplayName("No title")

        MinderaButton("Hello world", action: {})
            .style(.primary)
            .image(.trailing, image: Image(systemName: "xmark"))
            .previewDisplayName("Trailing icon")

        MinderaButton("Hello world", action: {})
            .style(.secondary)
            .image(.leading, image: Image(systemName: "xmark"))
            .previewDisplayName("Leading icon")

        MinderaButton(nil, action: {})
            .style(.danger)
            .image(.leading, image: Image(systemName: "xmark"))
            .image(.trailing, image: Image(systemName: "trash"))
            .previewDisplayName("Only icon - Big")

        MinderaButton(nil, action: {})
            .style(.danger)
            .size(.small)
            .image(.trailing, image: Image(systemName: "xmark"))
            .previewDisplayName("Only icon - Small")
    }
}
