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

    func customFont(size: Size, weight: Weight = .regular) -> Text {
        registerFonts()
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
        return font(.custom("Inter", size: size.rawValue)).fontWeight(customWeight)
    }
}
