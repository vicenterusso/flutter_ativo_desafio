class QuoteEntity {
  QuoteEntity({
    this.date,
    this.open,
    this.high,
    this.low,
    this.close,
  });

  DateTime? date;
  double? open;
  double? high;
  double? low;
  double? close;

  factory QuoteEntity.fromJson(Map<String, dynamic> json) {
    return QuoteEntity(
      date: json["date"],
      open: json["open"],
      high: json["high"],
      low: json["low"],
      close: json["close"],
    );
  }

  Map<String, dynamic> toJson() => {
        "date": date.toString(),
        "open": open,
        "high": high,
        "low": low,
        "close": close,
      };
}
