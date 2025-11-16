# The 12th Kit
The 12th player's kit.

### Author
- Name: Ahmad Faiq Fawwaz Abdussalam
- NPM: 2406397706
- Class: PBP C

### Archive
<details>
<summary>Tugas Individu 7</summary>

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
</details>

<details>
<summary>Tugas Individu 8</summary>

## Tugas Individu 8 - PBP Ganjil 2025/2026

### Jelaskan perbedaan antara **`Navigator.push()`** dan **`Navigator.pushReplacement()`** pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?

Navigator.push() menambahkan halaman baru di atas stack sehingga pengguna masih bisa kembali ke halaman sebelumnya, sedangkan Navigator.pushReplacement() menggantikan halaman saat ini sehingga halaman lama tidak bisa dikembalikan. Pada aplikasi The 12th Kit, push() cocok digunakan untuk navigasi yang membutuhkan kemampuan kembali, seperti membuka form produk dari halaman utama, sementara pushReplacement() lebih tepat untuk navigasi dari drawer seperti menuju Home atau Create Product, karena pengguna tidak perlu kembali ke halaman lama setelah memilih menu utama.

### Bagaimana kamu memanfaatkan **hierarchy widget** seperti `Scaffold`, `AppBar`, dan `Drawer` untuk membangun struktur halaman yang konsisten di seluruh aplikasi?

Saya membangun struktur halaman yang konsisten dengan menempatkan Scaffold sebagai kerangka utama di setiap screen (menyediakan slot standar: appBar, drawer, body, floatingActionButton), lalu mengisi AppBar di atas untuk judul/aksi global yang konsisten (warna dan gaya mengikuti ThemeData.colorScheme), serta menyematkan Drawer yang sama (mis. LeftDrawer) agar navigasi utama seragam di seluruh halaman. Dengan pola ini, hanya bagian body yang berubah sesuai konten (home, daftar produk, form tambah produk), sementara header dan navigasi samping tetap identik, sehingga pengalaman pengguna konsisten, mudah dipelihara, dan tema warna otomatis mengalir ke semua komponen.

### Dalam konteks desain antarmuka, apa kelebihan menggunakan **layout widget** seperti `Padding`, `SingleChildScrollView`, dan `ListView` saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.

Menggunakan Padding, SingleChildScrollView, dan ListView memberikan tampilan form yang lebih rapi, nyaman, dan tetap bisa di-scroll di berbagai ukuran layar. Padding membantu memberi jarak antar-elemen agar form tidak terlihat penuh dan lebih mudah dibaca, seperti pada setiap TextFormField di halaman tambah produk. SingleChildScrollView memastikan seluruh form tetap dapat diakses saat kontennya panjang atau ketika keyboard muncul, sehingga pengguna tidak perlu khawatir bagian bawah form tertutup yang saya gunakan saat membungkus seluruh Column di halaman form produk agar bisa digulir. Sementara itu, ListView (seperti dalam Drawer) secara otomatis memberikan kemampuan scroll dan mengatur daftar menu agar responsif tanpa harus mengatur tinggi elemen secara manual. Dengan memanfaatkan ketiga widget ini, UI form di aplikasi menjadi bersih, responsif, dan tidak menimbulkan overflow.

### Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?

Saya menyesuaikan warna tema dengan memanfaatkan ThemeData dan ColorScheme sehingga seluruh komponen UI otomatis mengikuti identitas visual brand. Pada aplikasi The 12th Kit, saya menentukan palet utama seperti primary untuk warna navbar (#081A33), secondary untuk aksen neon green (#00FF88), serta warna surface dan background untuk tampilan kartu dan halaman. Dengan menggunakan ThemeData(colorScheme: ...), warna-warna ini mengalir ke AppBar, Drawer, ikon, tombol, teks, dan card secara konsisten tanpa harus memberi warna satu per satu. Selain itu, komponen seperti Drawer, ItemCard, dan AppBar semua mengambil warna dari Theme.of(context).colorScheme, sehingga seluruh halaman terasa satu identitas visual yang senada dengan brand The 12th Kit.
</details>

---

## Tugas Individu 9 - PBP Ganjil 2025/26

### Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan `Map<String, dynamic>` tanpa model (terkait validasi tipe, null-safety, maintainability)?

Kita butuh model Dart supaya data JSON punya struktur dan tipe yang jelas, sehingga kesalahan seperti salah tipe atau key typo bisa terdeteksi lebih cepat. Kalau hanya pakai `Map<String, dynamic>`, semua jadi serba-dynamic: rawan error runtime, tidak ada jaminan null-safety, sulit di-refactor, dan kode cepat berantakan. Dengan model, data lebih aman, autocomplete bekerja, dan aplikasi lebih mudah dirawat.

### Apa fungsi package *http* dan *CookieRequest* dalam tugas ini? Jelaskan perbedaan peran *http* vs *CookieRequest*.

Package http dipakai untuk melakukan request HTTP “biasa” (GET/POST, dll.) ke server tanpa mengurus sesi login atau cookie, saya sendiri yang pegang URL, header, dan body-nya. Sementara itu, CookieRequest dari pbp_django_auth adalah wrapper yang sudah otomatis mengelola cookie, session, dan CSRF ke Django yang dipakai untuk login/logout, lalu setiap request berikutnya (GET/POST JSON) akan otomatis membawa cookie user yang sudah login, sehingga view di Django bisa tahu siapa penggunanya.

### Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

Instance CookieRequest perlu dibagikan ke semua komponen (misalnya lewat Provider) supaya satu sesi login yang sama dipakai di seluruh aplikasi. Dengan begitu, ketika user login di satu halaman, halaman lain bisa langsung memakai request yang sama (cookie-nya masih tersimpan), bisa akses endpoint yang butuh autentikasi, dan status loggedIn konsisten di mana-mana. Kalau tiap widget bikin instance CookieRequest sendiri, cookie dan status login tidak terbagi, user seolah-olah “belum login” di halaman lain dan autentikasi jadi berantakan.

### Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?

Agar Flutter bisa berkomunikasi dengan Django, kita harus mengizinkan koneksi dari emulator melalui 10.0.2.2 di ALLOWED_HOSTS, mengaktifkan CORS serta mengatur cookie/SameSite supaya session login bisa tersimpan dan dikirim, dan menambahkan permission internet di Android agar aplikasi boleh melakukan request HTTP. Kalau salah satu konfigurasi ini tidak dilakukan, Flutter bisa gagal terhubung karena Django menolak host, browser memblokir request lewat CORS, cookie login tidak pernah terkirim sehingga selalu dianggap belum login, atau aplikasi Android sama sekali tidak bisa mengakses internet.

### Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.

Data dikirim dari Flutter dengan mengambil nilai input form, mengemasnya sebagai JSON, lalu mengirimkannya ke Django melalui POST. Django menyimpan data ke database, lalu ketika Flutter melakukan GET, Django mengirimkan JSON berisi data terbaru. Flutter mem-parsing JSON itu ke model Dart dan menampilkannya di UI.

### Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

Proses autentikasi berjalan berurutan. Saat login atau register, Flutter mengirim username dan password ke endpoint Django melalui CookieRequest, Django memvalidasi data (register membuat akun baru, login mencocokkan password), lalu Django mengembalikan respons sekaligus memberikan cookie session yang otomatis disimpan oleh CookieRequest. Cookie ini dipakai untuk semua request berikutnya sehingga Django tahu siapa user yang sedang aktif. Setelah login berhasil, Flutter menampilkan menu utama berdasarkan status loggedIn. Untuk logout, Flutter memanggil endpoint logout Django, Django menghapus session, dan CookieRequest ikut menghapus cookie lokal sehingga user dianggap keluar dan kembali ke halaman login.

### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).

#### Membuat halaman login pada proyek tugas Flutter.

1. Buat views login di `authentication/views.py` dan atur URL rootingnya.
2. Buat `login.dart` di folder `screens`.
3. Pada file `main.dart`, pada Widget MaterialApp(...), ubah home: MyHomePage() menjadi home: const LoginPage()

#### Mengimplementasikan fitur registrasi akun pada proyek tugas Flutter.

1. Sebelumnya, saya membuat app `authentication` di proyek Django saya dan membuat beberapa perubahan di `settings.py`.
2. Buat views register di `authentication/views.py` dan atur URL rootingnya.
3. Buat `register.dart` di folder `screens`.
4. Pada file `screens/login.dart`, import file `register.dart` dan update fungsi onTap.

#### Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.

1. Atur YOUR_APP_URL sesuai dengan URL PWS.
2. Instal package yang telah disediakan oleh tim asisten dosen
    ```
    flutter pub add provider
    flutter pub add pbp_django_auth
    ```
3. Modifikasi root widget untuk menyediakan CookieRequest library ke semua child widgets dengan menggunakan Provider.

#### Membuat model kustom sesuai dengan proyek aplikasi Django.

1. Buka endpoint JSON dan salin datanya.
2. Pada situs web Quicktype, ubah name menjadi ProductsEntry, source type menjadi JSON, dan language menjadi Dart.
3. Tempel data JSON yang telah disalin sebelumnya ke dalam textbox yang tersedia pada Quicktype.
4. Copy Code dan tempel di `models/products_entry.dart`.

#### Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy.

Buat `screens/products_entry_list_all.dart` yang gunanya untuk menampilkan semua item.

#### Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item.

1. Buat `screens/products_detail.dart` yang gunanya untuk menampikan detail produk.
2. Update file `screens/products_entry_list_all.dart` untuk menambahkan navigasi ke halaman detail.

#### Melakukan filter pada halaman daftar item dengan hanya menampilkan item yang terasosiasi dengan pengguna yang login.

Karena dari awal aplikasi terdapat menu All Products dan My Products, maka saya membuat `screens/products_entry_list.dart` yang terdapat modifikasi berikut:
```dart
final dynamic rawUserId = request.jsonData['user_id'];

final int currentUserId = rawUserId is int
    ? rawUserId
    : int.tryParse(rawUserId.toString()) ?? -1;

final userProducts =
    allProducts.where((p) => p.userId == currentUserId).toList();
```