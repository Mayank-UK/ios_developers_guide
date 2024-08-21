////
////  DesignSystem.swift
////  IosDevelopersGuide
////
////  Created by Mayank Upadhyay on 01/03/24.
////
//
//import Foundation
//import SwiftUI
//
//struct DesignSystem {
//    struct Colors {
//        //  primary colors
//        static let primary: Color = Color(red: 117/255, green: 115/255, blue: 255)
//        static let primaryLight: Color = Color(red: 117/255, green: 115/255, blue: 255/255)
//        static let primaryDark: Color = Color(red: 117/255, green: 115/255, blue: 255/255)
//        static let primaryGradient: LinearGradient = LinearGradient(
//            gradient: Gradient(colors: [primary, primaryLight, primaryDark]),
//            startPoint: .leading,
//            endPoint: .trailing
//        )
//        
//        //  secondary/accent colors
//        static let secondary: Color = Color(red: 117/255, green: 115/255, blue: 255/255)
//        static let secondaryLight: Color = Color(red: 117/255, green: 115/255, blue: 255/255)
//        static let secondaryDark: Color = Color(red: 117/255, green: 115/255, blue: 255/255)
//        static let secondaryGradient: LinearGradient = LinearGradient(
//            gradient: Gradient(colors: [secondary, secondaryLight, secondaryDark]),
//            startPoint: .leading,
//            endPoint: .trailing
//        )
//        
//        //  default system colors
//        static let error: Color = Color(red: 117/255, green: 115/255, blue: 255/255)
//        static let alert: Color = Color(red: 357, green: 596, blue: 255)
//        static let success: Color = Color(red: 117/255, green: 115/255, blue: 255/255)
//        
//        //  text colors
//        static let headingLight: Color = Color(red: 117/255, green: 115/255, blue: 255/255)
//        static let headingDark: Color = Color(red: 117/255, green: 115/255, blue: 255/255)
//        static let bodyLight: Color = Color(red: 117/255, green: 115/255, blue: 255/255)
//        static let bodyDark: Color = Color(red: 117/255, green: 115/255, blue: 255/255)
//        static let placeHolderLight: Color = Color(red: 117/255, green: 115/255, blue: 255/255)
//        static let placeHolderDark: Color = Color(red: 117/255, green: 115/255, blue: 255/255)
//        static let linkLight: Color = Color(red: 117/255, green: 115/255, blue: 255/255)
//        static let linkDark: Color = Color(red: 117/255, green: 115/255, blue: 255/255)
//        static let iconDark: Color = Color(red: 117/255, green: 115/255, blue: 255/255)
//        
//        // backgrounds
//        static let backgroundBodyLight: Color = Color(red: 117/255, green: 115/255, blue: 255/255)
//        static let backgroundBodyDark: Color = Color(red: 117/255, green: 115/255, blue: 255/255)
//        static let backgroundBodyGrey: Color = Color(red: 117/255, green: 115/255, blue: 255/255)
//        static let backgroundInputField: Color = Color(red: 117/255, green: 115/255, blue: 255/255)
//        static let backgroundBodyGradient: LinearGradient = LinearGradient(
//            gradient: Gradient(colors: [primary, primaryLight, primaryDark]),
//            startPoint: .leading,
//            endPoint: .trailing
//        )
//
//        // border colors
//        static let borderLight: Color = Color(red: 117/255, green: 115/255, blue: 255/255)
//        static let borderDark: Color = Color(red: 117/255, green: 115/255, blue: 255/255)
//    }
//
//    struct Typography {
//        struct h1 : View {
//            let color: Color
//            let text: String
//            
//            init(color: Color = DesignSystem.Colors.primary, text: String) {
//                self.color = color
//                self.text = text
//            }
//            
//            var body: some View {
//                return Text(text)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .font(.custom("Montserrat-Bold", size: 96))
//                    .fontWeight(.bold)
//                    .foregroundColor(color)
//                    .kerning(-1.5)
//            }
//        }
//        
//        struct h2 : View {
//            let color: Color
//            let text: String
//            
//            init(color: Color = DesignSystem.Colors.primary, text: String) {
//                self.color = color
//                self.text = text
//            }
//            
//            var body: some View {
//                return Text(text)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .font(.custom("Montserrat-Bold", size: 60))
//                    .fontWeight(.bold)
//                    .foregroundColor(color)
//                    .kerning(-0.5)
//            }
//        }
//        
//        struct h3 : View {
//            let color: Color
//            let text: String
//            
//            init(color: Color = DesignSystem.Colors.primary, text: String) {
//                self.color = color
//                self.text = text
//            }
//            
//            var body: some View {
//                return Text(text)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .font(.custom("Montserrat-Bold", size: 48))
//                    .fontWeight(.bold)
//                    .foregroundColor(color)
//                    .kerning(0)
//            }
//        }
//
//        struct h4 : View {
//            let color: Color
//            let text: String
//            
//            init(color: Color = DesignSystem.Colors.primary, text: String) {
//                self.color = color
//                self.text = text
//            }
//            
//            var body: some View {
//                return Text(text)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .font(.custom("Montserrat-Bold", size: 34))
//                    .fontWeight(.bold)
//                    .foregroundColor(color)
//                    .kerning(0.25)
//            }
//        }
//
//        struct h5: View {
//            let color: Color
//            let text: String
//            
//            init(color: Color = DesignSystem.Colors.primary, text: String) {
//                self.color = color
//                self.text = text
//            }
//            
//            var body: some View {
//                return Text(text)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .font(.custom("Montserrat-Bold", size: 24))
//                    .fontWeight(.bold)
//                    .foregroundColor(color)
//                    .kerning(0)
//            }
//        }
//
//        struct h6 : View {
//            let color: Color
//            let text: String
//            
//            init(color: Color = DesignSystem.Colors.primary, text: String) {
//                self.color = color
//                self.text = text
//            }
//            
//            var body: some View {
//                return Text(text)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .font(.custom("Montserrat-Bold", size: 20))
//                    .fontWeight(.bold)
//                    .foregroundColor(color)
//                    .kerning(0.15)
//            }
//        }
//
//        struct subtitle1 : View {
//            let color: Color
//            let text: String
//            
//            init(color: Color = DesignSystem.Colors.primary, text: String) {
//                self.color = color
//                self.text = text
//            }
//            
//            var body: some View {
//                return Text(text)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .font(.custom("Montserrat-Medium", size: 16))
//                    .fontWeight(.medium)
//                    .foregroundColor(color)
//                    .kerning(0.15)
//            }
//        }
//
//        struct subtitle2 : View {
//            let color: Color
//            let text: String
//            
//            init(color: Color = DesignSystem.Colors.primary, text: String) {
//                self.color = color
//                self.text = text
//            }
//            
//            var body: some View {
//                return Text(text)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .font(.custom("Montserrat-Medium", size: 14))
//                    .fontWeight(.medium)
//                    .foregroundColor(color)
//                    .kerning(0.1)
//            }
//        }
//
//        struct body1 : View {
//            let color: Color
//            let text: String
//            
//            init(color: Color = DesignSystem.Colors.primary, text: String) {
//                self.color = color
//                self.text = text
//            }
//            
//            var body: some View {
//                return Text(text)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .font(.custom("Montserrat-Bold", size: 16))
//                    .fontWeight(.regular)
//                    .foregroundColor(color)
//                    .kerning(0.5)
//            }
//        }
//
//        struct body2 : View {
//            let color: Color
//            let text: String
//            
//            init(color: Color = DesignSystem.Colors.primary, text: String) {
//                self.color = color
//                self.text = text
//            }
//            
//            var body: some View {
//                return Text(text)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .font(.custom("Montserrat-Regular", size: 14))
//                    .fontWeight(.regular)
//                    .foregroundColor(color)
//                    .kerning(0.25)
//            }
//        }
//
//        struct button : View {
//            let color: Color
//            let text: String
//            
//            init(color: Color = DesignSystem.Colors.primary, text: String) {
//                self.color = color
//                self.text = text
//            }
//            
//            var body: some View {
//                return Text(text)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .font(.custom("Montserrat-Regular", size: 16))
//                    .fontWeight(.bold)
//                    .foregroundColor(color)
//                    .kerning(1.25)
//            }
//        }
//
//        struct buttonSmall : View {
//            let color: Color
//            let text: String
//            
//            init(color: Color = DesignSystem.Colors.primary, text: String) {
//                self.color = color
//                self.text = text
//            }
//            
//            var body: some View {
//                return Text(text)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .font(.custom("Montserrat-Bold", size: 12))
//                    .fontWeight(.bold)
//                    .foregroundColor(color)
//                    .kerning(1.25)
//            }
//        }
//
//        struct navigation : View {
//            let color: Color
//            let text: String
//            
//            init(color: Color = DesignSystem.Colors.primary, text: String) {
//                self.color = color
//                self.text = text
//            }
//            
//            var body: some View {
//                return Text(text)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .font(.custom("Montserrat-Regular", size: 14))
//                    .fontWeight(.regular)
//                    .foregroundColor(color)
//                    .kerning(0.25)
//            }
//        }
//
//        struct time : View {
//            let color: Color
//            let text: String
//            
//            init(color: Color = DesignSystem.Colors.primary, text: String) {
//                self.color = color
//                self.text = text
//            }
//            
//            var body: some View {
//                return Text(text)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .font(.custom("Montserrat-Regular", size: 10))
//                    .fontWeight(.regular)
//                    .foregroundColor(color)
//                    .kerning(1.5)
//            }
//        }
//
//        struct small : View {
//            let color: Color
//            let text: String
//            
//            init(color: Color = DesignSystem.Colors.primary, text: String) {
//                self.color = color
//                self.text = text
//            }
//            
//            var body: some View {
//                return Text(text)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .font(.custom("Montserrat-Regular", size: 12))
//                    .fontWeight(.regular)
//                    .foregroundColor(color)
//                    .kerning(0.4)
//            }
//        }
//
//        struct smallBold : View {
//            let color: Color
//            let text: String
//            
//            init(color: Color = DesignSystem.Colors.primary, text: String) {
//                self.color = color
//                self.text = text
//            }
//            
//            var body: some View {
//                return Text(text)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .font(.custom("Montserrat-Bold", size: 12))
//                    .fontWeight(.bold)
//                    .foregroundColor(color)
//                    .kerning(0.25)
//            }
//        }
//    }
//    
//    struct Sizes {
//        static let xxs: Int = 2
//        static let xs: Int = 4
//        static let sm: Int = 8
//        static let md: Int = 16
//        static let lg: Int = 32
//        static let xl: Int = 64
//        static let xxl: Int = 128
//        static let xxxl: Int = 256
//    }
//    
//    enum Shadows {
//        case buttonCard
//        case buttonCardHover
//        case navigationMenu
//        case modal
//        case bottomSheet
//    }
//}
//
//struct DSShadowComponent: ViewModifier {
//    var color: Color
//    var radius: CGFloat
//    var x: CGFloat
//    var y: CGFloat
//
//    func body(content: Content) -> some View {
//        content
//            .shadow(color: color, radius: radius, x: x, y: y)
//    }
//}
//
//extension View {
//    func designSystemShadow(shadow: DesignSystem.Shadows) -> some View {
//        switch shadow {
//            case .buttonCard:
//                return modifier(DSShadowComponent(color: .gray, radius: 2, x: 0, y: 1))
//            case .buttonCardHover:
//                return modifier(DSShadowComponent(color: .gray, radius: 4, x: 0, y: 4))
//            case .navigationMenu:
//                return modifier(DSShadowComponent(color: .gray, radius: 19, x: 0, y: 19))
//            case .modal:
//                return modifier(DSShadowComponent(color: .gray, radius: 8, x: 7, y: 14))
//            case .bottomSheet:
//                return modifier(DSShadowComponent(color: .gray, radius: 8, x: -2, y: 4))
//        }
//    }
//}
