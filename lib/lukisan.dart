import 'koleksi.dart';

class Lukisan extends Koleksi {
  String _pelukis;

  // Constructor
  Lukisan(String id, String nama, String deskripsi, int tahun, this._pelukis)
    : super(id, nama, deskripsi, tahun);

  // Getter dan Setter unik
  String get pelukis => _pelukis;
  set pelukis(String pelukis) => _pelukis = pelukis;
}
