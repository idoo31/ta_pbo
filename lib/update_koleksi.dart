import 'dart:io';
import 'koleksi.dart';

void updateKoleksi() {
  print('\n--- Update Koleksi ---');
  if (daftarKoleksi.isEmpty) {
    print('Belum ada koleksi yang disimpan.');
    return;
  }

  for (int i = 0; i < daftarKoleksi.length; i++) {
    print('${i + 1}. ${daftarKoleksi[i].id} - ${daftarKoleksi[i].nama}');
  }

  stdout.write('Pilih nomor koleksi yang ingin diupdate: ');
  int? pilihan = int.tryParse(stdin.readLineSync() ?? '');

  if (pilihan != null && pilihan > 0 && pilihan <= daftarKoleksi.length) {
    Koleksi koleksi = daftarKoleksi[pilihan - 1];

    stdout.write('ID baru (${koleksi.id}): ');
    String idBaru = stdin.readLineSync()!;
    if (idBaru.isNotEmpty) koleksi.id = idBaru;

    stdout.write('Nama baru (${koleksi.nama}): ');
    String namaBaru = stdin.readLineSync()!;
    if (namaBaru.isNotEmpty) koleksi.nama = namaBaru;

    stdout.write('Deskripsi baru (${koleksi.deskripsi}): ');
    String deskripsiBaru = stdin.readLineSync()!;
    if (deskripsiBaru.isNotEmpty) koleksi.deskripsi = deskripsiBaru;

    stdout.write('Tahun baru (${koleksi.tahun}): ');
    String inputTahunBaru = stdin.readLineSync()!;
    if (inputTahunBaru.isNotEmpty) {
      int? tahunBaru = int.tryParse(inputTahunBaru);
      if (tahunBaru != null) {
        koleksi.tahun = tahunBaru;
      }
    }

    print('Koleksi berhasil diupdate!');
  } else {
    print('Nomor koleksi tidak valid.');
  }
}
