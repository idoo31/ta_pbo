import 'package:interact_cli/interact_cli.dart';
import 'koleksi.dart';

void hapusKoleksi() {
  print('\n--- Hapus Koleksi ---');
  if (daftarKoleksi.isEmpty) {
    print('Belum ada koleksi yang disimpan.');
    return;
  }
  for (int i = 0; i < daftarKoleksi.length; i++) {
    print('${i + 1}. ${daftarKoleksi[i].id} - ${daftarKoleksi[i].nama}');
  }

  String inputPilihan = Input(
    prompt: 'Pilih nomor koleksi yang ingin dihapus: ',
  ).interact();
  int? pilihan = int.tryParse(inputPilihan);

  if (pilihan != null && pilihan > 0 && pilihan <= daftarKoleksi.length) {
    String nama = daftarKoleksi[pilihan - 1].nama;
    daftarKoleksi.removeAt(pilihan - 1);
    print('Koleksi "$nama" berhasil dihapus!');
  } else {
    print('Nomor koleksi tidak valid.');
  }
}
