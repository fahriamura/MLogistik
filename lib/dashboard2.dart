import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logistik/dashboard.dart';
import 'package:logistik/dashboards.dart';
import 'package:logistik/services/api_service.dart';
import 'package:logistik/widget.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class dashboard2 extends StatefulWidget {
  const dashboard2({super.key});

  @override
  State<dashboard2> createState() => _dashboard2State();
}

class _dashboard2State extends State<dashboard2> {
  final List<SubscriberSeries> data = [];
  List rawData = [];
  int totalItems = 0;
  int totalHarga = 0;

  late Future updateDataFuture;

  @override
  void initState() {
    super.initState();
    updateDataFuture = updateData();
  }

  Future updateData() async {
    rawData = await SetupAPI().getDataBarang();
    int itemQ = 0;
    int itemsHarga = 0;
    for (int i = 0; i < rawData.length; i++) {
      data.add(SubscriberSeries(
          year: rawData[i][0],
          subscribers: rawData[i][1],
          barColor: charts.ColorUtil.fromDartColor(Colors.cyan)));
      int itemQuantity = rawData[i][1];
      int itemHarga = rawData[i][2];
      itemQ = itemQ + itemQuantity;
      itemsHarga = itemsHarga + itemHarga;
    }
    totalItems = itemQ;
    totalHarga = itemsHarga;
  }

  @override
  Widget build(BuildContext context) {
    List<charts.Series<SubscriberSeries, String>> series = [
      charts.Series(
          id: "Ringkasan Inventaris",
          data: data,
          domainFn: (SubscriberSeries series, _) => series.year,
          measureFn: (SubscriberSeries series, _) => series.subscribers,
          colorFn: (SubscriberSeries series, _) => series.barColor)
    ];
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
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Ringkasan Investaris",
                          style: TextStyle(
                              fontSize: calculateFontSize(context, 20),
                              fontFamily: 'David Libre'),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                topLeft: Radius.circular(30))),
                        child: Container(
                          height: 400,
                          padding: const EdgeInsets.all(20),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  Expanded(
                                    child:
                                        charts.BarChart(series, animate: true),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.25,
                        width: double.infinity,
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.all(16),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30))),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text(
                                "Total",
                                style: TextStyle(
                                    fontSize: calculateFontSize(context, 20),
                                    fontFamily: 'David Libre',
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    margin: const EdgeInsets.only(left: 30),
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          offset: Offset(0, 5),
                                          blurRadius: 20,
                                        ),
                                      ],
                                      color: const Color.fromARGB(
                                          255, 253, 253, 253),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.dynamic_feed,
                                          color: Colors.green,
                                        ),
                                        Text(
                                          totalItems.toString(),
                                          style: TextStyle(
                                              fontSize:
                                                  calculateFontSize(context, 8),
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'David Libre'),
                                        ),
                                        Text(
                                          "Total Kuantitas",
                                          style: TextStyle(
                                              fontFamily: "David Libre",
                                              fontSize: calculateFontSize(
                                                  context, 5)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(right: 30),
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          offset: Offset(0, 5),
                                          blurRadius: 20,
                                        ),
                                      ],
                                      color: const Color.fromARGB(
                                          255, 253, 253, 253),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.payment,
                                          color:
                                              Color.fromARGB(255, 203, 239, 4),
                                        ),
                                        Text(
                                          totalHarga.toString(),
                                          style: TextStyle(
                                              fontSize:
                                                  calculateFontSize(context, 8),
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'David Libre'),
                                        ),
                                        Text(
                                          "Total Nilai",
                                          style: TextStyle(
                                              fontFamily: "David Libre",
                                              fontSize: calculateFontSize(
                                                  context, 5)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              TextButton(
                                  onPressed: () {
                                    Route route = MaterialPageRoute(
                                        builder: (context) =>
                                            const Dashboards());
                                    Navigator.push(context, route);
                                  },
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    width: MediaQuery.of(context).size.height *
                                        0.05,
                                    decoration: const BoxDecoration(
                                      color: Colors.blue,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
          },
        ),
        bottomNavigationBar: bottomAppBarUpdateDashboard(context));
  }
}
