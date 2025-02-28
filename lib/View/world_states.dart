import 'package:covid_19/Model/WorldStatesModel.dart';
import 'package:covid_19/Services/states_services.dart';
import 'package:covid_19/View/countries_list.dart';
import 'package:covid_19/Widgets/tracker_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStatesScreen extends StatefulWidget {
  const WorldStatesScreen({super.key});

  @override
  State<WorldStatesScreen> createState() => _WorldStatesScreenState();
}

class _WorldStatesScreenState extends State<WorldStatesScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 3))
        ..repeat();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  final colorList = <Color>[
    const Color(0xff4285F4),
    const Color(0xff1aa260),
    const Color(0xffde5246),
  ];

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    return Scaffold(
      backgroundColor: Colors.black12,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              FutureBuilder(
                future: statesServices.fetchWorldStatesModel(),
                builder: (context, AsyncSnapshot<WorldStatesModel?> snapshot) {
                  if (!snapshot.hasData) {
                    return Expanded(
                        child: SpinKitFadingCircle(
                      color: Colors.white,
                      size: 50.0,
                      controller: _controller,
                    ));
                  } else {
                    return Column(
                      children: [
                        PieChart(
                          dataMap:  {
                            "Total": double.parse(snapshot.data!.cases!.toString()),
                            "Recovered": double.parse(snapshot.data!.recovered.toString()),
                            "Deaths": double.parse(snapshot.data!.deaths!.toString())
                          },
                          chartValuesOptions: const ChartValuesOptions(
                            showChartValuesInPercentage: true
                          ),
                          animationDuration: const Duration(milliseconds: 1200),
                          chartType: ChartType.ring,
                          colorList: colorList,
                          chartRadius: MediaQuery.of(context).size.width / 2.7,
                          legendOptions: const LegendOptions(
                            // legendShape: BoxShape.rectangle,
                            legendPosition: LegendPosition.left,
                            legendTextStyle: TextStyle(
                              color: Colors.white,
                              // Set the text color to white
                              fontWeight:
                                  FontWeight.bold, // Optional: Add bold style
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).size.height * .01),
                          child:Card(
                            elevation: 5, // Add shadow to give depth
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15), // Rounded corners
                            ),
                            color: Colors.black87, // Dark background for better blending with scaffold
                            child: Padding(
                              padding: const EdgeInsets.all(0), // Add padding for better spacing
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start, // Align content to the left
                                children: [
                                  ReusableRow(
                                    title: 'Total',
                                    value: snapshot.data!.cases.toString(),
                                  ),
                                  ReusableRow(
                                    title: 'Deaths',
                                    value: snapshot.data!.deaths.toString(),
                                  ),
                                  ReusableRow(
                                    title: 'Recovered',
                                    value: snapshot.data!.recovered.toString(),
                                  ),
                                  ReusableRow(
                                    title: 'Active',
                                    value: snapshot.data!.active.toString(),
                                  ),
                                  ReusableRow(
                                    title: 'Critical',
                                    value: snapshot.data!.critical.toString(),
                                  ),
                                  ReusableRow(
                                    title: 'Today Cases',
                                    value: snapshot.data!.todayCases.toString(),
                                  ),
                                  ReusableRow(
                                    title: 'Today Death',
                                    value: snapshot.data!.todayDeaths.toString(),

                                  ),
                                  ReusableRow(
                                    title: 'Today Recovered',
                                    value: snapshot.data!.todayRecovered.toString(),

                                  ),
                                ],
                              ),
                            ),
                          )

                          // Card(
                          //   color: Colors.white12,
                          //   child: Column(
                          //     children: [
                          //       ReusableRow(title: 'Total', value: snapshot.data!.cases.toString()),
                          //       ReusableRow(title: 'Deaths', value: snapshot.data!.deaths.toString()),
                          //       ReusableRow(title: 'Recovered', value: snapshot.data!.recovered.toString()),
                          //       ReusableRow(title: 'Active', value: snapshot.data!.active.toString()),
                          //       ReusableRow(title: 'Critical', value: snapshot.data!.critical.toString()),
                          //       ReusableRow(title: 'Today Cases', value: snapshot.data!.todayCases.toString()),
                          //       ReusableRow(title: 'Today Death', value: snapshot.data!.todayDeaths.toString()),
                          //       ReusableRow(title: 'Today Recoverd', value: snapshot.data!.todayRecovered.toString()),
                          //     ],
                          //   ),
                          // ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .03,
                        ),
                        GradientButtonFb4(text: 'Track Countries', onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>CountriesListScreen()));
                        })
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  String title, value;

  ReusableRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(color: Colors.white),
              ),
              Text(
                value,
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Divider(color: Colors.grey.shade700,),
        ],
      ),
    );
  }
}
