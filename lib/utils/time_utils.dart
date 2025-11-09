import 'package:intl/intl.dart';


String formatDate(DateTime dt) => DateFormat('dd.MM.yyyy').format(dt);
String formatTime(DateTime dt) => DateFormat('HH:mm').format(dt);


String timeLeftReadable(DateTime target) {
  final now = DateTime.now();
  Duration diff = target.difference(now);


  if (diff.isNegative) diff = now.difference(target);


  final days = diff.inDays;
  final hours = diff.inHours - days * 24;


  return '$days дена, $hours часа';
}