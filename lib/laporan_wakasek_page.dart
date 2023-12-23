import 'package:logistik/services/api_service.dart';

import 'widget.dart';
import 'package:flutter/material.dart';

class LaporanWakasekPage extends StatefulWidget {
  const LaporanWakasekPage({super.key});

  @override
  State<LaporanWakasekPage> createState() => _LaporanWakasekPageState();
}

class _LaporanWakasekPageState extends State<LaporanWakasekPage> {
  var surat = [];
  late int currentIndex;
  late Future updateDataFuture;

  @override
  void initState() {
    super.initState();
    currentIndex = 0; // Initialize with the starting index
    updateDataFuture = updateData();
  }

  Future updateData() async {
    surat = await SetupAPI().getLaporanStatus();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: FutureBuilder<void>(
          future: Future.wait([updateDataFuture]),
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
                          padding: const EdgeInsets.all(20),
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
                                        MediaQuery.of(context).size.width *
                                            0.2),
                                    border: const TableBorder(
                                        verticalInside: BorderSide(
                                      width: 0,
                                    )),
                                    children: createRows(
                                        context,
                                        surat,
                                        "Tanggal Laporan",
                                        "Topik Laporan",
                                        "Isi",
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
                          )),
                      Container(
                        padding: const EdgeInsets.all(30),
                        margin: const EdgeInsets.only(top: 30, bottom: 10),
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: calculateFontSize(context, 16)),
                                ),
                                Text(
                                  "",
                                  style: TextStyle(
                                      fontSize: calculateFontSize(context, 10)),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(30),
                        margin: EdgeInsets.only(bottom: 10),
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: calculateFontSize(context, 16)),
                                ),
                                Text(
                                  "",
                                  style: TextStyle(
                                      fontSize: calculateFontSize(context, 10)),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(30),
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: calculateFontSize(context, 16)),
                                ),
                                Text(
                                  "",
                                  style: TextStyle(
                                      fontSize: calculateFontSize(context, 10)),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
          }),
      bottomNavigationBar: bottomAppBarWakasek(context),
    );
  }
}
