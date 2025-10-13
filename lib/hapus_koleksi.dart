import 'dart:io';
import 'koleksi.dart';

void hapusKoleksi() {
  print('\n--- Hapus Koleksi ---');
  if (daftarKoleksi.isEmpty) {
    print('Belum ada koleksi yang disimpan.');
    return;
  }
  for (int i = 0; i < daftarKoleksi.length; i++) {
    print('${i + 1}. ${daftarKoleksi[i].nama}');
  }
  stdout.write('Pilih nomor koleksi yang ingin dihapus: ');
  int pilihan = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
  if (pilihan > 0 && pilihan <= daftarKoleksi.length) {
    String nama = daftarKoleksi[pilihan - 1].nama;
    daftarKoleksi.removeAt(pilihan - 1);
    print('Koleksi "$nama" berhasil dihapus!');
  } else {
    print('Nomor koleksi tidak valid.');
  }
}
