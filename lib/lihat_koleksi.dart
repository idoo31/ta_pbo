import 'package:interact_cli/interact_cli.dart';
import 'koleksi.dart';
import 'lukisan.dart';
import 'patung.dart';
import 'fotografi.dart';

void lihatKoleksi() {
  print('\n--- Daftar Karya Seni Museum ---');
  if (daftarKoleksi.isEmpty) {
    print('Belum ada karya seni yang disimpan.');
    return;
  }
  for (int i = 0; i < daftarKoleksi.length; i++) {
    print('${i + 1}. ${daftarKoleksi[i].id} - ${daftarKoleksi[i].nama}');
  }

  String input = Input(
    prompt:
        '\nPilih nomor karya untuk melihat detailnya (atau tekan Enter untuk kembali): ',
  ).interact();

  if (input.isEmpty) return;
  int? pilihan = int.tryParse(input);

  if (pilihan != null && pilihan > 0 && pilihan <= daftarKoleksi.length) {
    Koleksi koleksi = daftarKoleksi[pilihan - 1]; // Ambil koleksi

    print('\n--- Detail Karya: ${koleksi.nama} ---');
    print("ID: ${koleksi.id}");
    print('Deskripsi: ${koleksi.deskripsi}');
    print('Tahun: ${koleksi.tahun}');

    if (koleksi is Lukisan) {
      print('Jenis Karya: Lukisan');
      print('Pelukis: ${koleksi.pelukis}');
    } else if (koleksi is Patung) {
      print('Jenis Karya: Patung');
      print('Pembuat Patung: ${koleksi.pematung}');
    } else if (koleksi is Fotografi) {
      print('Jenis Karya: Fotografi');
      print('Fotografer: ${koleksi.fotografer}');
    } else {
      print('Jenis Karya: Koleksi Umum');
    }
  } else {
    print('Nomor koleksi tidak valid.');
  }
}
