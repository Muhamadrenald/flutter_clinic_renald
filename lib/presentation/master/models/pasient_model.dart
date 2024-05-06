import '../../../core/core.dart';
import 'pasient_status.dart';

class PasientModel {
  final String nama;
  final String keluhan;
  final String jenisKelamin;
  final DateTime tanggalLahir;
  final DateTime? tanggalRawatJalan;
  final String nik;
  final PasientStatus status;
  final String? kelugan;

  PasientModel({
    required this.nama,
    required this.keluhan,
    required this.jenisKelamin,
    required this.tanggalLahir,
    this.tanggalRawatJalan,
    required this.nik,
    required this.status,
    this.kelugan,
  });

  String get tanggalLahirFormatted => tanggalLahir.toFormattedDate();
  String? get tanggalRawatJalanFormatted =>
      tanggalRawatJalan?.toFormattedDate();
  String get kategoriUmur {
    DateTime now = DateTime.now();
    Duration difference = now.difference(tanggalLahir);
    int days = difference.inDays;

    // Kategori umur
    if (days < 365) {
      return 'Balita';
    } else if (days < 6570) {
      // Kurang dari 18 tahun (18 tahun x 365 hari)
      return 'Anak-anak';
    } else if (days < 23725) {
      // Kurang dari 65 tahun (65 tahun x 365 hari)
      return 'Dewasa';
    } else {
      return 'Lansia';
    }
  }
}
