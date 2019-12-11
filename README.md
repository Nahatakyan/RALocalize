# RALocalize
iOS realtime localization framework written on swift

# Example of usage

<p align="center"><img src="https://i.imgur.com/thMWUEo.gif" width="208" height="427"/></p>

```
import UIKit
import RALocalize

class ViewController: UIViewController {

    @IBOutlet private weak var label: LocalizableLabel!
    @IBOutlet private weak var button: LocalizableButton!

    @IBAction private func changeLanguageButtonAction(_ sender: Any) {
        let alertController = UIAlertController(title: "change_language".localized, message: nil, preferredStyle: .actionSheet)

        RALocalize.availableLanguages.forEach { language in
            alertController.addAction(UIAlertAction(title: language.name, style: .default, handler: { (_) in
                RALocalize.changeLanguage(language: language)
            }))
        }

        present(alertController, animated: true, completion: nil)
    }
}
```

# Features
There are implemented LocalizableLabel, LocalizableButton and LocalizableTextField(only for placeholder) classes

# Usage
Set your translation file name to 'Localizable.strings', than use '.localized' extension.

The language of the application can be changed from the application settings (starting with iOS 13).
```
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        // Check if language changed from settings
        RALocalize.checkForLanguageChange()

        return true
    }
```

To get available languages use
```
RALocalize.availableLanguages
```

To get current language code use
```
RALocalize.currentLanguageCode
```

To change language use
```
RALocalize.changeLanguage(languageCode: String)
```

# Installation
Using cocoapod

```
target 'MyApp' do
  pod 'RALocalize'
end
```
