import 'package:flutter/widgets.dart';

class FFIcons {
  FFIcons._();

  static const String _messagesFamily = 'Messages';
  static const String _navBarFilledFamily = 'NavBarFilled';
  static const String _navBarFamily = 'NavBar';

  // Messages
  static const IconData kmessageFilled =
      IconData(0xe903, fontFamily: _messagesFamily);
  static const IconData kmessage =
      IconData(0xe904, fontFamily: _messagesFamily);

  // NavBar-Filled
  static const IconData kiconProfileFilled =
      IconData(0xe900, fontFamily: _navBarFilledFamily);
  static const IconData khome =
      IconData(0xe901, fontFamily: _navBarFilledFamily);
  static const IconData klovely =
      IconData(0xe902, fontFamily: _navBarFilledFamily);

  // NavBar
  static const IconData kprofile = IconData(0xe900, fontFamily: _navBarFamily);
  static const IconData klikes = IconData(0xe902, fontFamily: _navBarFamily);
}
