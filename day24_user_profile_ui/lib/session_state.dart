import 'package:flutter/foundation.dart';

import 'models/User.dart';

abstract class SessionState {}

class UnknownSessionState extends SessionState {}

class Unauthenticated extends SessionState {}

class Authenticated extends SessionState {
  final User user;

  Authenticated({@required this.user});
}
