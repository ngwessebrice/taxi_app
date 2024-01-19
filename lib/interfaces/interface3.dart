import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class interface3 extends StatefulWidget {
  const interface3({Key? key}) : super(key: key);

  @override
  State<interface3> createState() => _MyAppState();
}

class _MyAppState extends State<interface3> {
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
              Navigator.pop(context);
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
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 500,
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  margin: EdgeInsets.fromLTRB(0,0, 0, 0),
                  padding: EdgeInsets.fromLTRB(5, 5, 25, 1),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      CarInfoContainer(
                        image: "car1big.png",
                        description: "BMW 7 series",
                        info: '\$6.55 | 1-3 min',
                      ),

                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(13,15, 0, 0),
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            decoration: BoxDecoration(
                              color: Colors.white10,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                              BelowCarInfoContainer(
                              Icon: "Avatar.png",
                              description: "James Marcus",
                              info: 'Your driver',
                            ),
                            ],
                          ),
                          ),

                          Container(
                            margin: EdgeInsets.fromLTRB(13,15, 0, 0),
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            decoration: BoxDecoration(
                              color: Colors.white10,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                BelowCarInfoContainer(
                                  Icon: "StarIcon.png",
                                  description: "4.98",
                                  info: 'Trip rating',
                                ),
                              ],
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.fromLTRB(13,15, 0, 0),
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            decoration: BoxDecoration(
                              color: Colors.white10,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                BelowCarInfoContainer(
                                  Icon: "FireIcon.png",
                                  description: "1298",
                                  info: 'Completed trips',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    SizedBox(height: 20),

                      Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      radius: 10,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Pick up',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            '138 Mission St',
                                            style: TextStyle(fontSize: 16, color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '1-3 min',
                                    style: TextStyle(fontSize: 14, color: Colors.white),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      radius: 10,
                                      backgroundColor: Colors.white,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Drop off',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            '1298 La Playa St',
                                            style: TextStyle(fontSize: 16, color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '10:25 AM',
                                    style: TextStyle(fontSize: 14, color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Positioned(   // the vertical line touching both circular avatars
                            left: 17,
                            top: 28,
                            bottom: 28,
                            child: Container(
                              width: 2, // Adjust the width of the vertical line
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),


                      SizedBox(height: 20,),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 110), backgroundColor: Colors.blue),
                          onPressed: () => (),
                          child: Text('Order a taxi'),
                      )
                  ],
                ),


              ),

            ),

            ),
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
      width: 200,
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [

          Image.asset('images/$image', height: 100, width: 210),
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


class BelowCarInfoContainer extends StatelessWidget {
  final String Icon;
  final String description;
  final String info;
  BelowCarInfoContainer({required this.Icon, required this.description, required this.info});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Column(
        children: [

          Image.asset('images/$Icon', height: 100, width: 210),
          SizedBox(height: 2),
          Text(
            description,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),
          ),
          Text(info,
            style: TextStyle(color: Colors.white, fontSize: 9),
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