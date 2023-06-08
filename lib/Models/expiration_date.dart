class ExpirationDate {
  final int month;
  final int year;

  ExpirationDate({
    required this.month,
    required this.year,
  });

  factory ExpirationDate.fromMap(Map<String, dynamic> map) {
    return ExpirationDate(
        month: map['month'],
        year: map['year']
    );
  }
}