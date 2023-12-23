import 'package:flutter/material.dart';
import 'package:logistik/services/api_service.dart';
import 'widget.dart';

class Dashboards extends StatefulWidget {
  const Dashboards({Key? key}) : super(key: key);

  @override
  State<Dashboards> createState() => _DashboardsState();
}

class _DashboardsState extends State<Dashboards> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _jumlahController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();

  String _nama = "";
  int _jumlah = 0;
  int _harga = 0;

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
                        "Update Dashboard",
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
                          controller: _namaController,
                          style: TextStyle(
                              fontSize: calculateFontSize(context, 10)),
                          decoration: const InputDecoration.collapsed(
                            hintText: "Masukkan Nama Barang..",
                          ),
                          onChanged: (value) {
                            _nama = value;
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
                          controller: _jumlahController,
                          style: TextStyle(
                              fontSize: calculateFontSize(context, 10)),
                          decoration: const InputDecoration.collapsed(
                              hintText: "Masukkan Jumlah Barang.."),
                          onChanged: (value) {
                            _jumlah = int.parse(value);
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
                          controller: _hargaController,
                          style: TextStyle(
                              fontSize: calculateFontSize(context, 10)),
                          decoration: const InputDecoration.collapsed(
                              hintText: "Masukkan Harga Barang.."),
                          onChanged: (value) {
                            _harga = int.parse(value);
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
                              bool result = await SetupAPI()
                                  .postDataBarang(_nama, _jumlah, _harga);
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
                              _namaController.text = '';
                              _jumlahController.text = '';
                              _hargaController.text = '';
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
      bottomNavigationBar: bottomAppBarDashboard(context),
    );
  }
}
