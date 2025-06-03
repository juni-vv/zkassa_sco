enum LanguageOption { dutch, english, french, german }

extension LanguageOptionFunctions on LanguageOption {
  String get getFlagDir {
    switch (this) {
      case LanguageOption.dutch:
        return "res/images/flag_nl.webp";
      case LanguageOption.english:
        return "res/images/flag_uk.webp";
      case LanguageOption.french:
        return "res/images/flag_fr.webp";
      case LanguageOption.german:
        return "res/images/flag_de.webp";
    }
  }
}
