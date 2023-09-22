class Manager {
  String? token;
  static final Manager _manager = Manager._internal();
  factory Manager() => _manager;
  Manager._internal();
}
