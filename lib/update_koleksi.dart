import 'package:interact_cli/interact_cli.dart'; 
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

  String inputPilihan = Input(
    prompt: 'Pilih nomor koleksi yang ingin diupdate: ',
  ).interact();
  int? pilihan = int.tryParse(inputPilihan);

  if (pilihan != null && pilihan > 0 && pilihan <= daftarKoleksi.length) {
    Koleksi koleksi = daftarKoleksi[pilihan - 1];

    String idBaru = Input(
      prompt: 'ID baru',
      defaultValue: koleksi.id,
    ).interact();
    if (idBaru.isNotEmpty) koleksi.id = idBaru;

    String namaBaru = Input(
      prompt: 'Nama baru',
      defaultValue: koleksi.nama,
    ).interact();
    if (namaBaru.isNotEmpty) koleksi.nama = namaBaru;

    String deskripsiBaru = Input(
      prompt: 'Deskripsi baru',
      defaultValue: koleksi.deskripsi,
    ).interact();
    if (deskripsiBaru.isNotEmpty) koleksi.deskripsi = deskripsiBaru;

    String inputTahunBaru = Input(
      prompt: 'Tahun baru',
      defaultValue: koleksi.tahun.toString(),
    ).interact();

    if (inputTahunBaru.isNotEmpty) {
      int? tahunBaru = int.tryParse(inputTahunBaru);
      if (tahunBaru != null && tahunBaru > 0) {
        koleksi.tahun = tahunBaru;
      }
    }

    print('Koleksi berhasil diupdate!');
  } else {
    print('Nomor koleksi tidak valid.');
  }
}
