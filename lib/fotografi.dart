import 'koleksi.dart';

// Fotografi adalah "anak" dari Koleksi
class Fotografi extends Koleksi {
  
  // Properti unik untuk Fotografi
  String _fotografer;
  String _jenisCetak; // cth: Digital Print, Silver Gelatin

  // Constructor
  Fotografi(
    String id, 
    String nama, 
    String deskripsi, 
    int tahun,
    this._fotografer,  // Parameter unik
    this._jenisCetak  // Parameter unik
  ) : super(id, nama, deskripsi, tahun); // 'super' memanggil constructor Koleksi

  // Getter dan Setter unik
  String get fotografer => _fotografer;
  set fotografer(String fotografer) => _fotografer = fotografer;
  
  String get jenisCetak => _jenisCetak;
  set jenisCetak(String jenis) => _jenisCetak = jenis;
}