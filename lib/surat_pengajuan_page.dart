import 'dart:html';
import 'widget.dart';
import 'package:flutter/material.dart';

class SuratPengajuanPage extends StatefulWidget {
  const SuratPengajuanPage({super.key});

  @override
  State<SuratPengajuanPage> createState() => _SuratPengajuanPageState();
}

class _SuratPengajuanPageState extends State<SuratPengajuanPage> {
  var surat = [["21 Maret 2023", "Pengajuan 1", "Disetujui"],["22 Maret 2023", "Pengajuan 2", "Menunggu"]];

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
                children : createRows(surat)
              ),
              )
            ),
          Container(
            padding: EdgeInsets.all(30),
            margin: EdgeInsets.only(top: 30, bottom: 10),
            height : MediaQuery.of(context).size.height *0.15,
            decoration: BoxDecoration(
              color: Colors.white,
             borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(

                  children: [
                    Text("18",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24
                    ),),
                    Text("Disetujui",
                    style: TextStyle(
                      fontSize: 10
                    ),
                    )
                  ],
                ),
                Icon(Icons.done, color: Colors.green,size: 50,)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(30),
            margin: EdgeInsets.only(bottom: 10),
            height : MediaQuery.of(context).size.height *0.15,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(

                  children: [
                    Text("2",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24
                    ),),
                    Text("Menunggu",
                    style: TextStyle(
                      fontSize: 10
                    ),
                    )
                  ],
                ),
                Icon(Icons.schedule, color: Colors.yellow,size: 50,)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(30),
            height : MediaQuery.of(context).size.height *0.15,
            decoration: BoxDecoration(
              color: Colors.white,
             borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(

                  children: [
                    Text("6",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24
                    ),),
                    Text("Ditolak",
                    style: TextStyle(
                      fontSize: 10
                    ),
                    )
                  ],
                ),
                Icon(Icons.close, color: Colors.red,size: 50,)
              ],
            ),
          )
        
          ],
          
        ),  
        ),
      ),
    );
  }
}