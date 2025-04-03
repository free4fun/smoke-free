class CompareDateAndTime {
  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inDays % 24);
  }

  int hoursBetween(DateTime from, DateTime to) {
    return (to.difference(from).inHours % 60);
  }

  int minutesBetween(DateTime from, DateTime to) {
    return (to.difference(from).inMinutes % 60).round();
  }
}
