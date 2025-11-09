import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:exam_app/models/exam.dart';
import 'package:exam_app/utils/time_utils.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;
  const ExamDetailScreen({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final isPast = exam.dateTime.isBefore(now);
    final formattedDate = DateFormat('dd.MM.yyyy').format(exam.dateTime);
    final formattedTime = DateFormat('HH:mm').format(exam.dateTime);
    final timeLeft =
    !isPast ? timeLeftReadable(exam.dateTime) : 'Испитот е завршен';

    final headerColor = Colors.blue[50];
    final titleColor = Colors.blue[800];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Детали за испит'),
        backgroundColor: Colors.blue[800],
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(22),
        children: [
          Container(
            decoration: BoxDecoration(
              color: headerColor,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.08),
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 22),
            margin: const EdgeInsets.only(bottom: 22),
            child: Row(
              children: [
                Icon(Icons.info_outline, color: titleColor, size: 28),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Детали за испитот',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        letterSpacing: 0.7,
                        color: Colors.blue[900]),
                  ),
                ),
              ],
            ),
          ),

          Card(
            elevation: 7,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: Colors.grey[50],
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.menu_book, color: Colors.blue[700], size: 24),
                      SizedBox(width: 9),
                      Expanded(
                        child: Text(
                          exam.subjectName,
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 18,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(Icons.calendar_today, color: Colors.green[800]),
                      SizedBox(width: 9),
                      Text('Датум: $formattedDate'),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.access_time, color: Colors.deepPurple[700]),
                      SizedBox(width: 9),
                      Text('Време: $formattedTime'),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.orange[700]),
                      SizedBox(width: 9),
                      Flexible(
                        child: Text(
                          'Простории: ${exam.rooms.join(', ')}',
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(Icons.timer, color: Colors.redAccent),
                      SizedBox(width: 9),
                      Flexible(
                        child: Text(
                          'Преостанато време: $timeLeft',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: isPast
                                  ? Colors.grey
                                  : Colors.red[800]),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}




