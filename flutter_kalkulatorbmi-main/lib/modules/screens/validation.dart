class Validation {
  String validateName(String value) {
    if (value.isEmpty) { //jika value kosong
      return 'Username Harus Diisi'; 
    } if (value != 'admin') { //jika value tidak sesuai
      return 'Username Salah!'; 
    }
    return null;
  }

  // FUNGSI validatePassword
  String validatePassword(String value) { //terima value dengan tipe string
    if (value.isEmpty) { //jika value kosong
      return 'Password Harus Diisi'; 
    } if (value.length != 5) { //value dicek apabila kurang dari 6 karakter
      return 'Password Hanya 5 Karakter'; //error muncul
    } if (value != 'admin') { //value dicek apabila tidak sesuai kriteria udacoding
      return 'Password Salah!'; //error muncul
    } 
    return null; //selain itu lolos validasi
  }
}