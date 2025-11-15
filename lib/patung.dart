import 'koleksi.dart';

class Patung extends Koleksi {
  String _pematung;

  // Constructor
  Patung(String id, String nama, String deskripsi, int tahun, this._pematung)
    : super(id, nama, deskripsi, tahun);

  // Getter dan Setter unik
  String get pematung => _pematung;
  set pematung(String pematung) => _pematung = pematung;
}
