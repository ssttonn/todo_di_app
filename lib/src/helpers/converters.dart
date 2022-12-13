DateTime? dateTimeFromMillis(int? millisecondsSinceEpoch) {
  if (millisecondsSinceEpoch == null) {
    return null;
  }
  return DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
}
