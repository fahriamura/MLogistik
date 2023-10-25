import 'package:flutter/material.dart';

PreferredSizeWidget? appBar(BuildContext context) {
  return AppBar(
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
    );
}

Widget bottomAppBar(BuildContext context) {
  return BottomAppBar(
    child: SizedBox(
      height: kBottomNavigationBarHeight,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              if (ModalRoute.of(context)?.settings.name != '/home') {
                Navigator.pushNamed(context, '/home');
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: () {
              if (ModalRoute.of(context)?.settings.name != '/saved') {
                Navigator.pushNamed(context, '/saved');
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              if (ModalRoute.of(context)?.settings.name != '/history') {
                Navigator.pushNamed(context, '/history');
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              if (ModalRoute.of(context)?.settings.name != '/profile') {
                Navigator.pushNamed(context, '/profile');
              }
            },
          )
        ],
      ),
    ),
  );
}

List<TableRow> createRows(List surat){
  List<TableRow> table = [
    TableRow(children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        color : Color.fromARGB(255, 6, 29, 231),
        child: Column(
          children : [
            Text(
              "Tanggal Pengajuan",
              style: TextStyle(
                fontSize: 15
              ),
            )
          ]
        )
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        color : Color.fromARGB(255, 6, 29, 231),
        child: Column(
          children : [
            Text(
              "Topik Surat Pengajuan",
              style: TextStyle(
                fontSize: 15
              ),
            )
          ]
        )
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        color : Color.fromARGB(255, 6, 29, 231),
        child: Column(
          children : [
            Text(
              "Status",
              style: TextStyle(
                fontSize: 15
              ),
            )
          ]
        )
      )
    ]

    )
  ];

  if(surat.isNotEmpty){
    for(int i = 0 ;i<2;i++){
      table.add(TableRow(children:[
        Container(
          padding : const EdgeInsets.symmetric(horizontal: 10),
          color: Color.fromARGB(255, 255, 255, 255),
          child : Column(
            children: [
              Text(
                "${surat[i][0]}",
              )
            ],
          )
        ),
        Container(
          padding : const EdgeInsets.symmetric(horizontal: 10),
          color: Color.fromARGB(255, 255, 255, 255),
          child : Column(
            children: [
              Text(
                "${surat[i][1]}",
              )
            ],
          )
        ),
        Container(
          padding : const EdgeInsets.symmetric(horizontal: 10),
          color: Color.fromARGB(255, 255, 255, 255),
          child : Column(
            children: [
              Text(
                "${surat[i][2]}",
              )
            ],
          )
        )
      ]
      ),);
    }
  }
  return table;
}