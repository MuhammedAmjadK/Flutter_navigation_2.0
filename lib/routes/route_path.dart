/// Class to define path structure
class RoutePath {
  final String? pathName;
  final bool isUnknown;
  final bool isSecondaryPath;

  RoutePath.secondary(this.pathName)
      : isUnknown = false,
        isSecondaryPath = true;

  RoutePath.home(this.pathName)
      : isUnknown = false,
        isSecondaryPath = false;
  RoutePath.otherPage(this.pathName)
      : isUnknown = false,
        isSecondaryPath = false;
  RoutePath.unknown()
      : pathName = null,
        isUnknown = true,
        isSecondaryPath = false;

  bool get isHomePage => pathName == null;
  bool get isOtherPage => pathName != null;
}
