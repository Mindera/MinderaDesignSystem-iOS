import SwiftUI

public extension Color {
    enum Intensity {
        case _000
        case _100
        case _200
        case _300
        case _400
        case _500
        case _600
        case _700
        case _800
        case _900
    }

    static func greyBrown(_ intensity: Intensity) -> Color {
        switch intensity {
        case ._000:
            return .init(red: 250, green: 250, blue: 259)
        case ._100:
            return .init(red: 241, green: 241, blue: 237)
        case ._200:
            return .init(red: 232, green: 230, blue: 225)
        case ._300:
            return .init(red: 220, green: 219, blue: 211)
        case ._400:
            return .init(red: 208, green: 207, blue: 195)
        case ._500:
            return .init(red: 195, green: 192, blue: 178)
        case ._600:
            return .init(red: 179, green: 175, blue: 157)
        case ._700:
            return .init(red: 159, green: 155, blue: 131)
        case ._800:
            return .init(red: 131, green: 127, blue: 108)
        case ._900:
            return .init(red: 82, green: 80, blue: 67)
        }
    }

    static func black(_ intensity: Intensity) -> Color {
        switch intensity {
        case ._000:
            return .black.opacity(0.1)
        case ._100:
            return .black.opacity(0.2)
        case ._200:
            return .black.opacity(0.3)
        case ._300:
            return .black.opacity(0.4)
        case ._400:
            return .black.opacity(0.5)
        case ._500:
            return .black.opacity(0.6)
        case ._600:
            return .black.opacity(0.7)
        case ._700:
            return .black.opacity(0.8)
        case ._800:
            return .black.opacity(0.9)
        case ._900:
            return .black
        }
    }

    static func greyBlue(_ intensity: Intensity) -> Color {
        switch intensity {
        case ._000:
            return .init(red: 236, green: 239, blue: 241)
        case ._100:
            return .init(red: 207, green: 216, blue: 220)
        case ._200:
            return .init(red: 176, green: 190, blue: 197)
        case ._300:
            return .init(red: 144, green: 164, blue: 174)
        case ._400:
            return .init(red: 120, green: 144, blue: 156)
        case ._500:
            return .init(red: 96, green: 125, blue: 139)
        case ._600:
            return .init(red: 84, green: 110, blue: 122)
        case ._700:
            return .init(red: 69, green: 90, blue: 100)
        case ._800:
            return .init(red: 55, green: 71, blue: 79)
        case ._900:
            return .init(red: 38, green: 50, blue: 56)
        }
    }

    static func white(_ intensity: Intensity) -> Color {
        switch intensity {
        case ._000:
            return .white.opacity(0.1)
        case ._100:
            return .white.opacity(0.2)
        case ._200:
            return .white.opacity(0.3)
        case ._300:
            return .white.opacity(0.4)
        case ._400:
            return .white.opacity(0.5)
        case ._500:
            return .white.opacity(0.6)
        case ._600:
            return .white.opacity(0.7)
        case ._700:
            return .white.opacity(0.8)
        case ._800:
            return .white.opacity(0.9)
        case ._900:
            return .white
        }
    }

    static func yellow(_ intensity: Intensity) -> Color {
        switch intensity {
        case ._000:
            return .init(red: 255, green: 250, blue: 229)
        case ._100:
            return .init(red: 255, green: 244, blue: 202)
        case ._200:
            return .init(red: 255, green: 239, blue: 169)
        case ._300:
            return .init(red: 255, green: 232, blue: 131)
        case ._400:
            return .init(red: 255, green: 224, blue: 84)
        case ._500:
            return .init(red: 255, green: 216, blue: 41)
        case ._600:
            return .init(red: 236, green: 200, blue: 37)
        case ._700:
            return .init(red: 214, green: 180, blue: 32)
        case ._800:
            return .init(red: 184, green: 154, blue: 26)
        case ._900:
            return .init(red: 142, green: 118, blue: 18)
        }
    }

    static func lime(_ intensity: Intensity) -> Color {
        switch intensity {
        case ._000:
            return .init(red: 248, green: 255, blue: 238)
        case ._100:
            return .init(red: 238, green: 254, blue: 209)
        case ._200:
            return .init(red: 228, green: 253, blue: 180)
        case ._300:
            return .init(red: 217, green: 253, blue: 145)
        case ._400:
            return .init(red: 202, green: 252, blue: 99)
        case ._500:
            return .init(red: 180, green: 252, blue: 49)
        case ._600:
            return .init(red: 166, green: 233, blue: 44)
        case ._700:
            return .init(red: 149, green: 210, blue: 39)
        case ._800:
            return .init(red: 149, green: 210, blue: 39)
        case ._900:
            return .init(red: 99, green: 140, blue: 23)
        }
    }

    static func green(_ intensity: Intensity) -> Color {
        switch intensity {
        case ._000:
            return .init(red: 239, green: 254, blue: 237)
        case ._100:
            return .init(red: 221, green: 254, blue: 217)
        case ._200:
            return .init(red: 198, green: 253, blue: 194)
        case ._300:
            return .init(red: 171, green: 252, blue: 164)
        case ._400:
            return .init(red: 129, green: 252, blue: 123)
        case ._500:
            return .init(red: 0, green: 251, blue: 48)
        case ._600:
            return .init(red: 0, green: 232, blue: 44)
        case ._700:
            return .init(red: 0, green: 209, blue: 38)
        case ._800:
            return .init(red: 0, green: 180, blue: 32)
        case ._900:
            return .init(red: 0, green: 139, blue: 22)
        }
    }

    static func teal(_ intensity: Intensity) -> Color {
        switch intensity {
        case ._000:
            return .init(red: 237, green: 254, blue: 243)
        case ._100:
            return .init(red: 215, green: 254, blue: 231)
        case ._200:
            return .init(red: 190, green: 253, blue: 216)
        case ._300:
            return .init(red: 156, green: 253, blue: 198)
        case ._400:
            return .init(red: 104, green: 252, blue: 172)
        case ._500:
            return .init(red: 0, green: 251, blue: 109)
        case ._600:
            return .init(red: 0, green: 232, blue: 100)
        case ._700:
            return .init(red: 0, green: 209, blue: 89)
        case ._800:
            return .init(red: 0, green: 180, blue: 76)
        case ._900:
            return .init(red: 0, green: 139, blue: 57)
        }
    }

    static func cyan(_ intensity: Intensity) -> Color {
        switch intensity {
        case ._000:
            return .init(red: 237, green: 255, blue: 252)
        case ._100:
            return .init(red: 216, green: 254, blue: 248)
        case ._200:
            return .init(red: 191, green: 254, blue: 244)
        case ._300:
            return .init(red: 158, green: 253, blue: 239)
        case ._400:
            return .init(red: 105, green: 253, blue: 233)
        case ._500:
            return .init(red: 0, green: 252, blue: 218)
        case ._600:
            return .init(red: 0, green: 233, blue: 201)
        case ._700:
            return .init(red: 0, green: 210, blue: 181)
        case ._800:
            return .init(red: 0, green: 181, blue: 157)
        case ._900:
            return .init(red: 0, green: 140, blue: 120)
        }
    }

    static func blue(_ intensity: Intensity) -> Color {
        switch intensity {
        case ._000:
            return .init(red: 231, green: 248, blue: 255)
        case ._100:
            return .init(red: 204, green: 239, blue: 254)
        case ._200:
            return .init(red: 172, green: 230, blue: 254)
        case ._300:
            return .init(red: 130, green: 219, blue: 254)
        case ._400:
            return .init(red: 69, green: 205, blue: 254)
        case ._500:
            return .init(red: 0, green: 187, blue: 253)
        case ._600:
            return .init(red: 0, green: 172, blue: 233)
        case ._700:
            return .init(red: 0, green: 155, blue: 210)
        case ._800:
            return .init(red: 0, green: 133, blue: 180)
        case ._900:
            return .init(red: 0, green: 100, blue: 138)
        }
    }

    static func orange(_ intensity: Intensity) -> Color {
        switch intensity {
        case ._000:
            return .init(red: 255, green: 241, blue: 234)
        case ._100:
            return .init(red: 255, green: 226, blue: 212)
        case ._200:
            return .init(red: 255, green: 207, blue: 184)
        case ._300:
            return .init(red: 255, green: 185, blue: 149)
        case ._400:
            return .init(red: 255, green: 156, blue: 100)
        case ._500:
            return .init(red: 255, green: 107, blue: 16)
        case ._600:
            return .init(red: 241, green: 98, blue: 15)
        case ._700:
            return .init(red: 217, green: 87, blue: 12)
        case ._800:
            return .init(red: 187, green: 74, blue: 8)
        case ._900:
            return .init(red: 143, green: 54, blue: 5)
        }
    }

    static func red(_ intensity: Intensity) -> Color {
        switch intensity {
        case ._000:
            return .init(red: 255, green: 239, blue: 241)
        case ._100:
            return .init(red: 255, green: 221, blue: 227)
        case ._200:
            return .init(red: 255, green: 200, blue: 209)
        case ._300:
            return .init(red: 255, green: 173, blue: 187)
        case ._400:
            return .init(red: 255, green: 131, blue: 151)
        case ._500:
            return .init(red: 255, green: 44, blue: 62)
        case ._600:
            return .init(red: 243, green: 39, blue: 56)
        case ._700:
            return .init(red: 219, green: 35, blue: 49)
        case ._800:
            return .init(red: 189, green: 29, blue: 41)
        case ._900:
            return .init(red: 146, green: 19, blue: 29)
        }
    }

    static func pink(_ intensity: Intensity) -> Color {
        switch intensity {
        case ._000:
            return .init(red: 255, green: 239, blue: 249)
        case ._100:
            return .init(red: 255, green: 222, blue: 243)
        case ._200:
            return .init(red: 255, green: 200, blue: 236)
        case ._300:
            return .init(red: 255, green: 173, blue: 227)
        case ._400:
            return .init(red: 255, green: 135, blue: 215)
        case ._500:
            return .init(red: 255, green: 50, blue: 186)
        case ._600:
            return .init(red: 243, green: 46, blue: 171)
        case ._700:
            return .init(red: 220, green: 40, blue: 154)
        case ._800:
            return .init(red: 190, green: 33, blue: 132)
        case ._900:
            return .init(red: 146, green: 23, blue: 102)
        }
    }

    static func fuchsia(_ intensity: Intensity) -> Color {
        switch intensity {
        case ._000:
            return .init(red: 146, green: 23, blue: 102)
        case ._100:
            return .init(red: 250, green: 220, blue: 254)
        case ._200:
            return .init(red: 247, green: 198, blue: 253)
        case ._300:
            return .init(red: 244, green: 171, blue: 253)
        case ._400:
            return .init(red: 239, green: 132, blue: 252)
        case ._500:
            return .init(red: 225, green: 50, blue: 252)
        case ._600:
            return .init(red: 207, green: 46, blue: 232)
        case ._700:
            return .init(red: 187, green: 40, blue: 210)
        case ._800:
            return .init(red: 160, green: 33, blue: 180)
        case ._900:
            return .init(red: 123, green: 23, blue: 139)
        }
    }

    static func violet(_ intensity: Intensity) -> Color {
        switch intensity {
        case ._000:
            return .init(red: 244, green: 239, blue: 255)
        case ._100:
            return .init(red: 231, green: 220, blue: 254)
        case ._200:
            return .init(red: 217, green: 197, blue: 253)
        case ._300:
            return .init(red: 198, green: 169, blue: 253)
        case ._400:
            return .init(red: 172, green: 129, blue: 252)
        case ._500:
            return .init(red: 106, green: 38, blue: 251)
        case ._600:
            return .init(red: 97, green: 34, blue: 232)
        case ._700:
            return .init(red: 87, green: 29, blue: 209)
        case ._800:
            return .init(red: 74, green: 23, blue: 179)
        case ._900:
            return .init(red: 54, green: 15, blue: 137)
        }
    }

    static func indigo(_ intensity: Intensity) -> Color {
        switch intensity {
        case ._000:
            return .init(red: 237, green: 240, blue: 255)
        case ._100:
            return .init(red: 216, green: 224, blue: 254)
        case ._200:
            return .init(red: 191, green: 204, blue: 254)
        case ._300:
            return .init(red: 160, green: 179, blue: 253)
        case ._400:
            return .init(red: 114, green: 146, blue: 252)
        case ._500:
            return .init(red: 18, green: 70, blue: 252)
        case ._600:
            return .init(red: 16, green: 64, blue: 232)
        case ._700:
            return .init(red: 13, green: 56, blue: 208)
        case ._800:
            return .init(red: 10, green: 46, blue: 178)
        case ._900:
            return .init(red: 5, green: 32, blue: 134)
        }
    }
}

extension Color {
    init(colorSpace: RGBColorSpace = .sRGB, red: Int, green: Int, blue: Int, opacity: Double = 1) {
        let maxValue: Double = 255
        self.init(colorSpace,
                  red: Double(red) / maxValue,
                  green: Double(green) / maxValue,
                  blue: Double(blue) / maxValue,
                  opacity: opacity)
    }
}
