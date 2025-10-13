import 'dart:io';
import 'koleksi.dart';

void updateKoleksi() {
  print('\n--- Update Koleksi ---');
  if (daftarKoleksi.isEmpty) {
    print('Belum ada koleksi yang disimpan.');
    return;
  }
  for (int i = 0; i < daftarKoleksi.length; i++) {
    print('${i + 1}. ${daftarKoleksi[i].nama}');
  }
  stdout.write('Pilih nomor koleksi yang ingin diupdate: ');
  int pilihan = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
  if (pilihan > 0 && pilihan <= daftarKoleksi.length) {
    Koleksi koleksi = daftarKoleksi[pilihan - 1];
    stdout.write('Nama baru (${koleksi.nama}): ');
    String namaBaru = stdin.readLineSync()!;
    if (namaBaru.isNotEmpty) koleksi.nama = namaBaru;
    stdout.write('Deskripsi baru (${koleksi.deskripsi}): ');
    String deskripsiBaru = stdin.readLineSync()!;
    if (deskripsiBaru.isNotEmpty) koleksi.deskripsi = deskripsiBaru;
    stdout.write('Tahun baru (${koleksi.tahun}): ');
    String tahunBaru = stdin.readLineSync()!;
    if (tahunBaru.isNotEmpty)
      koleksi.tahun = int.tryParse(tahunBaru) ?? koleksi.tahun;
    print('Koleksi berhasil diupdate!');
  } else {
    print('Nomor koleksi tidak valid.');
  }
}
