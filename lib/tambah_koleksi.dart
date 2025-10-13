import 'dart:io';
import 'koleksi.dart';

void tambahKoleksi() {
  stdout.write('Masukkan Nama Koleksi: ');
  String nama = stdin.readLineSync()!;
  stdout.write('Masukkan Deskripsi Koleksi: ');
  String deskripsi = stdin.readLineSync()!;
  stdout.write('Masukkan Tahun Koleksi: ');
  int tahun = int.parse(stdin.readLineSync()!);

  Koleksi koleksiBaru = Koleksi(nama, deskripsi, tahun);
  daftarKoleksi.add(koleksiBaru);
  print('Koleksi "$nama" berhasil ditambahkan!');
}
