// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "arError": MessageLookupByLibrary.simpleMessage(
            "Something went wrong. Try again"),
        "ceilingFurniture":
            MessageLookupByLibrary.simpleMessage("Ceiling furniture"),
        "emptyPageMessage":
            MessageLookupByLibrary.simpleMessage("There\'s nothing here yet"),
        "favourites": MessageLookupByLibrary.simpleMessage("Favourites"),
        "floorFurniture":
            MessageLookupByLibrary.simpleMessage("Floor furniture"),
        "permissionPromptButtonText":
            MessageLookupByLibrary.simpleMessage("Grant Permission"),
        "permissionPromptDescription": MessageLookupByLibrary.simpleMessage(
            "Camera permission must be given to the app for AR functions to work"),
        "permissionPromptParentalRestriction": MessageLookupByLibrary.simpleMessage(
            "Camera permission is restricted by the OS, please check parental control settings"),
        "removeModel": MessageLookupByLibrary.simpleMessage("Remove model"),
        "showMore": MessageLookupByLibrary.simpleMessage("show more"),
        "view3dModel": MessageLookupByLibrary.simpleMessage("View 3D model"),
        "viewInAR": MessageLookupByLibrary.simpleMessage("View in AR"),
        "wallFurniture": MessageLookupByLibrary.simpleMessage("Wall furniture")
      };
}
