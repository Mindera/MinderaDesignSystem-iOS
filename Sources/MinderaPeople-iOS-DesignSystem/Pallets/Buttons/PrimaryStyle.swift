import SwiftUI

extension ButtonPallet {
    static let primary = ButtonPallet(
        lightMode: .init(
            standard: .init(
                backgroundColor: .indigo(._600),
                foregroundColor: .white(._900),
                borderColor: .clear
            ),
            pressed: .init(
                backgroundColor: .indigo(._800),
                foregroundColor: .white(._900),
                borderColor: .clear
            ),
            disabled: .init(
                backgroundColor: .indigo(._400),
                foregroundColor: .white(._900),
                borderColor: .clear
            )

        ),
        darkMode: .init(
            standard: .init(
                backgroundColor: .yellow(._500),
                foregroundColor: .black(._900),
                borderColor: .clear
            ),
            pressed: .init(
                backgroundColor: .yellow(._700),
                foregroundColor: .black(._900),
                borderColor: .clear
            ),
            disabled: .init(
                backgroundColor: .yellow(._200),
                foregroundColor: .black(._900),
                borderColor: .clear
            )
        )
    )
}

struct Primary_Previews: PreviewProvider {
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
            .buttonStyle(MinderaButtonStyle(pallet: .primary, isDisabled: isDisabled))
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
