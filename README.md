Nama : Lee Devin Gerrard

NPM : 2506548452

Kelas : PBP E

# Aplikasi Mobile Portofolio Pribadi

Aplikasi ini merupakan portofolio pribadi yang disajikan dalam format aplikasi mobile dan dibuat untuk memenuhi tugas mata kuliah PBP. Aplikasi ini berisi informasi mengenai profil, pencapaian, pengalaman, dan proyek saya pribadi.

## Fitur (development in progress)

- Profile / About Me
- Achievement section
- Experience page
- Projects page

## Tech Stack

### Backend
- Python
- Django
- Django REST Framework (REST API)

### Mobile Client
- Flutter
- Dart

## Progress Mingguan

### Minggu 11 - Individual Assignment 7: Basic Flutter
- Setup dan inisialisasi proyek
- Menambahkan informasi profil pemilik portfolio
- Menambahkan menu aksi portfolio interaktif sederhana

### Minggu 12 - Individual Assignment 8: Flutter Navigation, Layouts, Forms, and Input Elements
- Menambahkan halaman formulir untuk project dan experience
- Membuat navigasi dan drawer
- Menerapkan validasi pada input formulir dan menampilkan hasilnya melalui dialog
- Merapikan repositori proyek

## Setup & Instalasi

### Prerequisites
Pastikan perangkat telah memiliki beberapa tools berikut:
- Flutter SDK
- Dart SDK (sudah termasuk dalam Flutter SDK)
- Android Studio atau emulator Android lainnya
- Git
- IDE seperti Visual Studio Code
### 1. Clone Repository
Clone repository dan masuk ke direktori proyek:
```bash
git clone https://github.com/leedevgerrard/myportofolio_mobile.git
cd myportofolio_mobile
```
### 2. Install Dependencies
Jalankan perintah berikut untuk mengunduh seluruh dependencies yang dibutuhkan oleh proyek:
```bash
flutter pub get
```
### 3. Cek Flutter Environment
Pastikan instalasi Flutter telah berjalan dengan baik:
```bash
flutter doctor
```
Ikuti instruksi yang ditampilkan apabila terdapat dependencies atau konfigurasi yang belum terpenuhi.
### 4. Jalankan Aplikasi
Untuk sederhana, jalankan aplikasi di Google Chrome dari root folder proyek:
```bash
flutter run -d chrome
```

### Tugas 7

1. Widget tree adalah sebuah tree yang menggambarkan hubungan hierarkis antar-widget dalam aplikasi Flutter. Parent adalah widget yang membungkus widget lain dan menjadikan widget tersebut bagian dari tampilannya. Sedangkan child adalah widget yang dibungkus oleh parent. Satu parent dapat memiliki satu atau lebih child, bergantung pada jenis widgetnya.
2. Berikut daftar widget yang saya gunakan beserta fungsinya masing-masing
- MaterialApp: Menjadi root aplikasi dan mengatur konfigurasi aplikasi
- Scaffold: Menyediakan struktur dasar halaman, seperti AppBar dan Body
- AppBar: Menampilkan bar navigasi di bagian atas aplikasi
- Text: Menampilkan teks
- TextStyle: Mengatur tampilan teks, seperti warna dan font weight
- Padding: Memberikan padding/jarak pada area sekeliling widget
- Column: Menyusun child widget secara vertikal
- Row: Menyusun child widget secara horizontal
- SizedBox: Ruang kosong dengan ukuran tertentu
- Center: Memposisikan child widget di tengah
- GridView: Menampilkan widget dalam tata letak kisi dengan jumlah kolom tertentu
- Card: Menampilkan kartu berisi informasi
- Container: Mengatur ukuran, padding, warna, dan tata letak child widget
- Material: Menyediakan permukaan
- InkWell: Membuat widget interaktif terhadap sentuhan
- Icon: Menampilkan icon
- SnackBar: Menampilkan pesan sementara (snackbar)
- ScaffoldMessenger: Mengelola dan menampilkan SnackBar pada Scaffold
- MediaQuery: Memberikan informasi mengenai ukuran layar device
- Theme: Konfigurasi tema aplikasi yang digunakan
- InfoCard: Widget custom berupa kartu informasi yang menampilkan judul dan isi untuk NPM, nama, dan kelas
- ItemCard: Widget custom berupa kartu menu portfolio yang berisi icon dan teks yang bisa ditekan untuk memunculkan snackbar
3. MaterialApp adalah widget utama dalam Flutter yang berfungsi sebagai konfigurasi dasar aplikasi dengan desain Material Design (sistem desain antarmuka yang dikembangkan oleh Google). Widget ini umumnya digunakan sebagai root widget karena mengatur berbagai konfigurasi global yang dibutuhkan oleh aplikasi. Beberapa fungsi dari widget ini antara lain mengatur routing, mengatur tema aplikasi, menentukan judul, dan menentukan halaman utama (home).
4. Perbedaannya terletak pada kemampuan widget mengelola perubahan state. StatelessWidget adalah widget yang tidak memiliki state internal yang dapat berubah, sehingga cocok digunakan untuk komponen UI yang ingin ditampilkan secara statis dan tidak berubah akibat interaksi atau perubahan data internal, seperti teks, logo, atau informasi profil statis. Sedangkan StatefulWidget adalah widget yang memiliki state yang dapat berubah selama aplikasi berjalan, sehingga cocok digunakan untuk komponen UI yang membutuhkan perubahan tampilan akibat interaksi pengguna atau perubahan data internal, seperti counter, checkbox, atau tombol-tombol interaktif. 
5. BuildContext adalah objek pada Flutter yang menyimpan informasi mengenai posisi sebuah widget di dalam widget tree. BuildContext penting karena memungkinkan sebuah widget mengakses informasi dan resource dari widget-widget yang berada di atasnya, seperti mengakses tema aplikasi, ukuran layar, navigasi, dan konfigurasi lainnya. Setiap metode build menerima parameter 'BuildContext context' yang digunakan untuk mengakses informasi tersebut ketika membangun tampilan widget.
6. Hot reload menerapkan perubahan kode ke aplikasi yang sedang berjalan tanpa menghilangkan state yang sedang tersimpan. Sedangkan hot restart menjalankan ulang aplikasi Flutter dari awal dengan memuat ulang kode dan menginisialisasi ulang state aplikasi. Kita perlu melakukan hot restart ketika melakukan perubahan yang memerlukan inisialisasi ulang state. Full restart diperlukan ketika perubahan melibatkan konfigurasi atau kode native yang membutuhkan proses build ulang.

### Tugas 8

1. Navigator.push() menambahkan suatu route ke bagian paling atas stack route sehingga route tersebut akan ditampilkan ke pengguna. Navigator.pushReplacement() mengganti route yang berada di tumpukan paling atas stack route (yang sedang ditampilkan ke pengguna) menjadi suatu route baru yang diberikan. Navigator.pushReplacement() mirip dengan Navigator.push(), hanya saja ia menghapus route paling atas terlebih dahulu sebelum menambahkan route yang baru. Navigator.pop() menghapus route yang berada di tumpukan paling atas stack route sehingga tampilan aplikasi berpindah ke route yang berada di bawahnya. Metode yang dipakai untuk membuka formulir dari kartu aksi adalah push(), yang berarti halaman formulir akan ditambahkan pada stack route sehingga aplikasi kemudian menampilkan halaman formulir. Sedangkan opsi Home pada Drawer menggunakan metode pushReplacement(), yang berarti ketika opsi ditekan, maka route teratas yang sedang ditampilkan akan dihapus dan digantikan dengan halaman homepage.
2. Scaffold, AppBar, dan Drawer digunakan sebagai struktur pada setiap halaman agar tampilan pada setiap halaman seragam dan konsisten terlepas dari isi konten utama halaman tersebut. Scaffold, AppBar, dan Drawer diterapkan pada setiap halaman dan memiliki peran masing-masing. Scaffold merupakan kerangka utama halaman yang di dalamnya terdapat AppBar dan Drawer. AppBar merupakan bar pada bagian atas halaman yang berisi judul halaman dan tombol navigasi. Drawer merupakan panel navigasi yang berada di samping yang memungkinkan pengguna untuk berpindah dari halaman satu ke yang lainnya pada setiap halaman. Pengaturan warna tema portofolio dilakukan secara terpusat di main.dart menggunakan ThemeData pada MaterialApp. Pada proyek ini, warna utama yang dipakai adalah indigo dan warna sekundernya adalah amber. Tema utama tersebut kemudian akan diwariskan pada widget-widget turunannya sehingga banyak halaman dapat menggunakan tema yang sama dan konsisten tanpa perlu mendefinisikan tema pada masing-masing halaman.
3. Tata letak yang digunakan untuk halaman formulir terdiri dari beberapa widget seperti Form, SingleChildScrollView, Column, dan Padding. Tujuannya adalah agar formulir terstruktur rapi dan mudah digunakan, bahkan ketika ruang layar terbatas. Peran widget pengatur jarak (Padding) adalah untuk memberikan jarak (ruang kosong) di sekitar widget input agar tampilan input tetap rapi. Peran widget penggulir (SingleChildScrollView) adalah agar tampilan form beserta seluruh isinya tetap dapat diakses dengan digulir (di-scroll) secara vertikal bila tinggi formulirnya melebihi tinggi layar dan keseluruhan tampilannya tidak bisa ditampilkan sepenuhnya sekaligus.
4. Peran GlobalKey<FormState> adalah menjadi key yang digunakan sebagai penghubung agar kita dapat mengakses dan mengelola state widget Form dari luar widget tersebut. Dengan key tersebut, kita dapat mengakses fungsi-fungsi seperti validate(), reset(), dsb. Peran validator adalah untuk menentukan apakah input pengguna valid atau tidak berdasarkan aturan-aturan yang didefinisikan. Peran validate() saat tombol Simpan ditekan adalah menjalankan validator pada seluruh input pada form dan mengembalikan true jika seluruh input valid dan false jika terdapat setidaknya satu input yang tidak valid. Salah satu contoh nilai yang ditolak oleh validasi pada input Experience Title adalah input yang memiliki panjang 256 karakter. Pemilihan jenis input atau papan ketik hanya dilakukan agar memudahkan pengguna dalam mengisi formulir karena input dan papan ketik memiliki jenis yang sesuai dengan format input, namun validasi tetap diperlukan karena pemilihan jenis input dan papan ketik tidak mendefinisikan aturan validasi dan tidak menangani kasus-kasus yang ingin kita validasi.

## AI Disclosure

Sejauh ini, AI yang berupa chatbot hanya saya gunakan untuk berdiskusi dan mempelajari Flutter serta pengembangan aplikasi mobile lebih dalam. AI chatbot (ChatGPT) saya gunakan untuk menanyakan hal-hal terkait properti CSS, best practices, troubleshooting, dan mempelajari suatu hal baru. AI sangat mungkin melakukan kekeliruan. Oleh karena itu, dalam penggunaannya, saya selalu mengevaluasi hasil jawaban AI dan saya tidak sepenuhnya terpaku pada AI, melainkan juga memadukannya dengan dokumentasi dan sumber lainnya.

### AI Tools
- ChatGPT

### Strategi Prompting
Saya bertanya mengenai suatu konsep tentang Flutter maupun pengembangan aplikasi mobile kepada AI. AI memberikan penjelasan kepada saya. Setelah saya memahami penjelasan AI, terkadang saya juga mencari informasi lebih lengkapnya pada dokumentasi dan sumber lain.

### Disclosure

Format:
`id` / `index tugas/tutorial` - `deskripsi singkat` : `tautan ke chat`
#### 001 / 7 - Penjelasan mengenai widget MaterialApp & BuildContext : [tautan ke chat](https://chatgpt.com/share/6afadd16-d6b8-83ec-b8fe-4a09b5b7689e)
#### 002 / 7 - Perbedaan antara hot restart dan full restart : [tautan ke chat](https://chatgpt.com/share/6afadd5f-824c-83ec-a9e2-725d8550679e)
#### 003 / 8 - Penjelasan objek tanggal dan tipe data future : [tautan ke chat](https://chatgpt.com/share/6b045c31-7154-83ec-b30a-4ae9089e0cba)
#### 004 / 8 - Penjelasan GlobalKey form : [tautan ke chat](https://chatgpt.com/share/6b045c96-0280-83ec-9e12-b49f88ee7891)