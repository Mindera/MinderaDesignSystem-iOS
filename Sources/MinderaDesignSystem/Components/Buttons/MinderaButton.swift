import SwiftUI

public struct MinderaButton: View {
    // MARK: Inner Types

    public enum Size {
        case big
        case small
    }

    public enum ContentMode {
        case fit
        case fill
    }

    public enum Style {
        case primary
        case secondary
        case tertiary
        case destructive
        case danger
    }

    public enum Configuration {
        case title(String)
        case titleAndImage(String, Image)
        case imageAndTitle(Image, String)
        case image(Image)
    }

    // MARK: Private Properties

    private var size: Size = .big
    private var contentMode: ContentMode = .fit
    private var style: Style = .primary
    private var isDisabled = false

    private let configuration: Configuration
    private let action: () -> Void

    // MARK: Lifecycle

    public init(_ configuration: Configuration, action: @escaping () -> Void) {
        self.configuration = configuration
        self.action = action
    }

    // MARK: Public Methods

    public func size(_ size: Size) -> Self {
        var copy = self
        copy.size = size
        return copy
    }

    public func contentMode(_ contentMode: ContentMode) -> Self {
        var copy = self
        copy.contentMode = contentMode
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

    // MARK: Public Properties

    public var body: some View {
        Button(
            action: action,
            label: {
                HStack(spacing: 8) {
                    switch configuration {
                    case let .title(text):
                        title(text)
                    case let .titleAndImage(text, icon):
                        title(text)
                        image(icon)
                    case let .imageAndTitle(icon, text):
                        image(icon)
                        title(text)
                    case let .image(icon):
                        image(icon)
                    }
                }
                .frame(maxWidth: maxWidth)
                .padding(.vertical, verticalPadding)
                .padding(.horizontal, horizontalPadding)
            }
        )
        .disabled(isDisabled)
        .buttonStyle(MinderaButtonStyle(appearance: buttonAppearance, isDisabled: isDisabled))
    }

    // MARK: Private Properties

    private var buttonAppearance: ButtonAppearance {
        switch style {
        case .primary:
            return .primary
        case .secondary:
            return .secondary
        case .tertiary:
            return .tertiary
        case .destructive:
            return .destructive
        case .danger:
            return .danger
        }
    }

    @ViewBuilder
    private func title(_ text: String) -> some View {
        Text(text)
            .customFont(size: .S, weight: .semiBold)
    }

    @ViewBuilder
    private func image(_ image: Image) -> some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: imageSize, height: imageSize)
    }

    private var onlyIcon: Bool {
        switch configuration {
        case .title,
             .titleAndImage,
             .imageAndTitle:
            return false
        case .image:
            return true
        }
    }

    private var verticalPadding: CGFloat {
        switch size {
        case .big:
            return onlyIcon ? 9 : 10
        case .small:
            return onlyIcon ? 8 : 5
        }
    }

    private var horizontalPadding: CGFloat {
        switch size {
        case .big:
            return onlyIcon ? 9 : 16
        case .small:
            return onlyIcon ? 8 : 12
        }
    }

    private var imageSize: CGFloat {
        switch size {
        case .big:
            return onlyIcon ? 16 : 11
        case .small:
            return 11
        }
    }

    private var maxWidth: CGFloat? {
        switch contentMode {
        case .fit:
            return nil
        case .fill:
            return .infinity
        }
    }
}

// MARK: Previews

struct MinderaButton_Previews: PreviewProvider {
    static var previews: some View {
        MinderaButton(.title("Hello world"), action: {})
            .style(.primary)
            .previewDisplayName("Primary - Big")

        MinderaButton(.title("Hello world"), action: {})
            .size(.small)
            .style(.primary)
            .previewDisplayName("Primary - Small")

        MinderaButton(
            .titleAndImage(
                "Hello world",
                Image(systemName: "xmark")
            ),
            action: {}
        )
        .style(.primary)
        .previewDisplayName("Trailing icon")

        MinderaButton(
            .imageAndTitle(
                Image(systemName: "xmark"),
                "Hello world"
            ),
            action: {}
        )
        .style(.secondary)
        .previewDisplayName("Leading icon")

        MinderaButton(.image(Image(systemName: "xmark")), action: {})
            .style(.danger)
            .size(.small)
            .previewDisplayName("Only icon - Small")

        MinderaButton(
            .imageAndTitle(
                Image(systemName: "xmark"),
                "Hello world"
            ),
            action: {}
        )
        .contentMode(.fill)
        .previewDisplayName("ContentMode - Fill")
    }
}
