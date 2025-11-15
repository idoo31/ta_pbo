import 'koleksi.dart';

// Lukisan adalah "anak" dari Koleksi
class Lukisan extends Koleksi {
  
  // Properti unik untuk Lukisan
  String _pelukis;
  String _media; // cth: Cat minyak di kanvas

  // Constructor
  Lukisan(
    String id, 
    String nama, 
    String deskripsi, 
    int tahun,
    this._pelukis, // Parameter unik
    this._media     // Parameter unik
  ) : super(id, nama, deskripsi, tahun); // 'super' memanggil constructor Koleksi

  // Getter dan Setter unik
  String get pelukis => _pelukis;
  set pelukis(String pelukis) => _pelukis = pelukis;
  
  String get media => _media;
  set media(String media) => _media = media;
}