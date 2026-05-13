import 'package:intl/intl.dart';

String formatNum(num num){
  return NumberFormat.decimalPattern()
              .format(num);
}
