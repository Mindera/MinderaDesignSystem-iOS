import SwiftUI

extension ButtonAppearance {
    static let danger = ButtonAppearance(
        lightMode: .init(
            standard: .init(
                backgroundColor: .white(._900),
                foregroundColor: .red(._700),
                borderColor: .black(._000)
            ),
            pressed: .init(
                backgroundColor: .red(._000),
                foregroundColor: .red(._900),
                borderColor: .clear
            ),
            disabled: .init(
                backgroundColor: .clear,
                foregroundColor: .red(._400),
                borderColor: .clear
            )
            
        ),
        darkMode: .init(
            standard: .init(
                backgroundColor: .white(._900),
                foregroundColor: .red(._700),
                borderColor: .black(._000)
            ),
            pressed: .init(
                backgroundColor: .red(._000),
                foregroundColor: .red(._900),
                borderColor: .clear
            ),
            disabled: .init(
                backgroundColor: .clear,
                foregroundColor: .red(._400),
                borderColor: .clear
            )
        )
    )
}

struct Danger_Previews: PreviewProvider {
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
            .buttonStyle(MinderaButtonStyle(appearance: .danger, isDisabled: isDisabled))
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
