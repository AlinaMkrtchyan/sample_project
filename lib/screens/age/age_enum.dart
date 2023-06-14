extension AgeRangeExtension on AgeRange {
  String get title {
    switch (this) {
      case AgeRange.belowThirty:
        return '< 30';
      case AgeRange.thirtyToFortyFive:
        return '31 - 45';
      case AgeRange.fortySixToFiftyFive:
        return '46 - 55';
      case AgeRange.fiftySixToSixtyFive:
        return '56 - 65';
      case AgeRange.sixtySixToSeventyFive:
        return '66 - 75';
      case AgeRange.aboveSeventyFive:
        return '75 +';
    }
  }
}

enum AgeRange {
  belowThirty,
  thirtyToFortyFive,
  fortySixToFiftyFive,
  fiftySixToSixtyFive,
  sixtySixToSeventyFive,
  aboveSeventyFive
}
