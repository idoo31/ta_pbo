import 'package:interact_cli/interact_cli.dart';
import 'koleksi.dart';

void tambahKoleksi() {
  String id;
  bool isIdValid = false;

  // Loop sampai mendapatkan ID yang valid dan unik
  do {
    // Diubah
    id = Input(prompt: "Masukkan ID koleksi: ").interact();

    // Cek apakah ID sudah ada
    bool idExists = daftarKoleksi.any((koleksi) => koleksi.id == id);

    if (idExists) {
      print('ID "$id" sudah digunakan. Silakan masukkan ID yang berbeda.');
    } else {
      isIdValid = true;
    }
  } while (!isIdValid);

  String nama = Input(prompt: 'Masukkan Nama Koleksi: ').interact();
  String deskripsi = Input(prompt: 'Masukkan Deskripsi Koleksi: ').interact();

  int? tahun;
  do {
    String inputTahun = Input(prompt: 'Masukkan Tahun Koleksi: ').interact();
    tahun = int.tryParse(inputTahun);

    if (tahun == null || tahun <= 0) {
      print('Tahun tidak valid. Masukkan angka yang benar (lebih dari 0).');
    }
  } while (tahun == null || tahun <= 0);

  Koleksi koleksiBaru = Koleksi(id, nama, deskripsi, tahun);
  daftarKoleksi.add(koleksiBaru);
  print('Koleksi "$nama" berhasil ditambahkan!');
}
