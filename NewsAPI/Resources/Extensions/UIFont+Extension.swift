//
//  UIFont+Extension.swift
//  NewsAPI
//
//  Created by Junior Obici on 28/03/22.
//

import UIKit

public extension UIFont {
    
    class func loadAllFonts(bundle: Bundle) {
        
        regFont(bundle: bundle, fontName: "Poppins-Black", fontExtension: ".otf")
        regFont(bundle: bundle, fontName: "Poppins-BlackItalic", fontExtension: ".otf")
        regFont(bundle: bundle, fontName: "Poppins-Bold", fontExtension: ".otf")
        regFont(bundle: bundle, fontName: "Poppins-BoldItalic", fontExtension: ".otf")
        regFont(bundle: bundle, fontName: "Poppins-ExtraBold", fontExtension: ".otf")
        regFont(bundle: bundle, fontName: "Poppins-ExtraBoldItalic", fontExtension: ".otf")
        regFont(bundle: bundle, fontName: "Poppins-ExtraLight", fontExtension: ".otf")
        regFont(bundle: bundle, fontName: "Poppins-ExtraLightItalic", fontExtension: ".otf")
        regFont(bundle: bundle, fontName: "Poppins-Italic", fontExtension: ".otf")
        regFont(bundle: bundle, fontName: "Poppins-Light", fontExtension: ".otf")
        regFont(bundle: bundle, fontName: "Poppins-Medium", fontExtension: ".otf")
        regFont(bundle: bundle, fontName: "Poppins-MediumItalic", fontExtension: ".otf")
        regFont(bundle: bundle, fontName: "Poppins-Regular", fontExtension: ".otf")
        regFont(bundle: bundle, fontName: "Poppins-SemiBold", fontExtension: ".otf")
        regFont(bundle: bundle, fontName: "Poppins-SemiBoldItalic", fontExtension: ".otf")
        regFont(bundle: bundle, fontName: "Poppins-Thin", fontExtension: ".otf")
        regFont(bundle: bundle, fontName: "Poppins-ThinItalic", fontExtension: ".otf")
    }
    
    static func regFont(bundle: Bundle, fontName: String, fontExtension: String) {
        guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension) else {
            fatalError("Couldn't find font \(fontName)")
        }
        
        guard let fontDataProvider = CGDataProvider(url: fontURL as CFURL) else {
            fatalError("Couldn't load data from the font \(fontName)")
        }
        
        guard let font = CGFont(fontDataProvider) else {
            fatalError("Couldn't create font from data")
        }
        
        var error: Unmanaged<CFError>?
        let _ = CTFontManagerRegisterGraphicsFont(font, &error)

        return
    }
}

public struct NewsFont {
    
    public static func poppinsBlack(ofSize: CGFloat) -> UIFont? {
        return UIFont(name: "Poppins-Black", size: ofSize)
    }
    
    public static func poppinsBlackItalic(ofSize: CGFloat) -> UIFont? {
        return UIFont(name: "Poppins-BlackItalic", size: ofSize)
    }
    
    public static func poppinsBold(ofSize: CGFloat) -> UIFont? {
        return UIFont(name: "Poppins-Bold", size: ofSize) ?? UIFont.boldSystemFont(ofSize: ofSize)
    }
    
    public static func poppinsBoldItalic(ofSize: CGFloat) -> UIFont? {
        return UIFont(name: "Poppins-BoldItalic", size: ofSize) ?? UIFont.italicSystemFont(ofSize: ofSize)
    }
    
    public static func poppinsExtraBold(ofSize: CGFloat) -> UIFont? {
        return UIFont(name: "Poppins-ExtraBold", size: ofSize) ?? UIFont.boldSystemFont(ofSize: ofSize)
    }
    
    public static func poppinsExtraBoldItalic(ofSize: CGFloat) -> UIFont? {
        return UIFont(name: "Poppins-ExtraBoldItalic", size: ofSize) ?? UIFont.italicSystemFont(ofSize: ofSize)
    }
    
    public static func poppinsExtraLight(ofSize: CGFloat) -> UIFont? {
        return UIFont(name: "Poppins-ExtraLight", size: ofSize) ?? UIFont.systemFont(ofSize: ofSize)
    }
    
    public static func poppinsExtraLightItalic(ofSize: CGFloat) -> UIFont? {
        return UIFont(name: "Poppins-ExtraLightItalic", size: ofSize) ?? UIFont.italicSystemFont(ofSize: ofSize)
    }
    
    public static func poppinsItalic(ofSize: CGFloat) -> UIFont? {
        return UIFont(name: "Poppins-Italic", size: ofSize) ?? UIFont.italicSystemFont(ofSize: ofSize)
    }
    
    public static func poppinsLight(ofSize: CGFloat) -> UIFont? {
        return UIFont(name: "Poppins-Light", size: ofSize) ?? UIFont.systemFont(ofSize: ofSize)
    }
    
    public static func poppinsMedium(ofSize: CGFloat) -> UIFont? {
        return UIFont(name: "Poppins-Medium", size: ofSize) ?? UIFont.systemFont(ofSize: ofSize)
    }
    
    public static func poppinsMediumItalic(ofSize: CGFloat) -> UIFont? {
        return UIFont(name: "Poppins-MediumItalic", size: ofSize) ?? UIFont.italicSystemFont(ofSize: ofSize)
    }
    
    public static func poppinsRegular(ofSize: CGFloat) -> UIFont? {
        return UIFont(name: "Poppins-Regular", size: ofSize) ?? UIFont.systemFont(ofSize: ofSize)
    }
    
    public static func poppinsSemiBold(ofSize: CGFloat) -> UIFont? {
        return UIFont(name: "Poppins-SemiBold", size: ofSize) ?? UIFont.boldSystemFont(ofSize: ofSize)
    }
    
    public static func poppinsSemiBoldItalic(ofSize: CGFloat) -> UIFont? {
        return UIFont(name: "Poppins-SemiBoldItalic", size: ofSize) ?? UIFont.italicSystemFont(ofSize: ofSize)
    }
    
    public static func poppinsThin(ofSize: CGFloat) -> UIFont? {
        return UIFont(name: "Poppins-Thin", size: ofSize) ?? UIFont.systemFont(ofSize: ofSize)
    }
    
    public static func poppinsThinItalic(ofSize: CGFloat) -> UIFont? {
        return UIFont(name: "Poppins-ThinItalic", size: ofSize) ?? UIFont.italicSystemFont(ofSize: ofSize)
    }
}
