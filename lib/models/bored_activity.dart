
///This is the model class of Bored API activity. This is contains [toMap] and [fromMap] methods too.
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

  ///Sometimes an integer-double value can be fetched. double.parse() used for avoid the data type errors.
  factory BoredActivity.fromMap({required Map<String, dynamic> map}) {
    return BoredActivity(
        activity: map['activity'],
        type: map['type'],
        participants: map['participants'],
        price: double.parse(map['price'].toString()),
        link: map['link'],
        key: map['key'],
        accessibility: double.parse(map['accessibility'].toString()));
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
