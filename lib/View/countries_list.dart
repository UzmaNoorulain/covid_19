import 'package:covid_19/Services/states_services.dart';
import 'package:covid_19/View/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({super.key});

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 30,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.black26,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // RoundedSearchInput(
            //   textController: searchController,
            //   hintText: 'Search with country name...', onChanged: () { setState(() {
            //
            //   }); },
            // ),
            ///! Search Bar
            Container(
              margin: EdgeInsets.only(right: 15, left: 15),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    offset: const Offset(12, 26),
                    blurRadius: 50,
                    spreadRadius: 0,
                    color: Colors.grey.withOpacity(.1)),
              ]),
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                controller: searchController,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white70,
                  ),
                  filled: true,
                  fillColor: Colors.black45,
                  hintText: 'Search with country name',
                  hintStyle: const TextStyle(
                      color: Colors.white70, fontWeight: FontWeight.w300),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 20.0),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(45.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(45.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1.5),
                    borderRadius: BorderRadius.all(Radius.circular(45.0)),
                  ),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                  future: statesServices.countriesListApi(),
                  builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                    if (!snapshot.hasData) {
                      return ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Shimmer.fromColors(
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: Colors.white,
                                    ),
                                    title: Container(
                                      height: 15,
                                      width: 40,
                                      color: Colors.white,
                                    ),
                                    subtitle: Container(
                                      height: 15,
                                      width: 80,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                              baseColor: Colors.grey.shade700,
                              highlightColor: Colors.grey.shade100);
                        },
                      );
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          String name =
                              snapshot.data![index]['country'].toString();
                          if (searchController.text.isEmpty) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsScreen(
                                      image: snapshot.data![index]
                                          ['countryInfo']['flag'],
                                      name: snapshot.data![index]['country']
                                          .toString(),
                                      todayRecovered: snapshot.data![index]
                                              ['todayRecovered']
                                          .toString(),
                                      critical: snapshot.data![index]
                                              ['critical']
                                          .toString(),
                                      active: snapshot.data![index]['active']
                                          .toString(),
                                      test: snapshot.data![index]['tests']
                                          .toString(),
                                      totalCases: snapshot.data![index]['cases']
                                          .toString(),
                                      totalDeaths: snapshot.data![index]
                                              ['deaths']
                                          .toString(),
                                      totalRecovered: snapshot.data![index]
                                              ['todayRecovered']
                                          .toString(),
                                    ),
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage: NetworkImage(snapshot
                                          .data![index]['countryInfo']['flag']),
                                    ),
                                    title: Text(
                                      snapshot.data![index]['country']
                                          .toString(),
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    subtitle: Text(
                                      'Cases : ' +
                                          snapshot.data![index]['cases']
                                              .toString(),
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            );
                          } else if (name
                              .toLowerCase()
                              .contains(searchController.text.toLowerCase())) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsScreen(
                                      image: snapshot.data![index]
                                      ['countryInfo']['flag'],
                                      name: snapshot.data![index]['country']
                                          .toString(),
                                      todayRecovered: snapshot.data![index]
                                      ['todayRecovered']
                                          .toString(),
                                      critical: snapshot.data![index]
                                      ['critical']
                                          .toString(),
                                      active: snapshot.data![index]['active']
                                          .toString(),
                                      test: snapshot.data![index]['tests']
                                          .toString(),
                                      totalCases: snapshot.data![index]['cases']
                                          .toString(),
                                      totalDeaths: snapshot.data![index]
                                      ['deaths']
                                          .toString(),
                                      totalRecovered: snapshot.data![index]
                                      ['todayRecovered']
                                          .toString(),
                                    ),
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage: NetworkImage(snapshot
                                          .data![index]['countryInfo']['flag']),
                                    ),
                                    title: Text(
                                      snapshot.data![index]['country'].toString(),
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    subtitle: Text(
                                      'Cases : ' +
                                          snapshot.data![index]['cases']
                                              .toString(),
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            );
                          } else {
                            return Container();
                          }
                        },
                      );
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
