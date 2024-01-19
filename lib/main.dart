// main.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_app/interfaces/interface3.dart';

import 'interfaces/interface2.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {

    final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();   // use this for navigation
    return MaterialApp(
      navigatorKey: navigatorKey,
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

            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.white,
                  width: 1.0,
                ),
              ),
              child: Icon(
                CupertinoIcons.line_horizontal_3,
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            DarkModeMap(),
            Positioned(
              top: 300,
              right: 16,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.arrow_up_left_square,
                    color: Colors.white,
                    size: 40,
                  ),
                  SizedBox(height: 15),
                  Icon(
                    CupertinoIcons.plus_square,
                    color: Colors.white,
                    size: 40,
                  ),
                  SizedBox(height: 15),
                  Icon(
                    CupertinoIcons.minus_square,
                    color: Colors.white,
                    size: 40,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: 300,
                height: 250,
                padding: EdgeInsets.fromLTRB(30, 30, 0, 0),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.8),
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '8 drivers nearby',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '1-3 min',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Where to',
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        suffixIcon: Icon(
                          CupertinoIcons.arrow_right,
                          color: Colors.white,
                        ),

                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                          ),
                          onPressed: () {
                           //
                          },
                          child: Text('Economy'),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                          ),
                          onPressed: () {},
                          child: Text('Comfort'),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                          ),
                          onPressed: () {
                            navigatorKey.currentState?.push(
                              MaterialPageRoute(
                                builder: (context) => interface2(),
                              ),
                            );
                          },
                          child: Text('Business'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
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
      mapToolbarEnabled: false,
      markers: Set(),
      zoomControlsEnabled: false, // Disable default zoom buttons
    );
  }

  void setMapStyle() async {
    String darkMapStyle =
    await DefaultAssetBundle.of(context).loadString('assets/dark_map_style.json');
    mapController.setMapStyle(darkMapStyle);
  }
}
