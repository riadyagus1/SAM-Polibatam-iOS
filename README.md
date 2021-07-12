<br />
<p align="center">
  <a href="https://github.com/riadyagus1/SAM-Polibatam-iOS">
    <img src="/SAMPolibatam/Assets.xcassets/AppIcon.appiconset/1024x1024.png" alt="Logo SAM Polibatam" width="100" height="100">
  </a>

  <h3 align="center">SAM Polibatam iOS</h3>

  <p align="center">
    Sistem Absensi Polibatam iOS Source Code
    <br />
    <a href="https://play.google.com/store/apps/details?id=com.SAMPolibatamGroup.sampolibatam">Download Android Version</a>
    ·
    <a href="https://absen.polibatam.ac.id/">Website Absen (Demo)</a>
    ·
    <a href="https://absen.polibatam.ac.id/admin/">Website Admin (Demo)</a>
  </p>
</p>

<!-- ABOUT THE PROJECT -->
## Apa itu SAM Polibatam?

SAM Polibatam merupakan aplikasi yg berfungsi bagi para karyawan Politeknik Negeri Batam untuk melakukan absensi. Dimana SAM dapat memudahkan karyawan Politeknik Negeri Batam untuk absen maupun izin hanya dengan ponsel masing-masing karyawan.

<!-- Instalasi -->
## Instalasi

1. Clone repo
   ```sh
   git clone https://github.com/riadyagus1/SAM-Polibatam-iOS.git
   ```
2. Buka file `Podfile` lalu ketik
   ```sh
   pod 'Alamofire','~> 4.0'
   pod 'GoogleMaps'
   pod 'GooglePlaces'
   ```

3. Drag folder yang sudah di clone tadi ke Terminal lalu ketik
   ```sh
   pod install
   ```
4. Buka `SAMPolibatam.xcworkspace` lalu masukkan Google Map API Key ke `AppDelegate.swift`
   ```sh
   GMSServices.provideAPIKey("API-KEY")
   GMSPlacesClient.provideAPIKey("API-KEY")
   ```
   *API Key bisa didapat melalui [Google Cloud Console](https://console.cloud.google.com/)
5. Buka `ViewController.swift` lalu masukkan Auth API Key
   ```sh
   let link_request = "https://sid.polibatam.ac.id/apilogin/web/api/auth/login"
   let tokenAPI = "API-KEY"
   ```
6. Aplikasi siap untuk dibuild :)

<!-- CONTACT -->
## Kontak

Agus Riady <br />
Email: riadyagus1@gmail.com <br />
LinkedIn: https://www.linkedin.com/in/riadyagus1/ <br />
Instagram: [@riadyagus1](https://www.instagram.com/riadyagus1/) <br />

GitHub Link: [https://github.com/riadyagus1](https://github.com/riadyagus1)
