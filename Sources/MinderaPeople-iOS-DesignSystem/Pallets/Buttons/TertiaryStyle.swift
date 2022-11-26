import SwiftUI

extension ButtonPallet {
    static let tertiary = ButtonPallet(
        lightMode: .init(
            standard: .init(
                backgroundColor: .clear,
                foregroundColor: .greyBlue(._900),
                borderColor: .clear
            ),
            pressed: .init(
                backgroundColor: .clear,
                foregroundColor: .indigo(._600),
                borderColor: .clear
            ),
            disabled: .init(
                backgroundColor: .clear,
                foregroundColor: .greyBlue(._400),
                borderColor: .clear
            )
            
        ),
        darkMode: .init(
            standard: .init(
                backgroundColor: .clear,
                foregroundColor: .greyBlue(._900),
                borderColor: .clear
            ),
            pressed: .init(
                backgroundColor: .clear,
                foregroundColor: .indigo(._600),
                borderColor: .clear
            ),
            disabled: .init(
                backgroundColor: .clear,
                foregroundColor: .greyBlue(._400),
                borderColor: .clear
            )
        )
    )
}

struct Tertiary_Previews: PreviewProvider {
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
            .buttonStyle(MinderaButtonStyle(pallet: .tertiary, isDisabled: isDisabled))
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
