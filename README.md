# RALocalize
iOS realtime localization framework written on swift

# Features
There are implemented LocalizableLabel, LocalizableButton and LocalizableTextField(only for placeholder) classes

# Usage
Set your translation file name to 'Localizable.strings', than use '.localized' extension.

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
