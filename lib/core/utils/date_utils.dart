
import 'package:intl/intl.dart';

String formatDateTime(DateTime dateTime) {
  final formattedDate = DateFormat.yMMMd('en_US').format(dateTime);
  return formattedDate;
}
