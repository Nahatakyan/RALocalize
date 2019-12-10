//
//  Localization.swift
//  RALocalize
//
//  Created by Ruben Nahatakyan on 11/26/19.
//  Copyright © 2019 Ruben Nahatakyan. All rights reserved.
//

import UIKit

open class RALocalize: NSObject {

    // MARK: - Available languages
    open class var availableLanguages: [String] {
        var availableLanguages = Bundle.main.localizations
        if let index = availableLanguages.firstIndex(of: "Base") {
            availableLanguages.remove(at: index)
        }
        return availableLanguages
    }

    // MARK: - Current language code
    open class var currentLanguageCode: String? {
        if let currentLanguage = UserDefaults.standard.string(forKey: "ra_language_code") {
            return currentLanguage
        }
        let currentLanguage = Locale.current.languageCode
        UserDefaults.standard.set(currentLanguage, forKey: "ra_language_code")
        return currentLanguage
    }

    // MARK: - Change language
    open class func changeLanguage(languageCode: String) {
        guard availableLanguages.contains(languageCode), currentLanguageCode != languageCode else { return }

        var appleLanguageIdentifiers = Locale.preferredLanguages
        let languageCodes = appleLanguageIdentifiers.map { identifier -> String in
            let components = Locale.components(fromIdentifier: identifier)
            return components[NSLocale.Key.languageCode.rawValue] ?? ""
        }

        let selectedIndex = languageCodes.firstIndex(of: languageCode) ?? 0
        let languageIdentifier = appleLanguageIdentifiers[selectedIndex]
        appleLanguageIdentifiers.remove(at: selectedIndex)
        appleLanguageIdentifiers.insert(languageIdentifier, at: 0)

        UserDefaults.standard.set(languageCode, forKey: "ra_language_code")
        UserDefaults.standard.set(appleLanguageIdentifiers, forKey: "AppleLanguages")
        NotificationCenter.default.post(name: .ApplicationLanguageChanged, object: nil)
    }

    // MARK: - Check for language change
    open class func checkForLanguageChange() {
        guard let changedLanguage = Locale.preferredLanguages.first, let currentLanguage = UserDefaults.standard.string(forKey: "ra_language_code") else { return }
        let components = Locale.components(fromIdentifier: changedLanguage)
        let languageCode = components[NSLocale.Key.languageCode.rawValue] ?? ""
        if languageCode != currentLanguage {
            changeLanguage(languageCode: languageCode)
        }
    }
}
