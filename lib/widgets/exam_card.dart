import 'package:flutter/material.dart';
import 'package:exam_app/models/exam.dart';
import 'package:exam_app/utils/time_utils.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  final VoidCallback onTap;

  const ExamCard({super.key, required this.exam, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final isPast = exam.isPast;
    final bgColor = isPast ? Colors.grey.shade100 : Colors.green.shade50;
    final borderColor = isPast ? Colors.grey.shade300 : Colors.green.shade200;

    return Card(
      elevation: 6,
      color: bgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: borderColor, width: 1),
      ),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        splashColor: Colors.greenAccent.withOpacity(0.14),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.blue.shade100,
                    child: Icon(Icons.menu_book, color: Colors.blue, size: 26),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      exam.subjectName,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Icon(Icons.chevron_right, size: 26, color: Colors.grey[500]),
                ],
              ),
              const SizedBox(height: 14),
              Divider(height: 12, thickness: 1, color: Colors.grey[300]),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.calendar_today, size: 18, color: Colors.green[800]),
                  const SizedBox(width: 6),
                  Text('${formatDate(exam.dateTime)}'),
                  const SizedBox(width: 14),
                  Icon(Icons.access_time, size: 18, color: Colors.teal[700]),
                  const SizedBox(width: 6),
                  Text('${formatTime(exam.dateTime)}'),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.location_on, size: 18, color: Colors.orange[700]),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      exam.rooms.join(', '),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                    decoration: BoxDecoration(
                        color: isPast ? Colors.grey.shade300 : Colors.green.shade200,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            offset: Offset(1, 2),
                          )
                        ]
                    ),
                    child: Text(
                      isPast
                          ? 'Завршен'
                          : 'Преостанато: ${timeLeftReadable(exam.dateTime)}',
                      style: TextStyle(
                        fontSize: 13,
                        color: isPast ? Colors.grey[700] : Colors.green[900],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

