enum FlavorTypes { dev, prod, realese }

class Flavor {
  Flavor._instance();

  static late FlavorTypes flavorType;

  static String get flavorMessage {
    switch (flavorType) {
      case FlavorTypes.dev:
        return 'Dev';
      case FlavorTypes.prod:
        return 'Prod';
      case FlavorTypes.realese:
        return 'Dev';
    }
  }

  static String get apiBaseUrl {
    switch (flavorType) {
      case FlavorTypes.dev:
        return 'apiUrlBaseDev';
      case FlavorTypes.prod:
        return 'apiUrlBaseProd';
      case FlavorTypes.realese:
        return 'apiUrlBaseDev';
    }
  }

  static bool isProduction() => flavorType == FlavorTypes.prod;
  static bool isDevelopment() => flavorType == FlavorTypes.dev;
  static bool isRealese() => flavorType == FlavorTypes.realese;
}
