class Ticket {
  String type;
  String name;
  String date;
  String seat;

  Ticket(
      {required this.type,
      required this.name,
      required this.date,
      required this.seat});

  Map<String, dynamic> toJson() =>
      {'type': type, 'name': name, 'date': date, 'seat': seat};

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
        type: json['type'],
        name: json['name'],
        date: json['date'],
        seat: json['seat']);
  }
}
