import 'package:flutter/material.dart';
import 'package:logistik/dashboard_wakasek_page.dart';
import 'package:logistik/laporan_wakasek_page.dart';
import 'package:logistik/surat_wakasek_page.dart';
import 'dashboard2.dart';
import 'pengiriman_laporan.dart';
import 'surat_pengajuan_page.dart';
import 'widget.dart';

class MenuWakasekPage extends StatefulWidget {
  const MenuWakasekPage({Key? key}) : super(key: key);

  @override
  State<MenuWakasekPage> createState() => _MenuWakasekPageState();
}

class _MenuWakasekPageState extends State<MenuWakasekPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Center(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width / 2,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 0, 99, 180),
                      blurRadius: 30,
                    ),
                  ],
                  color: const Color.fromARGB(255, 253, 253, 253),
                  border: Border.all(color: const Color(0xff475BD8)),
                  borderRadius: BorderRadius.circular(30)),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const DashboardWakasekPage();
                      },
                    ),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Dashboard",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: calculateFontSize(context, 17),
                        fontWeight: FontWeight.w500,
                        fontFamily: 'David Libre',
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width / 2,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 0, 99, 180),
                      blurRadius: 30,
                    ),
                  ],
                  color: const Color.fromARGB(255, 253, 253, 253),
                  border: Border.all(color: const Color(0xff475BD8)),
                  borderRadius: BorderRadius.circular(30)),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const SuratWakasekPage();
                      },
                    ),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Surat Pengajuan",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: calculateFontSize(context, 17),
                        fontWeight: FontWeight.w500,
                        fontFamily: 'David Libre',
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 0, 99, 180),
                      blurRadius: 30,
                    ),
                  ],
                  color: const Color.fromARGB(255, 253, 253, 253),
                  border: Border.all(color: const Color(0xff475BD8)),
                  borderRadius: BorderRadius.circular(30)),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const LaporanWakasekPage();
                      },
                    ),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Laporan Rutin",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: calculateFontSize(context, 17),
                        fontWeight: FontWeight.w500,
                        fontFamily: 'David Libre',
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
