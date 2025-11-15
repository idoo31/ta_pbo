import 'koleksi.dart';

class Fotografi extends Koleksi {
  String _fotografer;

  // Constructor
  Fotografi(
    String id,
    String nama,
    String deskripsi,
    int tahun,
    this._fotografer,
  ) : super(id, nama, deskripsi, tahun);

  // Getter dan Setter unik
  String get fotografer => _fotografer;
  set fotografer(String fotografer) => _fotografer = fotografer;
}
