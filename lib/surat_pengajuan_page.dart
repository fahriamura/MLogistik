import 'package:logistik/services/api_service.dart';

import 'widget.dart';
import 'package:flutter/material.dart';

class SuratPengajuanPage extends StatefulWidget {
  const SuratPengajuanPage({super.key});

  @override
  State<SuratPengajuanPage> createState() => _SuratPengajuanPageState();
}

class _SuratPengajuanPageState extends State<SuratPengajuanPage> {
  var surat = [];
  int totalDisetujui = 0;
  int totalMenunggu = 0;
  int totalDitolak = 0;

  late Future updateDataFuture;

  late int currentIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = 0;
    updateDataFuture = updateData();
  }

  // Function to handle "navigate_before" button click
  void navigateBefore() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--; // Decrement the currentIndex
      });
    }
  }

  // Function to handle "navigate_next" button click
  void navigateNext() {
    if ((currentIndex + 1) * 2 < surat.length) {
      setState(() {
        currentIndex++; // Increment the currentIndex
      });
    }
  }

  Future updateData() async {
    surat = await SetupAPI().getSuratPengajuanStatus();

    int disetujui = 0;
    for (int i = 0; i < surat.length; i++) {
      if (surat[i][3] == "Disetujui") {
        disetujui = disetujui + 1;
      }
    }
    totalDisetujui = disetujui;

    int menunggu = 0;
    for (int i = 0; i < surat.length; i++) {
      if (surat[i][3] == "Menunggu") {
        menunggu = menunggu + 1;
      }
    }
    totalMenunggu = menunggu;

    int ditolak = 0;
    for (int i = 0; i < surat.length; i++) {
      if (surat[i][3] == "Ditolak") {
        ditolak = ditolak + 1;
      }
    }
    totalDitolak = ditolak;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: FutureBuilder<void>(
          future: Future.wait([
            updateDataFuture,
          ]),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(), // Show a loading indicator.
              );
            } else {
              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(16),
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.4,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                        child: Column(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(2, 0, 99, 180),
                                    blurRadius: 200,
                                  ),
                                ],
                              ),
                              child: Table(
                                  defaultColumnWidth: FixedColumnWidth(
                                      MediaQuery.of(context).size.width * 0.2),
                                  border: const TableBorder(
                                      verticalInside: BorderSide(
                                    width: 0,
                                  )),
                                  children: createRows(
                                      context,
                                      surat,
                                      "Tanggal Pengajuan",
                                      "Topik Surat Pengajuan",
                                      "Status",
                                      currentIndex)),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed:
                                      navigateBefore, // Call navigateBefore when "navigate_before" button is pressed
                                  icon: Icon(Icons.navigate_before),
                                  color: Colors.blue,
                                ),
                                IconButton(
                                  onPressed:
                                      navigateNext, // Call navigateNext when "navigate_next" button is pressed
                                  icon: Icon(Icons.navigate_next),
                                  color: Colors.blue,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(30),
                        margin: const EdgeInsets.only(top: 30, bottom: 10),
                        height: MediaQuery.of(context).size.height * 0.15,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  totalDisetujui.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: calculateFontSize(context, 16)),
                                ),
                                Text(
                                  "Disetujui",
                                  style: TextStyle(
                                      fontSize: calculateFontSize(context, 10)),
                                )
                              ],
                            ),
                            const Icon(
                              Icons.done,
                              color: Colors.green,
                              size: 50,
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(30),
                        margin: const EdgeInsets.only(bottom: 10),
                        height: MediaQuery.of(context).size.height * 0.15,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  totalMenunggu.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: calculateFontSize(context, 16)),
                                ),
                                Text(
                                  "Menunggu",
                                  style: TextStyle(
                                      fontSize: calculateFontSize(context, 10)),
                                )
                              ],
                            ),
                            const Icon(
                              Icons.schedule,
                              color: Colors.yellow,
                              size: 50,
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(30),
                        height: MediaQuery.of(context).size.height * 0.15,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  totalDitolak.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: calculateFontSize(context, 16)),
                                ),
                                Text(
                                  "Ditolak",
                                  style: TextStyle(
                                      fontSize: calculateFontSize(context, 10)),
                                )
                              ],
                            ),
                            const Icon(
                              Icons.close,
                              color: Colors.red,
                              size: 50,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
          }),
      bottomNavigationBar: bottomAppBarSurat(context),
    );
  }
}
