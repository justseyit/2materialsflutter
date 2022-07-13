
//This is the model class of Bored API activity. This is contains toMap and fromMap methods too.
class BoredActivity {
  String activity;
  String type;
  int participants;
  double price;
  String link;
  String key;
  double accessibility;

  BoredActivity(
      {required this.activity,
      required this.type,
      required this.participants,
      required this.price,
      required this.link,
      required this.key,
      required this.accessibility});

  factory BoredActivity.fromMap({required Map<String, dynamic> map}) {
    return BoredActivity(
        activity: map['activity'],
        type: map['type'],
        participants: map['participants'],
        price: map['price'],
        link: map['link'],
        key: map['key'],
        accessibility: map['accessibility']);
  }

  Map<String, dynamic> toMap() {
    return {
      'activity': activity,
      'type': type,
      'participants': participants,
      'price': price,
      'link': link,
      'key': key,
      'accessibility': accessibility
    };
  }
}
