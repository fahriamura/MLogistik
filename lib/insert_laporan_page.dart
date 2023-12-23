import 'package:flutter/material.dart';
import 'package:logistik/services/api_service.dart';
import 'widget.dart';

class InsertLaporanPage extends StatefulWidget {
  const InsertLaporanPage({Key? key}) : super(key: key);

  @override
  State<InsertLaporanPage> createState() => _InsertLaporanPageState();
}

class _InsertLaporanPageState extends State<InsertLaporanPage> {
  final TextEditingController _tanggalController = TextEditingController();
  final TextEditingController _topikController = TextEditingController();
  final TextEditingController _isiController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  String _tanggal = "";
  String _topik = "";
  String _isi = "";
  String _email = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: appBar(context),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  // height: MediaQuery.of(context).size.height * 0.8,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Kirim Laporan",
                        style: TextStyle(
                          fontSize: calculateFontSize(context, 20),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: const Color.fromARGB(255, 5, 5, 6)),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          controller: _emailController,
                          style: TextStyle(
                              fontSize: calculateFontSize(context, 10)),
                          decoration: const InputDecoration.collapsed(
                            hintText: "Masukkan Email..",
                          ),
                          onChanged: (value) {
                            _email = value;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: const Color.fromARGB(255, 5, 5, 6)),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          controller: _tanggalController,
                          style: TextStyle(
                              fontSize: calculateFontSize(context, 10)),
                          decoration: const InputDecoration.collapsed(
                            hintText: "Masukkan Tanggal.. (HH/BB/TTTT)",
                          ),
                          onChanged: (value) {
                            _tanggal = value;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: const Color.fromARGB(255, 5, 5, 6)),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          controller: _topikController,
                          style: TextStyle(
                              fontSize: calculateFontSize(context, 10)),
                          decoration: const InputDecoration.collapsed(
                              hintText: "Masukkan topik laporan.."),
                          onChanged: (value) {
                            _topik = value;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: const Color.fromARGB(255, 5, 5, 6)),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          controller: _isiController,
                          style: TextStyle(
                              fontSize: calculateFontSize(context, 10)),
                          decoration: const InputDecoration.collapsed(
                              hintText: "Masukkan isi laporan.."),
                          onChanged: (value) {
                            _isi = value;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              int uid = await SetupAPI().getUID(_email);
                              bool result = await SetupAPI()
                                  .postDataLaporan(uid, _tanggal, _topik, _isi);
                              if (result) {
                                showDialog(
                                  context:
                                      context, // Use the local context here.
                                  builder: (BuildContext context) {
                                    return const AlertDialog(
                                      backgroundColor: Colors.white,
                                      content: SingleChildScrollView(
                                          child: ListBody(
                                        children: [
                                          Text(
                                            "BERHASIL DIINPUT",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.green),
                                          )
                                        ],
                                      )),
                                    );
                                  },
                                );
                              } else {
                                showDialog(
                                  context:
                                      context, // Use the local context here.
                                  builder: (BuildContext context) {
                                    return const AlertDialog(
                                      backgroundColor: Colors.white,
                                      content: SingleChildScrollView(
                                          child: ListBody(
                                        children: [
                                          Text(
                                            "GAGAL DIINPUT",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red),
                                          )
                                        ],
                                      )),
                                    );
                                  },
                                );
                              }
                            },
                            style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Color.fromARGB(255, 3, 3, 251)),
                            ),
                            child: const Text(
                              "Update",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _emailController.text = '';
                              _tanggalController.text = '';
                              _isiController.text = '';
                              _topikController.text = '';
                            },
                            style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Color.fromARGB(255, 3, 3, 251)),
                            ),
                            child: const Text(
                              "Reset",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomAppBarUpdateLaporan(context),
    );
  }
}
