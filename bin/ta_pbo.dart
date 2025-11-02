import 'package:dart_console/dart_console.dart';
import 'package:interact_cli/interact_cli.dart';
import 'package:ta_pbo/tambah_koleksi.dart';
import 'package:ta_pbo/lihat_koleksi.dart';
import 'package:ta_pbo/update_koleksi.dart';
import 'package:ta_pbo/hapus_koleksi.dart';

final Console console = Console();
void main() {
  console.clearScreen();
  console.setTextStyle(bold: true);
  console.setForegroundColor(ConsoleColor.yellow);
  console.writeLine(
    'Sistem Manajemen Barang Koleksi Museum',
    TextAlignment.center,
  );
  while (true) {
    console.setTextStyle(bold: true);
    console.setForegroundColor(ConsoleColor.brightBlue);

    int pilihan = Select(
      prompt: "Pilih Menu",
      options: [
        '1. Tambah Koleksi',
        '2. Lihat Koleksi',
        '3. Update Koleksi',
        '4. Hapus Koleksi',
        '5. Keluar',
      ],
    ).interact();
    switch (pilihan) {
      case 0:
        tambahKoleksi();
        break;
      case 1:
        lihatKoleksi();
        break;
      case 2:
        updateKoleksi();
        break;
      case 3:
        hapusKoleksi();
        break;
      case 4:
        print('Terima kasih telah menggunakan sistem!');
        return;
      default:
        print('Pilihan tidak valid.');
    }
  }
}
