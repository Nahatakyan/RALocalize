# RALocalize
iOS realtime localization framework written on swift

<p align="center"><img src="https://i.imgur.com/thMWUEo.gifv" width="208" height="427"/></p>

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
