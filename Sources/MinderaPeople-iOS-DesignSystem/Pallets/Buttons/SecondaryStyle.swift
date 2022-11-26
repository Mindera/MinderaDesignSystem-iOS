import SwiftUI
extension ButtonPallet {
    static let secondary = ButtonPallet(
        lightMode: .init(
            standard: .init(
                backgroundColor: .white(._900),
                foregroundColor: .indigo(._600),
                borderColor: .greyBlue(._000)
            ),
            pressed: .init(
                backgroundColor: .indigo(._000),
                foregroundColor: .indigo(._600),
                borderColor: .clear
            ),
            disabled: .init(
                backgroundColor: .white(._600),
                foregroundColor: .indigo(._600),
                borderColor: .clear
            )

        ),
        darkMode: .init(
            standard: .init(
                backgroundColor: .clear,
                foregroundColor: .white(._900),
                borderColor: .white(._900)
            ),
            pressed: .init(
                backgroundColor: .white(._300),
                foregroundColor: .white(._900),
                borderColor: .white(._900)
            ),
            disabled: .init(
                backgroundColor: .white(._200),
                foregroundColor: .white(._700),
                borderColor: .clear
            )
        )
    )
}

struct Secondary_Previews: PreviewProvider {
    struct Content: View {
        var isDisabled: Bool

        var body: some View {
            Button(
                action: { },
                label: {
                    Text("Hello world")
                        .padding(16)
                }
            )
            .buttonStyle(MinderaButtonStyle(pallet: .secondary, isDisabled: isDisabled))
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
