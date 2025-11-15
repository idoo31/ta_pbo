import 'package:interact_cli/interact_cli.dart';
import 'koleksi.dart';
import 'lukisan.dart';
import 'patung.dart';
import 'fotografi.dart';

void tambahKoleksi() {
  int jenis = Select(
    prompt: "Pilih Jenis Koleksi Seni:",
    options: ['Koleksi Umum', 'Lukisan', 'Patung', 'Fotografi'],
  ).interact();

  String id;
  bool isIdValid = false;
  do {
    id = Input(prompt: "Masukkan ID koleksi: ").interact();
    bool idExists = daftarKoleksi.any((koleksi) => koleksi.id == id);
    if (idExists) {
      print('ID "$id" sudah digunakan. Silakan masukkan ID yang berbeda.');
    } else {
      isIdValid = true;
    }
  } while (!isIdValid);

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

  Koleksi koleksiBaru;

  switch (jenis) {
    case 1: // Lukisan
      String pelukis = Input(prompt: 'Masukkan Nama Pelukis: ').interact();
      // Buat objek Lukisan
      koleksiBaru = Lukisan(id, nama, deskripsi, tahun, pelukis);
      break;
    case 2: // Patung
      String pematung = Input(
        prompt: 'Masukkan Nama Pembuat Patung: ',
      ).interact();
      koleksiBaru = Patung(id, nama, deskripsi, tahun, pematung);
      break;
    case 3: // Fotografi
      String fotografer = Input(
        prompt: 'Masukkan Nama Fotografer: ',
      ).interact();
      koleksiBaru = Fotografi(id, nama, deskripsi, tahun, fotografer);
      break;
    default: // 0: Koleksi Umum
      koleksiBaru = Koleksi(id, nama, deskripsi, tahun);
      break;
  }

  daftarKoleksi.add(koleksiBaru);
  print('Karya "$nama" berhasil ditambahkan!');
}
