import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_app/interfaces/interface3.dart';
import 'package:taxi_app/main.dart';


class interface2 extends StatefulWidget {
  const interface2({Key? key}) : super(key: key);

  @override
  State<interface2> createState() => _MyAppState();
}

class _MyAppState extends State<interface2> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CupertinoNavigationBar(
          leading: Text(
            'Taxi!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.transparent,
          trailing: CupertinoButton(
            padding: EdgeInsets.all(0),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
              );
            },
            child: Icon(
              CupertinoIcons.line_horizontal_3,
              color: Colors.white,
            ),
          ),
        ),
        body: Stack(
          children: [
            DarkModeMap(),
            Positioned(
              top: 20,
                right: 0,
                left: 0,
                child: Container(
                  width: 50,
                  height: 125,
                  padding: EdgeInsets.fromLTRB(30, 60, 30, 0),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1),
                    border: Border.all(
                    ),
                      borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          hintText: '1298 La Playa St, San Francisco',
                          hintStyle: TextStyle(
                            color: Colors.white
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                )

            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: 300,
                height: 250,
                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigate to another page here
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => interface3()),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 50),
                        padding: EdgeInsets.fromLTRB(5, 5, 25, 1),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: CarInfoContainer(
                          image: "car1.png",
                          description: "BMW 7 series",
                          info: '\$5.95 | 1-3 min',
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10,0, 10, 50),
                      padding: EdgeInsets.fromLTRB(5, 5, 25, 1),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: CarInfoContainer(
                        image: "car2.png",
                        description: "Mercedes-Benz",
                        info: '6.35 | 1-3 min',
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10,0, 10, 50),
                      padding: EdgeInsets.fromLTRB(5, 5, 25, 1),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: CarInfoContainer(
                        image: "car1.png",
                        description: "BMW 7 series",
                        info: '\$7.25 | 1-3 min',
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10,0, 10, 50),
                      padding: EdgeInsets.fromLTRB(5, 5, 25, 1),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: CarInfoContainer(
                        image: "car2.png",
                        description: "Mercedes-Benz",
                        info: '\$8.45 | 1-3 min',
                      ),
                    ),
                   // I can repeat for other car models here
                  ],
                ),
              ),
            )


          ],
        ),
      ),
    );
  }
}

class CarInfoContainer extends StatelessWidget {
  final String image;
  final String description;
  final String info;
  CarInfoContainer({required this.image, required this.description, required this.info});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text('Business',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, ),
            ),
          ),    // to align the text to the top left of the container it is in.

          Image.asset('images/$image', height: 100, width: 150),
          SizedBox(height: 2),
          Text(
            description,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(info,
            style: TextStyle(color: Colors.white),
          ),

        ],
      ),
    );
  }
}



class TransparentBoxWithEdges extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: Colors.white,
          width: 1.0,
        ),
      ),
    );
  }
}

class SmallTransparentBoxWithEdges extends StatelessWidget {
  final Widget? child;

  SmallTransparentBoxWithEdges({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: Colors.white,
          width: 1.0,
        ),
      ),
      child: Center(child: child),
    );
  }
}



class DarkModeMap extends StatefulWidget {
  const DarkModeMap({Key? key}) : super(key: key);

  @override
  _DarkModeMapState createState() => _DarkModeMapState();
}

class _DarkModeMapState extends State<DarkModeMap> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(4.0511, 9.7679);

  @override
  Widget build(BuildContext context) {
    void _onMapCreated(GoogleMapController controller) {
      mapController = controller;
      setMapStyle();
    }

    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 12.0,
      ),
      compassEnabled: false,
      myLocationButtonEnabled: false,
      myLocationEnabled: false,
      mapToolbarEnabled: false, // Disable the default zoom controls
      markers: Set(),
    );
  }

  void setMapStyle() async {
    // Loading the dark mode style from JSON file
    String darkMapStyle =
    await DefaultAssetBundle.of(context).loadString('assets/dark_map_style.json');
    mapController.setMapStyle(darkMapStyle);
  }
}