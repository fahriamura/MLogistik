import 'package:flutter/material.dart';

class dashboards extends StatelessWidget{
  const dashboards ({Key? key}) : super(key: key);
 @override
  Widget build(BuildContext context){
  return Scaffold(
    backgroundColor: Colors.blue,
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Container(
            height: 500,
            width: MediaQuery.of(context).size.width / 2,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white ,
              borderRadius: BorderRadius.circular(30)),
              child : Column(
              children :<Widget>[
                  Text("Update Dashboard",
                  style: TextStyle(
                    fontSize: 40,
                  ),),
                  const SizedBox(height: 30,),
                  Container(
                  height : 50,
                  width :double.infinity,
                  padding:EdgeInsets.all(16),
                  decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color.fromARGB(255, 5, 5, 6)),
                  borderRadius: BorderRadius.circular(10)),
                  child :TextFormField(
                    decoration: InputDecoration.collapsed(hintText: "Masukkan Nama Barang.."),
                ),),
                const SizedBox(height: 30,),
                Container(
                  height : 50,
                  width :double.infinity,
                  padding:EdgeInsets.all(16),
                  decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color.fromARGB(255, 5, 5, 6)),
                  borderRadius: BorderRadius.circular(10)),
                  child :TextFormField(
                    decoration: InputDecoration.collapsed(hintText: "Masukkan Jumlah Barang.."),
                ),),
                                const SizedBox(height: 30,),
                Container(
                  height : 50,
                  width :double.infinity,
                  padding:EdgeInsets.all(16),
                  decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color.fromARGB(255, 5, 5, 6)),
                  borderRadius: BorderRadius.circular(10)),
                  child :TextFormField(
                    decoration: InputDecoration.collapsed(hintText: "Masukkan Keadaan Barang.."),
                ),),
                                const SizedBox(height: 30,),
                Container(
                  height : 50,
                  width :double.infinity,
                  padding:EdgeInsets.all(16),
                  decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color.fromARGB(255, 5, 5, 6)),
                  borderRadius: BorderRadius.circular(10)),
                  child :TextFormField(
                    decoration: InputDecoration.collapsed(hintText: "Masukkan Harga Barang.."),
                ),),
                SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(onPressed: () {}, 
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                        Color.fromARGB(255, 3, 3, 251)                   ),
                    ),
                    child:
                    Text("Update",
                    style: TextStyle(
                      color: Colors.white
                    ),),),
                    ElevatedButton(onPressed: () {}, 
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                        Color.fromARGB(255, 3, 3, 251)                   ),
                    ),
                    child:
                    Text("Cancel",
                    style: TextStyle(
                      color: Colors.white
                    ),),),
                  ],
                )
                ],)
            ),
                  
          ],
          
          ),
                 
            ),
          )
        
      );

 
}

}