import 'package:get/get.dart';

class CalendarController extends GetxController {
  final DateTime _now = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  final DateTime _firstDate = DateTime(
    DateTime.now().year - 1,
    DateTime.now().month,
    DateTime.now().day,
  );

  final DateTime _lastDate = DateTime(
    DateTime.now().year + 1,
    DateTime.now().month,
    DateTime.now().day,
  );

  final Rx<DateTime> _selectedDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  ).obs;

  DateTime get now => _now;
  DateTime get firstDate => _firstDate;
  DateTime get lastDate => _lastDate;
  DateTime get selectedDate => _selectedDate.value;

  void onDateSelected(DateTime date) {
    _selectedDate.value = date;
  }
}
