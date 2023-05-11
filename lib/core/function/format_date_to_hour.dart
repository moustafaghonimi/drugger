String formatDateDetails(DateTime? date) {
  String year = date!.year.toString();
  String month = date.month.toString().padLeft(2, '0');
  String day = date.day.toString().padLeft(2, '0');
  String hour = date.hour.toString().padLeft(2, '0');
  String minute = date.minute.toString().padLeft(2, '0');
  return '$year-$month-$day ( $hour:$minute )';
}