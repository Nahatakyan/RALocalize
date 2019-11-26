//
//  String extension.swift
//  RALocalize
//
//  Created by Ruben Nahatakyan on 11/26/19.
//  Copyright © 2019 Ruben Nahatakyan. All rights reserved.
//

import Foundation

public extension String {
    func localized() -> String {
        if let path = Bundle.main.path(forResource: RALocale.currentLanguageCode, ofType: "lproj"),
            let bundle = Bundle(path: path) {
            return NSLocalizedString(self, tableName: nil, bundle: bundle, comment: "")
        }
        return self
    }
}
