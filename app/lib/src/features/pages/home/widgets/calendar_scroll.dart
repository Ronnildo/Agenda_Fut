import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

class ScrollCalendar extends StatefulWidget {
  final EasyInfiniteDateTimelineController timelineController;
  final DateTime focusDate;
  final void Function() focusChange;
  const ScrollCalendar({
    super.key,
    required this.timelineController,
    required this.focusDate,
    required this.focusChange,
  });
  @override
  State<ScrollCalendar> createState() => _ScrollCalendarState();
}

class _ScrollCalendarState extends State<ScrollCalendar> {
  DateTime? date;
  @override
  Widget build(BuildContext context) {
    return EasyInfiniteDateTimeLine(
      controller: widget.timelineController,
      firstDate: DateTime.now(),
      focusDate: widget.focusDate,
      lastDate: DateTime(2102),
      onDateChange: (_) => widget.focusChange,
      locale: 'pt',
      activeColor: const Color(0xFF03045E),
      dayProps: EasyDayProps(
        width: 60,
        height: 80,
        dayStructure: DayStructure.dayNumDayStr,
        todayHighlightColor: const Color(0xFF03045E).withValues(alpha: 0.5),
        todayHighlightStyle: TodayHighlightStyle.withBackground,
        todayStyle: const DayStyle(
          dayNumStyle: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
          dayStrStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        inactiveDayStyle: const DayStyle(
          dayStrStyle: TextStyle(
            color: Colors.blueAccent,
          ),
        ),
        activeDayStyle: const DayStyle(
          dayStrStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        borderColor: Colors.black,
      ),
    );
  }
}
