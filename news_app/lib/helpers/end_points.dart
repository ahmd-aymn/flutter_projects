abstract class EndPoints {
  static const String general = 'https://newsdata.io/api/1/latest?apikey=pub_09620611e4354f2cab8c404795315f22&country=eg&';
  static const String business = '${general}category=business';
  static const String sports = '${general}category=sports';
  static const String science = '${general}category=science';
  static const String technology = '${general}category=technology';
  static const String entertainment = '${general}category=entertainment';
  static const String health = '${general}category=health';
}
