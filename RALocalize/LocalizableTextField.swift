//
//  LocalizableTextField.swift
//  LocalizationExample
//
//  Created by Ruben Nahatakyan on 11/26/19.
//  Copyright © 2019 Ruben Nahatakyan. All rights reserved.
//

import UIKit

open class LocalizableTextField: UITextField {

    // MARK: - Properties
    private(set) var localizedPlaceholder: String?

    override open var placeholder: String? {
        set {
            localizedPlaceholder = newValue
            let attributes: [NSAttributedString.Key: UIColor] = [.foregroundColor: placeholderColor]
            self.attributedPlaceholder = NSAttributedString(string: newValue?.localized ?? "", attributes: attributes)
        }
        get {
            return self.attributedPlaceholder?.string
        }
    }

    open var placeholderColor: UIColor = UIColor.white.withAlphaComponent(0.8)

    // MARK: - Init
    public override init(frame: CGRect) {
        super.init(frame: frame)
        startup()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        startup()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

// MARK: - Startup
private extension LocalizableTextField {
    func startup() {
        addObservers()
    }

    func addObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(languageChanged), name: .ApplicationLanguageChanged, object: nil)
    }

    @objc func languageChanged() {
        placeholder = localizedPlaceholder
    }
}
