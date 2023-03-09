A simple flag toggle that can be placed anywhere on your application, ideal for internationalization (i18n).  
  
[![Build CI](https://github.com/lopb/simple_flag_toggle/actions/workflows/build.yml/badge.svg)](https://github.com/lopb/simple_flag_toggle/actions/workflows/build.yml?branch=master) [![codecov](https://codecov.io/gh/lopb/simple_flag_toggle/branch/master/graph/badge.svg)](https://app.codecov.io/gh/lopb/simple_flag_toggle/tree/master?displayType=list) [![pub package](https://img.shields.io/badge/license-MIT-purple.svg)](https://opensource.org/licenses/MIT)
  
| Simple toggle for country/region flags |
|:-------:|
| ![](https://github.com/lopb/simple_flag_toggle/raw/master/example/assets/example.gif) |
    
## Features
  
378 flags to choose (credits to [this project](https://github.com/HatScripts/circle-flags)).  

Nice rolling animation during toogle (credits to [this project](https://pub.dev/packages/animated_toggle_switch)).  
  
## Platform support

| Simple Flag Toggle | Android | iOS | macOS | Web | Windows | Linux |
| ------------------ | :-----: | :-: | :---: | :-: | :-----: | :---: |
| Compatibility      |   ✅   |  ✅  |  ✅  | ✅ |   ✅   |  ✅  |
  
## Getting started
  
- Usage
```dart
  // Defines the flags you want to use
  static final List<String> flagList = ["us", "br", "ca"];

  // Receives the flag list, the initial index and a callback function that will be executed once the toggle has changed.
  FlagBar myToggle = FlagBar(
    flagList: flagList,
    initialIndex: 0,
    onChanged: (index) {
      print("Toggle changed to: index = $index and value = ${flagList[index]}");
    },
  );
```

- I18n (example using [easy_localization](https://pub.dev/packages/easy_localization))
```dart
  Locale _getLocale(int index) {
    switch (index) {
      case 0:
        return const Locale('pt', 'BR');
      case 1:
        return const Locale('en', 'US');
    }
  }

  FlagBar myToggle = FlagBar(
    flagList: const ["br", "us"],
    initialIndex: context.supportedLocales.indexOf(context.locale),
    onChanged: (index) {
      Locale locale = _getLocale(index);
      context.setLocale(locale);
    },
  );
```
  
For more details, see [the example section](https://pub.dev/packages/simple_flag_toggle/example).
  
## Parameters
  
Required:

* **flagList**: The list of flags to be used, each flag is a string.
* **initialIndex**: The initial index of the flag list. The default is 0 (first flag on the left).
* **onChanged**: Defines the callback function to be called when the toggle changes state. The [index] variable is the index of the flag list.
  
## Caveats
  
* Soon it will be possible to customize other parameters, like the color (for now is always "Theme.of(context).primaryColor").
  
## Contributing
  
You can contribute in many ways:
- Fell free to [open issues and report bugs](https://github.com/lopb/simple_flag_toggle/issues).
- Pull requests are welcome!
- English is not my native language, if you find any errors in this documentation then please let me know.
- You can <a href="https://www.buymeacoffee.com/luisbastos">buy me a coffee!</a>
  
<a href="https://www.buymeacoffee.com/luisbastos"><img src="https://github.com/lopb/simple_flag_toggle/raw/master/example/assets/coffee_qr.png" width=400 /></a><a href="https://www.buymeacoffee.com/luisbastos"><img src="https://github.com/lopb/simple_flag_toggle/raw/master/example/assets/coffee.gif" width=300 /></a>