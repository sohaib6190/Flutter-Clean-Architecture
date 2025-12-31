enum ItrTypes {
  directITR,
  adjustedITR,
  poBasedITR;

  String get value {
    switch (this) {
      case ItrTypes.directITR:
        return 'DirectITR';
      case ItrTypes.adjustedITR:
        return 'AdjustedITR';
      case ItrTypes.poBasedITR:
        return 'PoBasedITR';
    }
  }
}

enum ItTypes {
  directIT,
  adjustedIT,
  poBasedIT;

  String get value {
    switch (this) {
      case ItTypes.directIT:
        return 'DirectIT';
      case ItTypes.adjustedIT:
        return 'AdjustedIT';
      case ItTypes.poBasedIT:
        return 'PoBasedIT';
    }
  }
}
