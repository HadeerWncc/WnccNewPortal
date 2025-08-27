int parseToInt(String? value) {
  if (value == null || value.trim().isEmpty) return 0;

  final intVal = int.tryParse(value);
  if (intVal != null) return intVal;

  final doubleVal = double.tryParse(value);
  if (doubleVal != null) return doubleVal.toInt();

  return 0;
}