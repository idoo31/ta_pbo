import 'package:interact_cli/interact_cli.dart';
import 'koleksi.dart';
import 'lukisan.dart';
import 'patung.dart';
import 'fotografi.dart';

void updateKoleksi() {
  print('\n--- Update Karya Seni ---');
  if (daftarKoleksi.isEmpty) {
    print('Belum ada karya seni yang disimpan.');
    return;
  }

  for (int i = 0; i < daftarKoleksi.length; i++) {
    print('${i + 1}. ${daftarKoleksi[i].id} - ${daftarKoleksi[i].nama}');
  }

  String inputPilihan = Input(
    prompt: 'Pilih nomor karya yang ingin diupdate: ',
  ).interact();
  int? pilihan = int.tryParse(inputPilihan);

  if (pilihan != null && pilihan > 0 && pilihan <= daftarKoleksi.length) {
    Koleksi koleksi = daftarKoleksi[pilihan - 1];

    print('--- Mengupdate data umum (Kosongkan jika tidak ingin diubah) ---');
    // Update data umum
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

    if (koleksi is Lukisan) {
      print('--- Mengupdate data spesifik Lukisan ---');
      koleksi.pelukis = Input(
        prompt: 'Pelukis baru',
        defaultValue: koleksi.pelukis,
      ).interact();
    } else if (koleksi is Patung) {
      print('--- Mengupdate data spesifik Patung ---');
      koleksi.pematung = Input(
        prompt: 'Pematung baru',
        defaultValue: koleksi.pematung,
      ).interact();
    } else if (koleksi is Fotografi) {
      print('--- Mengupdate data spesifik Fotografi ---');
      koleksi.fotografer = Input(
        prompt: 'Fotografer baru',
        defaultValue: koleksi.fotografer,
      ).interact();
    }

    print('Karya seni berhasil diupdate!');
  } else {
    print('Nomor koleksi tidak valid.');
  }
}
