import 'dart:io';
import 'koleksi.dart';

void tambahKoleksi() {
  stdout.write('Masukkan Nama Koleksi: ');
  String nama = stdin.readLineSync()!;
  stdout.write('Masukkan Deskripsi Koleksi: ');
  String deskripsi = stdin.readLineSync()!;
  stdout.write('Masukkan Tahun Koleksi: ');
  // Menggunakan int.tryParse untuk penanganan error yang lebih baik
  int? tahun = int.tryParse(stdin.readLineSync() ?? '');
  // Validasi input tahun
  if (tahun == null || tahun <= 0) {
    print('Tahun tidak valid. Gagal menambahkan koleksi.');
    return;
  }
  Koleksi koleksiBaru = Koleksi(nama, deskripsi, tahun);
  daftarKoleksi.add(koleksiBaru);
  print('Koleksi "$nama" berhasil ditambahkan!');
}
