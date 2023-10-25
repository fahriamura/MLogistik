import 'dart:html';
import 'widget.dart';
import 'package:flutter/material.dart';

class PengirimanLaporan extends StatefulWidget {
  const PengirimanLaporan({super.key});

  @override
  State<PengirimanLaporan> createState() => _PengirimanLaporanState();
}

class _PengirimanLaporanState extends State<PengirimanLaporan> {
  var surat = [["12 Maret 2023", "Kekurangan Meja Kayu Untuk Siswa Kelas X IPS 1", "Sudah Dikonfirmasi"],
  ["8 April 2023", "Kerusakan Papan Tulis Pada Kelas XII MIPA 2", "Menunggu DIkonfirmasi"]];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: appBar(context),    
      body: Center(
        child: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30)
              ),
              child: Container(
                decoration: BoxDecoration(
               boxShadow: [
               BoxShadow(
               color: Color.fromARGB(2, 0, 99, 180),
                blurRadius: 200,
                ),
               ],      
                ),
                child: Table(
                defaultColumnWidth: const FixedColumnWidth(200),
                
                border: const TableBorder(
                  verticalInside: BorderSide(
                    width: 0,
                  ) 
                ),
                children : createRows(surat, "Tanggal Laporan", "Topik Laporan","Respons")
              ),
              )
            ),
 
        
          ],
          
        ),  
        ),
      ),
    );
  }
}