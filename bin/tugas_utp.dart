// stdin: Merupakan objek standar input di Dart, digunakan untuk menerima input dari pengguna melalui keyboard (biasanya di terminal/console).
// stdout: Merupakan objek standar output di Dart, digunakan untuk menampilkan output ke layar (terminal/console).
// readLineSync(): Merupakan metode dari stdin yang digunakan untuk membaca satu baris input dari pengguna secara sinkron (program akan menunggu sampai pengguna menekan Enter).
// parse: digunakan sebagai int.parse(). Fungsi ini mengubah (mengonversi) string menjadi tipe data integer.

import 'dart:io';

class Koleksi {
  String nama;
  String deskripsi;
  int tahun;

  Koleksi(this.nama, this.deskripsi, this.tahun);
}

List<Koleksi> daftarKoleksi = [];

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

void lihatKoleksi() {
  print('\n--- Daftar Koleksi Museum ---');
  if (daftarKoleksi.isEmpty) {
    print('Belum ada koleksi yang disimpan.');
    return;
  }

  for (int i = 0; i < daftarKoleksi.length; i++) {
    print('${i + 1}. ${daftarKoleksi[i].nama}');
  }

  stdout.write('\nPilih nomor koleksi untuk melihat detailnya (atau tekan Enter untuk kembali): ');
  String? input = stdin.readLineSync();
  if (input == null || input.isEmpty) return;
  int pilihan = int.tryParse(input) ?? 0;

  if (pilihan > 0 && pilihan <= daftarKoleksi.length) {
    Koleksi koleksi = daftarKoleksi[pilihan - 1];
    print('\n--- Detail Koleksi: ${koleksi.nama} ---');
    print('Deskripsi: ${koleksi.deskripsi}');
    print('Tahun: ${koleksi.tahun}');
  } else {
    print('Nomor koleksi tidak valid.');
  }
}

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
    if (tahunBaru.isNotEmpty) koleksi.tahun = int.tryParse(tahunBaru) ?? koleksi.tahun;
    print('Koleksi berhasil diupdate!');
  } else {
    print('Nomor koleksi tidak valid.');
  }
}

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