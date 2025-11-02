# The 12th Kit
The 12th player's kit.

### Author
- Name: Ahmad Faiq Fawwaz Abdussalam
- NPM: 2406397706
- Class: PBP C

---

## Tugas Individu 7 - PBP Ganjil 2025/2026

### Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.

Dalam Flutter, widget tree adalah struktur hierarki yang menyusun seluruh tampilan aplikasi, di mana setiap elemen UI seperti teks, tombol, layout, hingga halaman yang direpresentasikan sebagai widget yang saling bertumpuk dari atas ke bawah. Setiap widget memiliki hubungan parent–child, di mana parent membungkus dan mengatur child, seperti ukuran, posisi, dan tata letaknya, sementara child menentukan konten dan tampilannya sendiri. Dengan mekanisme ini, Flutter membangun UI secara deklaratif dan terstruktur, sehingga perubahan pada satu widget akan memengaruhi bagian tree di bawahnya.

### Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.

Dalam proyek ini, saya menggunakan berbagai widget Flutter seperti MaterialApp sebagai root aplikasi, Scaffold untuk kerangka halaman, serta AppBar untuk menampilkan judul di bagian atas. Tampilan utama dibangun dengan kombinasi Column, Row, Padding, SizedBox, dan GridView untuk mengatur layout konten. Informasi seperti NPM dan nama ditampilkan menggunakan Card, Container, dan Text, sementara menu utama menggunakan Material dan InkWell agar tombol memiliki efek ripple saat ditekan. Ikon ditampilkan dengan Icon, dan interaksi pengguna ditangani oleh SnackBar melalui ScaffoldMessenger. Semua ini bekerja bersama dalam widget tree untuk membentuk UI yang terstruktur dan responsif.

### Apa fungsi dari widget `MaterialApp`? Jelaskan mengapa widget ini sering digunakan sebagai widget root.

MaterialApp adalah widget utama yang menyediakan fondasi aplikasi berbasis Material Design di Flutter. Widget ini mengatur banyak hal penting seperti tema (color scheme, typography), navigasi dan routing antar-halaman, pengaturan lokal (bahasa), serta menyediakan context global yang bisa diakses seluruh widget di bawahnya. Karena fungsinya sebagai penyedia struktur dasar dan konfigurasi aplikasi, MaterialApp hampir selalu diletakkan sebagai widget root agar seluruh bagian aplikasi dapat menggunakan gaya Material, mendapatkan akses ke tema, dan memanfaatkan sistem navigasi dengan benar.

### Jelaskan perbedaan antara `StatelessWidget` dan `StatefulWidget`. Kapan kamu memilih salah satunya?

StatelessWidget adalah widget yang tidak memiliki state dan tampilannya tidak berubah setelah dibangun yang cocok untuk UI yang isinya statis, hanya menampilkan data, atau bergantung pada input dari parent. Sebaliknya, StatefulWidget memiliki state internal yang dapat berubah seiring waktu, dan ketika state berubah widget akan melakukan rebuild, contohnya untuk UI yang interaktif seperti form, counter, animasi, atau data yang dapat diperbarui. Jadi sebaiknya pilih StatelessWidget ketika tampilan tidak perlu berubah, dan pilih StatefulWidget ketika widget harus menyimpan dan mengelola perubahan data di dalam dirinya sendiri.

### Apa itu `BuildContext` dan mengapa penting di Flutter? Bagaimana penggunaannya di metode `build`?

BuildContext adalah objek yang menunjukkan posisi suatu widget di dalam widget tree. Context penting karena dipakai untuk mengakses data dari parent, seperti tema, ukuran layar, atau Scaffold untuk menampilkan SnackBar. Di metode build, context diberikan supaya widget bisa membangun UI sesuai lingkungannya dan menggunakan resource yang disediakan widget di atasnya.

### Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".

Hot reload memperbarui UI aplikasi tanpa mengulang ulang semua state, sehingga perubahan kode langsung terlihat dan nilai-nilai seperti input, counter, atau halaman yang sedang dibuka tetap dipertahankan. Sementara itu, hot restart menjalankan ulang aplikasi dari awal, me-reset seluruh state dan memulai kembali dari main(). Hot reload cepat untuk menguji perubahan UI, sedangkan hot restart digunakan jika perubahan kode memengaruhi struktur aplikasi atau state tidak boleh dipertahankan.