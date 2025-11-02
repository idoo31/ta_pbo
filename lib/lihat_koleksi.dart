import 'package:interact_cli/interact_cli.dart';
import 'koleksi.dart';

void lihatKoleksi() {
  print('\n--- Daftar Koleksi Museum ---');
  if (daftarKoleksi.isEmpty) {
    print('Belum ada koleksi yang disimpan.');
    return;
  }

  for (int i = 0; i < daftarKoleksi.length; i++) {
    print('${i + 1}. ${daftarKoleksi[i].id} - ${daftarKoleksi[i].nama}');
  }

  String input = Input(
    prompt:
        '\nPilih nomor koleksi untuk melihat detailnya (atau tekan Enter untuk kembali): ',
  ).interact();

  if (input.isEmpty) return;
  int? pilihan = int.tryParse(input);

  if (pilihan != null && pilihan > 0 && pilihan <= daftarKoleksi.length) {
    Koleksi koleksi = daftarKoleksi[pilihan - 1];
    print('\n--- Detail Koleksi: ${koleksi.nama} ---');
    print("ID: ${koleksi.id}");
    print('Deskripsi: ${koleksi.deskripsi}');
    print('Tahun: ${koleksi.tahun}');
  } else {
    print('Nomor koleksi tidak valid.');
  }
}
