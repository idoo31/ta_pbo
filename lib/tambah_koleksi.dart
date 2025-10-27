import 'dart:io';
import 'koleksi.dart';

void tambahKoleksi() {
  String id;
  bool isIdValid = false;

  // Loop sampai mendapatkan ID yang valid dan unik
  do {
    stdout.write("Masukkan ID koleksi: ");
    id = stdin.readLineSync()!;

    // Cek apakah ID sudah ada
    bool idExists = daftarKoleksi.any((koleksi) => koleksi.id == id);

    if (idExists) {
      print('ID "$id" sudah digunakan. Silakan masukkan ID yang berbeda.');
    } else {
      isIdValid = true;
    }
  } while (!isIdValid);

  stdout.write('Masukkan Nama Koleksi: ');
  String nama = stdin.readLineSync()!;
  stdout.write('Masukkan Deskripsi Koleksi: ');
  String deskripsi = stdin.readLineSync()!;
  stdout.write('Masukkan Tahun Koleksi: ');

  int? tahun = int.tryParse(stdin.readLineSync() ?? '');
  if (tahun == null || tahun <= 0) {
    print('Tahun tidak valid. Gagal menambahkan koleksi.');
    return;
  }

  Koleksi koleksiBaru = Koleksi(id, nama, deskripsi, tahun);
  daftarKoleksi.add(koleksiBaru);
  print('Koleksi "$nama" berhasil ditambahkan!');
}
