String formatDate(String timestamp) {
  DateTime parsedDate = DateTime.parse(timestamp);
  String formattedDate =
      '${parsedDate.month}/${parsedDate.day}/${parsedDate.year} ${parsedDate.hour}:${parsedDate.minute}:${parsedDate.second}';
  return formattedDate;
}
