//
//  RALanguage.swift
//  RALocalize
//
//  Created by Ruben Nahatakyan on 12/11/19.
//  Copyright © 2019 Ruben Nahatakyan. All rights reserved.
//

import UIKit

public struct RALanguage: Equatable {
    public let code: String
    public let name: String?
    public let nativeName: String?

    public init(code: String) {
        self.code = code
        self.nativeName = Locale(identifier: code).localizedString(forLanguageCode: code)?.firstUppercased

        let languageCode: String
        if let currentLanguage = Locale.preferredLanguages.first {
            languageCode = Locale.components(fromIdentifier: currentLanguage)[NSLocale.Key.languageCode.rawValue] ?? ""
        } else {
            languageCode = code
        }
        self.name = Locale(identifier: languageCode).localizedString(forLanguageCode: code)?.firstUppercased
    }
}
