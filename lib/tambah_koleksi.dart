import 'package:interact_cli/interact_cli.dart';
import 'koleksi.dart';
import 'lukisan.dart';     // <-- Impor file baru
import 'patung.dart';       // <-- Impor file baru
import 'fotografi.dart';  // <-- Impor file baru

void tambahKoleksi() {
  // Tanya jenis koleksi
  int jenis = Select(
    prompt: "Pilih Jenis Koleksi Seni:",
    options: ['Koleksi Umum', 'Lukisan', 'Patung', 'Fotografi'],
  ).interact();

  String id;
  bool isIdValid = false;
  // Loop validasi ID (sama seperti sebelumnya)
  do {
    id = Input(prompt: "Masukkan ID koleksi: ").interact();
    bool idExists = daftarKoleksi.any((koleksi) => koleksi.id == id);
    if (idExists) {
      print('ID "$id" sudah digunakan. Silakan masukkan ID yang berbeda.');
    } else {
      isIdValid = true;
    }
  } while (!isIdValid);

  // Data umum (dimiliki semua koleksi)
  String nama = Input(prompt: 'Masukkan Nama Karya: ').interact();
  String deskripsi = Input(prompt: 'Masukkan Deskripsi Karya: ').interact();
  int? tahun;
  do {
    String inputTahun = Input(prompt: 'Masukkan Tahun Pembuatan: ').interact();
    tahun = int.tryParse(inputTahun);
    if (tahun == null || tahun <= 0) {
      print('Tahun tidak valid. Masukkan angka yang benar (lebih dari 0).');
    }
  } while (tahun == null || tahun <= 0);

  Koleksi koleksiBaru; // Deklarasikan variabel untuk menampung objek baru

  // Tanya data spesifik berdasarkan jenis
  switch (jenis) {
    case 1: // Lukisan
      String pelukis = Input(prompt: 'Masukkan Nama Pelukis: ').interact();
      String media = Input(prompt: 'Masukkan Media Lukisan (cth: Cat minyak di kanvas): ').interact();
      // Buat objek Lukisan
      koleksiBaru = Lukisan(id, nama, deskripsi, tahun, pelukis, media);
      break;
    case 2: // Patung
      String pematung = Input(prompt: 'Masukkan Nama Pematung: ').interact();
      String bahan = Input(prompt: 'Masukkan Bahan Patung (cth: Marmer): ').interact();
      // Buat objek Patung
      koleksiBaru = Patung(id, nama, deskripsi, tahun, pematung, bahan);
      break;
    case 3: // Fotografi
      String fotografer = Input(prompt: 'Masukkan Nama Fotografer: ').interact();
      String jenisCetak = Input(prompt: 'Masukkan Jenis Cetak (cth: Digital Print): ').interact();
      // Buat objek Fotografi
      koleksiBaru = Fotografi(id, nama, deskripsi, tahun, fotografer, jenisCetak);
      break;
    default: // 0: Koleksi Umum
      // Buat objek Koleksi biasa
      koleksiBaru = Koleksi(id, nama, deskripsi, tahun);
      break;
  }

  // Tambahkan objek baru ke daftar (polimorfisme)
  daftarKoleksi.add(koleksiBaru);
  print('Karya "$nama" berhasil ditambahkan!');
}