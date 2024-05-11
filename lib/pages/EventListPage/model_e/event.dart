class Event {
  String? image;
  String? image1;
  String? image2;
  String title;
  String info;
  String status;
  int view;

  Event(
      {this.image, this.image1, this.image2,
      required this.title,
      required this.info,
      required this.status,
      required this.view});

  Map<String, dynamic> toJson() => {
        'image': image,
        'title': title,
        'info': info,
        'status': status,
        'view': view,
        'image1': image1,
        'image2': image2,
      };

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      image: json['image'] ?? "assets/pic/unva.jpeg",
      title: json['title'] ?? "",
      info: json['info'] ?? "",
      status: json['status'] ?? "",
      view: json['view'] ?? "",
      image1: json['image1'] ?? "assets/pic/unva.jpeg",
      image2: json['image2'] ?? "assets/pic/unva.jpeg",
    );
  }
}
