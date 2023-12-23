import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class SetupAPI {
  Future getData(String url) async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      var allData = jsonDecode(data);
      return allData;
    } else {
      if (kDebugMode) {
        print(response.statusCode);
      }
      return null;
    }
  }

  Future login(String email, String password) async {
    List data =
        await SetupAPI().getData("http://192.168.1.5:3000/api/user-names");
    for (int i = 0; i < data.length; i++) {
      if (data[i]["email"] == email && data[i]["password"] == password) {
        return true;
      }
    }
    return false;
  }

  Future<int> getUID(String email) async {
    List data =
        await SetupAPI().getData("http://192.168.1.10:3000/api/user-names");
    for (int i = 0; i < data.length; i++) {
      if (data[i]["email"] == email) {
        return data[i]["User_ID"];
      }
    }
    return -1;
  }

  Future getSuratPengajuanStatus() async {
    List data = await SetupAPI()
        .getData("http://192.168.1.10:3000/api/surat-pengajuan");
    List fixedData = [];
    for (int i = 0; i < data.length; i++) {
      List localData = [];
      localData.add(data[i]["Surat_ID"]);
      localData.add(data[i]["tanggal"]);
      localData.add(data[i]["topik"]);
      localData.add(data[i]["status"]);
      fixedData.add(localData);
    }
    return fixedData;
  }

  Future getLaporanStatus() async {
    List data =
        await SetupAPI().getData("http://192.168.1.10:3000/api/laporan-rutin");
    List fixedData = [];
    for (int i = 0; i < data.length; i++) {
      List localData = [];
      localData.add(data[i]["tanggal"]);
      localData.add(data[i]["topik"]);
      localData.add(data[i]["isi"]);
      fixedData.add(localData);
    }
    return fixedData;
  }

  Future getDataBarang() async {
    List data = await SetupAPI().getData("http://192.168.1.10:3000/api/barang");
    List fixedData = [];
    for (int i = 0; i < data.length; i++) {
      List localData = [];
      localData.add(data[i]["nama"]);
      localData.add(data[i]["jumlah"]);
      localData.add(data[i]["harga"]);
      fixedData.add(localData);
    }
    return fixedData;
  }

  Future<bool> postDataBarang(String item, int jumlah, int harga) async {
    final url = Uri.parse('http://192.168.1.10:3000/api/barang');

    final Map<String, dynamic> data = {
      'nama': item,
      'jumlah': jumlah,
      'harga': harga,
    };

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json', // Set the content type to JSON
      },
      body: jsonEncode(data), // Encode data as JSON
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> postDataSurat(int id, String tanggal, String topik) async {
    final url = Uri.parse('http://192.168.1.10:3000/api/surat-pengajuan');

    final Map<String, dynamic> data = {
      'User_ID': id,
      'tanggal': tanggal,
      'topik': topik,
    };

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json', // Set the content type to JSON
      },
      body: jsonEncode(data), // Encode data as JSON
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      if (kDebugMode) {
        print(response.statusCode);
      }
      return false;
    }
  }

  Future<bool> postDataLaporan(
      int id, String tanggal, String topik, String isi) async {
    final url = Uri.parse('http://192.168.1.10:3000/api/post-laporan-rutin');

    final Map<String, dynamic> data = {
      'User_ID': id,
      'tanggal': tanggal,
      'topik': topik,
      'isi': isi
    };

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json', // Set the content type to JSON
      },
      body: jsonEncode(data), // Encode data as JSON
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      if (kDebugMode) {
        print(response.statusCode);
      }
      return false;
    }
  }

  Future<void> updateSuratStatus(int suratId, String status) async {
    const String apiUrl =
        'http://192.168.1.10:3000/api/update-surat'; // Replace with your API endpoint URL

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    final Map<String, dynamic> data = {
      'Surat_ID': suratId,
      'status': status,
    };

    final response = await http.put(
      Uri.parse(apiUrl),
      headers: headers,
      body: json.encode(data),
    );

    if (response.statusCode == 200) {
      // Successful update
      if (kDebugMode) {
        print('Status updated successfully');
      }
    } else {
      // Handle the error here, e.g., show an error message
      if (kDebugMode) {
        print('Failed to update status: ${response.statusCode}');
      }
    }
  }
}
