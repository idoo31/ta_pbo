class Koleksi {
  // Properti dibuat private untuk menyembunyikan data langsung
  String _nama;
  String _deskripsi;
  int _tahun;
  // Constructor
  Koleksi(this._nama, this._deskripsi, this._tahun);
  // --- GETTER ---
  // Metode publik untuk mengakses (membaca) data private
  String get nama => _nama;
  String get deskripsi => _deskripsi;
  int get tahun => _tahun;
  // --- SETTER ---
  // Metode publik untuk mengubah data dengan validasi
  set nama(String namaBaru) {
    if (namaBaru.isNotEmpty) {
      _nama = namaBaru;
    }
  }
  set deskripsi(String deskripsiBaru) {
    _deskripsi = deskripsiBaru;
  }
  set tahun(int tahunBaru) {
    // Menambahkan validasi agar tahun tidak negatif
    if (tahunBaru > 0) {
      _tahun = tahunBaru;
    }
  }
}
// List untuk menyimpan semua objek koleksi
List<Koleksi> daftarKoleksi = [];
