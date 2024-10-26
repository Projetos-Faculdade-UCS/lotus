import 'package:timeago/timeago.dart' as timeago;

/// Inicializa o pacote `timeago` com as mensagens em português.
void initTimeAgo() {
  timeago.setLocaleMessages('pt', timeago.PtBrMessages());
}
