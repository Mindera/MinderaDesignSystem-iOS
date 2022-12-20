import SwiftUI

extension ButtonAppearance {
    static let destructive = ButtonAppearance(
        lightMode: .init(
            standard: .init(
                backgroundColor: .red(._700),
                foregroundColor: .white(._900),
                borderColor: .clear
            ),
            pressed: .init(
                backgroundColor: .red(._900),
                foregroundColor: .white(._900),
                borderColor: .clear
            ),
            disabled: .init(
                backgroundColor: .red(._400),
                foregroundColor: .white(._900),
                borderColor: .clear
            )
            
        ),
        darkMode: .init(
            standard: .init(
                backgroundColor: .red(._700),
                foregroundColor: .white(._900),
                borderColor: .clear
            ),
            pressed: .init(
                backgroundColor: .red(._900),
                foregroundColor: .white(._900),
                borderColor: .clear
            ),
            disabled: .init(
                backgroundColor: .red(._900),
                foregroundColor: .white(._900),
                borderColor: .clear
            )
        )
    )
}

struct Destructive_Previews: PreviewProvider {
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
            .buttonStyle(MinderaButtonStyle(appearance: .destructive, isDisabled: isDisabled))
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
