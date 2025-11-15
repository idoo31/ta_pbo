import 'koleksi.dart';

// Patung adalah "anak" dari Koleksi
class Patung extends Koleksi {
  
  // Properti unik untuk Patung
  String _pematung;
  String _bahan; // cth: Marmer, Perunggu

  // Constructor
  Patung(
    String id, 
    String nama, 
    String deskripsi, 
    int tahun,
    this._pematung, // Parameter unik
    this._bahan     // Parameter unik
  ) : super(id, nama, deskripsi, tahun); // 'super' memanggil constructor Koleksi

  // Getter dan Setter unik
  String get pematung => _pematung;
  set pematung(String pematung) => _pematung = pematung;
  
  String get bahan => _bahan;
  set bahan(String bahan) => _bahan = bahan;
}