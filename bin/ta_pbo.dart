// stdin: Merupakan objek standar input di Dart, digunakan untuk menerima input dari pengguna melalui keyboard (biasanya di terminal/console).
// stdout: Merupakan objek standar output di Dart, digunakan untuk menampilkan output ke layar (terminal/console).
// readLineSync(): Merupakan metode dari stdin yang digunakan untuk membaca satu baris input dari pengguna secara sinkron (program akan menunggu sampai pengguna menekan Enter).
// parse: digunakan sebagai int.parse(). Fungsi ini mengubah (mengonversi) string menjadi tipe data integer.

import 'dart:io';
import 'package:ta_pbo/tambah_koleksi.dart';
import 'package:ta_pbo/lihat_koleksi.dart';
import 'package:ta_pbo/update_koleksi.dart';
import 'package:ta_pbo/hapus_koleksi.dart';

void main() {
  while (true) {
    print('\n--- Sistem Manajemen Barang Koleksi Museum ---');
    print('1. Tambah Koleksi');
    print('2. Lihat Koleksi');
    print('3. Update Koleksi');
    print('4. Hapus Koleksi');
    print('5. Keluar');
    stdout.write('Pilih menu: ');
    String? pilihan = stdin.readLineSync();

    switch (pilihan) {
      case '1':
        tambahKoleksi();
        break;
      case '2':
        lihatKoleksi();
        break;
      case '3':
        updateKoleksi();
        break;
      case '4':
        hapusKoleksi();
        break;
      case '5':
        print('Terima kasih telah menggunakan sistem!');
        return;
      default:
        print('Pilihan tidak valid.');
    }
  }
}
