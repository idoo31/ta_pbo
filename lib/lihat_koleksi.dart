import 'package:interact_cli/interact_cli.dart';
import 'koleksi.dart';
import 'lukisan.dart';     // <-- Impor file baru
import 'patung.dart';       // <-- Impor file baru
import 'fotografi.dart';  // <-- Impor file baru

void lihatKoleksi() {
  print('\n--- Daftar Karya Seni Museum ---');
  if (daftarKoleksi.isEmpty) {
    print('Belum ada karya seni yang disimpan.');
    return;
  }
  // Tampilan daftar tetap sama
  for (int i = 0; i < daftarKoleksi.length; i++) {
    print('${i + 1}. ${daftarKoleksi[i].id} - ${daftarKoleksi[i].nama}');
  }

  String input = Input(
    prompt:
        '\nPilih nomor karya untuk melihat detailnya (atau tekan Enter untuk kembali): ',
  ).interact();

  if (input.isEmpty) return;
  int? pilihan = int.tryParse(input);

  if (pilihan != null && pilihan > 0 && pilihan <= daftarKoleksi.length) {
    Koleksi koleksi = daftarKoleksi[pilihan - 1]; // Ambil koleksi

    // Tampilkan data umum
    print('\n--- Detail Karya: ${koleksi.nama} ---');
    print("ID: ${koleksi.id}");
    print('Deskripsi: ${koleksi.deskripsi}');
    print('Tahun: ${koleksi.tahun}');

    // --- Cek Tipe Spesifik (Polimorfisme) ---
    if (koleksi is Lukisan) {
      // Jika ini Lukisan, tampilkan properti lukisan
      print('Jenis Karya: Lukisan');
      print('Pelukis: ${koleksi.pelukis}');
      print('Media: ${koleksi.media}');
    } else if (koleksi is Patung) {
      // Jika ini Patung, tampilkan properti patung
      print('Jenis Karya: Patung');
      print('Pematung: ${koleksi.pematung}');
      print('Bahan: ${koleksi.bahan}');
    } else if (koleksi is Fotografi) {
      // Jika ini Fotografi, tampilkan properti fotografi
      print('Jenis Karya: Fotografi');
      print('Fotografer: ${koleksi.fotografer}');
      print('Jenis Cetak: ${koleksi.jenisCetak}');
    } else {
      print('Jenis Karya: Koleksi Umum');
    }

  } else {
    print('Nomor koleksi tidak valid.');
  }
}