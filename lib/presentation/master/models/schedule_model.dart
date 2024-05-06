class ScheduleModel {
  final String namaDokter;
  final String ahli;
  final List<String> senin;
  final List<String> selasa;
  final List<String> rabu;
  final List<String> kamis;
  final List<String> jumat;
  final List<String> sabtu;

  ScheduleModel({
    required this.namaDokter,
    required this.ahli,
    required this.senin,
    required this.selasa,
    required this.rabu,
    required this.kamis,
    required this.jumat,
    required this.sabtu,
  });
}
