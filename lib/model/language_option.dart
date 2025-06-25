enum LanguageOption { dutch, english, french, german }

extension LanguageOptionFunctions on LanguageOption {
  String get getFlagDir {
    switch (this) {
      case LanguageOption.dutch:
        return "res/images/flag/flag_nl.webp";
      case LanguageOption.english:
        return "res/images/flag/flag_uk.webp";
      case LanguageOption.french:
        return "res/images/flag/flag_fr.webp";
      case LanguageOption.german:
        return "res/images/flag/flag_de.webp";
    }
  }

  String get name {
    switch (this) {
      case LanguageOption.dutch:
        return "Nederlands";
      case LanguageOption.english:
        return "English";
      case LanguageOption.french:
        return "Oui oui baguette";
      case LanguageOption.german:
        return "Ja ja wurstenbrod";
    }
  }
}
