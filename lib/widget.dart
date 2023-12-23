import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:logistik/dashboard.dart';
import 'package:logistik/dashboard2.dart';
import 'package:logistik/dashboard_wakasek_page.dart';
import 'package:logistik/insert_laporan_page.dart';
import 'package:logistik/insert_surat_page.dart';
import 'package:logistik/login.dart';
import 'package:logistik/menu_wakasek_page.dart';
import 'package:logistik/pengiriman_laporan.dart';
import 'package:logistik/services/api_service.dart';
import 'package:logistik/surat_pengajuan_page.dart';
import 'package:logistik/surat_wakasek_page.dart';

PreferredSizeWidget? appBar(BuildContext context) {
  return AppBar(
    backgroundColor: const Color.fromARGB(255, 12, 110, 190),
    leading: IconButton(
      icon: const Icon(
        Icons.logout,
        size: 30,
        color: Colors.red,
      ),
      onPressed: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return LoginScreen();
          },
        ),
      ),
    ),
    title: const Text(
      'M-Logistik',
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white),
    ),
  );
}

Widget bottomAppBarSurat(BuildContext context) {
  return BottomAppBar(
    color: const Color.fromARGB(255, 12, 110, 190),
    height: MediaQuery.of(context).size.height * 0.08,
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return const dashboard();
                },
              ),
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.add),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return const InsertSuratPage();
                },
              ),
            );
          },
        ),
      ],
    ),
  );
}

Widget bottomAppBarLaporan(BuildContext context) {
  return BottomAppBar(
    color: const Color.fromARGB(255, 12, 110, 190),
    height: MediaQuery.of(context).size.height * 0.08,
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return const dashboard();
                },
              ),
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.add),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return const InsertLaporanPage();
                },
              ),
            );
          },
        ),
      ],
    ),
  );
}

Widget bottomAppBarDashboard(BuildContext context) {
  return BottomAppBar(
    color: const Color.fromARGB(255, 12, 110, 190),
    height: MediaQuery.of(context).size.height * 0.08,
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return const dashboard2();
                },
              ),
            );
          },
        ),
      ],
    ),
  );
}

Widget bottomAppBarUpdateDashboard(BuildContext context) {
  return BottomAppBar(
    color: const Color.fromARGB(255, 12, 110, 190),
    height: MediaQuery.of(context).size.height * 0.08,
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return const dashboard();
                },
              ),
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
          color: const Color.fromARGB(255, 12, 110, 190),
        ),
      ],
    ),
  );
}

Widget bottomAppBarUpdateSurat(BuildContext context) {
  return BottomAppBar(
    color: const Color.fromARGB(255, 12, 110, 190),
    height: MediaQuery.of(context).size.height * 0.08,
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return const SuratPengajuanPage();
                },
              ),
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
          color: const Color.fromARGB(255, 12, 110, 190),
        ),
      ],
    ),
  );
}

Widget bottomAppBarUpdateLaporan(BuildContext context) {
  return BottomAppBar(
    color: const Color.fromARGB(255, 12, 110, 190),
    height: MediaQuery.of(context).size.height * 0.08,
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return const PengirimanLaporan();
                },
              ),
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
          color: const Color.fromARGB(255, 12, 110, 190),
        ),
      ],
    ),
  );
}

Widget bottomAppBarWakasek(BuildContext context) {
  return BottomAppBar(
    color: const Color.fromARGB(255, 12, 110, 190),
    height: MediaQuery.of(context).size.height * 0.08,
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
          color: const Color.fromARGB(255, 12, 110, 190),
        ),
      ],
    ),
  );
}

Widget bottomAppBarSuratWakasek(BuildContext context) {
  return BottomAppBar(
    color: const Color.fromARGB(255, 12, 110, 190),
    height: MediaQuery.of(context).size.height * 0.08,
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return const MenuWakasekPage();
                },
              ),
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
          color: const Color.fromARGB(255, 12, 110, 190),
        ),
      ],
    ),
  );
}

List<TableRow> createRows(BuildContext context, surat, String row1, String row2,
    String row3, int currentIndex) {
  List<TableRow> table = [
    TableRow(children: [
      Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          color: const Color.fromARGB(255, 6, 29, 231),
          child: Column(children: [
            Text(
              row1,
              style: TextStyle(fontSize: calculateFontSize(context, 8)),
            )
          ])),
      Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          color: Color.fromARGB(255, 6, 29, 231),
          child: Column(children: [
            Text(
              row2,
              style: TextStyle(
                fontSize: calculateFontSize(context, 8),
              ),
            )
          ])),
      Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          color: const Color.fromARGB(255, 6, 29, 231),
          child: Column(children: [
            Text(
              row3,
              style: TextStyle(fontSize: calculateFontSize(context, 8)),
            )
          ]))
    ])
  ];
  int rowsPerPage = 2;
  int startIndex = currentIndex * rowsPerPage;

  if (surat.isNotEmpty) {
    for (int i = startIndex; i < startIndex + rowsPerPage; i++) {
      if (i < surat.length) {
        table.add(
          TableRow(children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  Text(
                    "${surat[i][1]}",
                    style: TextStyle(fontSize: calculateFontSize(context, 12)),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  Text(
                    "${surat[i][2]}",
                    style: TextStyle(fontSize: calculateFontSize(context, 10)),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  Text(
                    "${surat[i][3]}",
                    style: TextStyle(fontSize: calculateFontSize(context, 10)),
                  )
                ],
              ),
            ),
          ]),
        );
      }
    }
  }
  return table;
}

List<TableRow> createRowsWakasek(BuildContext context, surat, String row1,
    String row2, String row3, int currentIndex) {
  List<TableRow> table = [
    TableRow(children: [
      Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          color: const Color.fromARGB(255, 6, 29, 231),
          child: Column(children: [
            Text(
              row1,
              style: TextStyle(fontSize: calculateFontSize(context, 8)),
            )
          ])),
      Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          color: const Color.fromARGB(255, 6, 29, 231),
          child: Column(children: [
            Text(
              row2,
              style: TextStyle(
                fontSize: calculateFontSize(context, 8),
              ),
            )
          ])),
      Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          color: const Color.fromARGB(255, 6, 29, 231),
          child: Column(children: [
            Text(
              row3,
              style: TextStyle(fontSize: calculateFontSize(context, 8)),
            )
          ]))
    ])
  ];
  int rowsPerPage = 2;
  int startIndex = currentIndex * rowsPerPage;

  if (surat.isNotEmpty) {
    for (int i = startIndex; i < startIndex + rowsPerPage; i++) {
      if (i < surat.length) {
        table.add(
          TableRow(children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  Text(
                    "${surat[i][1]}",
                    style: TextStyle(fontSize: calculateFontSize(context, 12)),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  Text(
                    "${surat[i][2]}",
                    style: TextStyle(fontSize: calculateFontSize(context, 10)),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  if (surat[i][3] == "Menunggu")
                    TextButton(
                      child: const Text(
                        "Respon",
                        style: TextStyle(color: Colors.red, fontSize: 12),
                      ), // Replace 'someIcon' with the icon you want to use
                      onPressed: () {
                        showDialog(
                          context: context, // Use the local context here.
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: const SingleChildScrollView(
                                  child: ListBody(
                                children: [Text("Acc Surat?")],
                              )),
                              actions: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    IconButton(
                                        onPressed: () async {
                                          await SetupAPI().updateSuratStatus(
                                              surat[i][0], "Disetujui");
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return const SuratWakasekPage();
                                              },
                                            ),
                                          );
                                        },
                                        icon: const Icon(
                                          Icons.check,
                                          color: Colors.green,
                                        )),
                                    IconButton(
                                        onPressed: () async {
                                          await SetupAPI().updateSuratStatus(
                                              surat[i][0], "Ditolak");
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return const SuratWakasekPage();
                                              },
                                            ),
                                          );
                                        },
                                        icon: const Icon(
                                          Icons.close,
                                          color: Colors.red,
                                        )),
                                  ],
                                )
                              ],
                            );
                          },
                        );
                      },
                    )
                  else
                    Text(
                      "${surat[i][3]}",
                      style:
                          TextStyle(fontSize: calculateFontSize(context, 10)),
                    )
                ],
              ),
            ),
          ]),
        );
      }
    }
  }
  return table;
}

double calculateFontSize(BuildContext context, double size) {
  double screenWidth = MediaQuery.of(context).size.width;
  double baseFontSize = size;
  double scaleFactor = screenWidth / 360.0;
  return baseFontSize * scaleFactor;
}

double calculatePositionedLeft(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double leftPosition = screenWidth * 0.27;
  return leftPosition;
}

double calculatePositionedBottom(BuildContext context) {
  double screenHeight = MediaQuery.of(context).size.height;
  double bottomPosition = screenHeight * 0.05;
  return bottomPosition;
}

class SubscriberSeries {
  final String year;
  final int subscribers;
  final charts.Color barColor;

  SubscriberSeries(
      {required this.year, required this.subscribers, required this.barColor});
}
