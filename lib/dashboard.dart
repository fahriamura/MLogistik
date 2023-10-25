import 'package:flutter/material.dart';
import 'package:logistik/dashboards.dart';
import 'package:logistik/pengiriman_laporan.dart';
import 'package:logistik/surat_pengajuan_page.dart';
class dashboard extends StatelessWidget{
  const dashboard ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
  return Scaffold(
    appBar:  AppBar(
        backgroundColor: Color.fromARGB(255, 12, 110, 190),
        leading: IconButton(
          icon: const Icon(Icons.assignment, size: 30,),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('M-Logistik',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w800
        ),),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.account_circle, size: 50,),
            tooltip: 'My Profile',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          ),
        ],
    ),
    body: Center(
        
        child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget> [
            Container(
              height:  MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width / 2,
              margin: EdgeInsets.only(top: 30, bottom: 10),
              decoration: BoxDecoration(
               boxShadow: [
               BoxShadow(
               color: Color.fromARGB(255, 0, 99, 180),
                blurRadius: 30,
                ),
               ],
              color: Color.fromARGB(255, 253, 253, 253),
              border: Border.all(color: Color(0xff475BD8)),
              borderRadius: BorderRadius.circular(30)),
              child : GestureDetector(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context){
                        return dashboards();
                      },
                      ),
                  );
                  
                },
              
              child: Column( 
              
              mainAxisAlignment: MainAxisAlignment.center, 
              children :<Widget>[
                  Text("Dashboard",
                 textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'David Libre',
                    color: Colors.black,
              ),),],
              ),),),

           
              Container(
              height:  MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width / 2,
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
               boxShadow: [
               BoxShadow(
               color: Color.fromARGB(255, 0, 99, 180),
                blurRadius: 30,
                ),
               ],
              color: Color.fromARGB(255, 253, 253, 253),
              border: Border.all(color: Color(0xff475BD8)),
              borderRadius: BorderRadius.circular(30)),
              child : GestureDetector(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context){
                        return SuratPengajuanPage();
                      },
                      ),
                  );
                  
                },   
              child: Column( 
              mainAxisAlignment: MainAxisAlignment.center, 
              children :<Widget>[
                  Text("Surat Pengajuan",
                 textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'David Libre',
                    color: Colors.black,
              ),),],
              ),),),

              Container(
              height: MediaQuery.of(context).size.height *0.15,
              width: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
               boxShadow: [
               BoxShadow(
               color: Color.fromARGB(255, 0, 99, 180),
                blurRadius: 30,
                ),
               ],
               
              color: Color.fromARGB(255, 253, 253, 253),
              border: Border.all(color: Color(0xff475BD8)),
              borderRadius: BorderRadius.circular(30)),
              child : GestureDetector(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context){
                        return PengirimanLaporan();
                      },
                      ),
                  );
                  
                },   
              child: Column(
              
              mainAxisAlignment: MainAxisAlignment.center,  
              children :<Widget>[
                  Text("Laporan Rutin",
                 textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'David Libre',
                    color: Colors.black,
              ),),],
              ),),),
              ],
            ),)
                  
          
        ),
  
  );
  }
}