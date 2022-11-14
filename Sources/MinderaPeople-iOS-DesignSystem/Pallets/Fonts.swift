import SwiftUI

public extension Text {
    enum Size: CGFloat {
        case XL = 24
        case L = 20
        case M2 = 18
        case M = 16
        case S = 14
        case XS = 12
    }

    enum Weight {
        case regular
        case semiBold
        case bold
    }

    // TODO: Add custom font: Inter
    func customFont(size: Size, weight: Weight = .regular) -> Text {
        let customFont = Font.system(size: size.rawValue)
        var customWeight: Font.Weight {
            switch weight {
            case .regular:
                return .regular
            case .semiBold:
                return .semibold
            case .bold:
                return .bold
            }
        }

        return font(customFont).fontWeight(customWeight)
    }
}
