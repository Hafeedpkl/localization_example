import 'package:flutter/material.dart';
import 'package:localization_example/classes/language_constant.dart';
import 'package:localization_example/main.dart';
import 'package:table_calendar/table_calendar.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TableCalendar(
            locale: localeGet(),
            focusedDay: DateTime.now(),
            firstDay: DateTime.utc(2022, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14)));
  }
}
