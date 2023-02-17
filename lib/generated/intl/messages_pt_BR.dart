// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pt_BR locale. All the
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
  String get localeName => 'pt_BR';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "celestialBodyPageAppBarTitle":
            MessageLookupByLibrary.simpleMessage("Corpos Celestes"),
        "celestialBodyPagePickBody":
            MessageLookupByLibrary.simpleMessage("Selecione um corpo celeste:"),
        "celestialBodyPagePickBodyDistance":
            MessageLookupByLibrary.simpleMessage("Distância da Terra (Km): "),
        "celestialBodyPagePickBodyPosition":
            MessageLookupByLibrary.simpleMessage("Posição (graus): "),
        "emptyList":
            MessageLookupByLibrary.simpleMessage("Nenhum corpo disponível!"),
        "failedConnection":
            MessageLookupByLibrary.simpleMessage("Falha de conexão!"),
        "genericError":
            MessageLookupByLibrary.simpleMessage("Ocorreu um erro!"),
        "moonPhaseImageListPageAppBarTitle":
            MessageLookupByLibrary.simpleMessage("Favoritos"),
        "moonPhaseImageListPageEmpty": MessageLookupByLibrary.simpleMessage(
            "Nenhuma imagem salva nos favoritos"),
        "moonPhasePageAppBarTitle":
            MessageLookupByLibrary.simpleMessage("Observador App"),
        "moonPhasePagePickDate":
            MessageLookupByLibrary.simpleMessage("Selecione uma data:"),
        "positionError": MessageLookupByLibrary.simpleMessage(
            "Falha na permissão de acesso à localização"),
        "starChartPageAppBarTitle":
            MessageLookupByLibrary.simpleMessage("Constelações"),
        "starChatPagePickConstellation":
            MessageLookupByLibrary.simpleMessage("Selecione uma constelação"),
        "tryAgain": MessageLookupByLibrary.simpleMessage("Tente Novamente")
      };
}
