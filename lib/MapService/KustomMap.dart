import 'dart:async';

import 'package:flutter/material.dart';

// import 'package:google_map_flutter/location_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart'; //var location = new Location();
import 'package:http/http.dart' as http;
import 'package:decimal/decimal.dart';
import 'dart:math';

// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Google Maps Demo',
//       home: KustomMap(),
//     );
//   }
// }

class KustomMap extends StatefulWidget {
  @override
  State<KustomMap> createState() => KustomMapState();
}

class KustomMapState extends State<KustomMap> {
  // declare parameters --------------------------------------------------------------------------------------------
  Completer<GoogleMapController> _controller = Completer();
  TextEditingController _originController = TextEditingController();
  TextEditingController _destinationController = TextEditingController();
  Set<Marker> _markers = Set<Marker>();
  Set<Polygon> _polygons = Set<Polygon>();
  Set<Polyline> _polylines = Set<Polyline>();
  List<LatLng> polygonsLatLngs = <LatLng>[];
  int _polygonIdCounter = 1;
  int _polylineIdCounter = 1;
  Location location = new Location();
  bool? _serviceEnabled;
  PermissionStatus? _permissionGranted;
  LocationData? _locationData;
  late CameraPosition _cameraPosition;

  double startLat = 0.0;
  double startLng = 0.0;

  static bool sqlFlag = true;
  int _driverID = 0;

  TextEditingController _drivername = TextEditingController();
  TextEditingController _carnumber = TextEditingController();


  // I am going to make moveable cameraposition
  // step1 create googlemap controller
  GoogleMapController? _googleMapController;

  // declare parameters --------------------------------------------------------------------------------------------

  // set default coordination of CameraPosition --------------------------------------------------------------------
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(25.033980301361304, 121.56454178002542),
    zoom: 14.4746,
  );

  //這裡要思考怎麼一開始就載入初始位置
  // static final CameraPosition _myPosition = CameraPosition(target: LatLng(1.0, 1.0), zoom: 15);

  // set default coordination of CameraPosition --------------------------------------------------------------------

  @override
  void initState() {
    super.initState();
    _chkLocationService(); //取得初始位置
    //_setMarker(LatLng(37.42796133580664, -122.085749655962));
    _listeningPosition();
  }

  Future<String?> getLat() async {
    _locationData = await location.getLocation();
    startLat = _locationData!.latitude!;
    return _locationData!.latitude.toString();
  }

  Future<String?> getLng() async {
    _locationData = await location.getLocation();
    startLng = _locationData!.longitude!;
    return _locationData!.longitude.toString();
  }

  void _chkLocationService() async {
    //檢查權限
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled!) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled!) {
        return;
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    //獲得初始位置
    _locationData = await location.getLocation();
    _originController.text = _locationData.toString();

    _cameraPosition = CameraPosition(
        target: LatLng(_locationData!.latitude!, _locationData!.longitude!));

    // _setMarker(LatLng(_locationData!.latitude!, _locationData!.longitude!));
    //CameraPosition _kGooglePlex2 = CameraPosition(target: LatLng(_locationData!.latitude!, _locationData!.longitude!), zoom: 15);

    location.onLocationChanged.listen((event) {
      print(_locationData);
    });
  }

  void _setMarker(LatLng point) {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('marker'),
          position: point,
        ),
      );
    });
  }

  void _setPolygon() {
    final String polygonIdVal = 'polygon_$_polygonIdCounter';
    _polygonIdCounter++;

    _polygons.add(
      Polygon(
          polygonId: PolygonId(polygonIdVal),
          points: polygonsLatLngs,
          strokeWidth: 2,
          fillColor: Colors.transparent),
    );
  }

  // void _setPolyline(List<PointLatLng> points) {
  //   final String polylineIdVal = 'polygon_$_polylineIdCounter';
  //   _polylineIdCounter++;
  //
  //   _polylines.add(
  //     Polyline(
  //       polylineId: PolylineId(polylineIdVal),
  //       width: 2,
  //       color: Colors.blue,
  //       points: points
  //           .map(
  //             (point) => LatLng(point.latitude, point.longitude),
  //       )
  //           .toList(),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps'),
      ),
      body: Container(child: Column(
        children: <Widget>[
          Container(
            child: TextField(
              controller: _drivername,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Driver_Name',
              ),
            ),
          ),
          Container(
            child: TextField(
              controller: _carnumber,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Car_number',
              ),
            ),
          ),
          // Row(
          //   children: <Widget>[
          //
          //
          //     // Expanded(
          //     //   child: Column(
          //     //     children: [
          //     //       TextFormField(
          //     //         controller: _originController,
          //     //         decoration: InputDecoration(hintText: 'Origin'),
          //     //         onChanged: (value) {
          //     //           print(value);
          //     //         },
          //     //       ),
          //     //       TextFormField(
          //     //         controller: _destinationController,
          //     //         decoration: InputDecoration(hintText: 'Destination'),
          //     //         onChanged: (value) {
          //     //           print(value);
          //     //         },
          //     //       ),
          //     //     ],
          //     //   ),
          //     // ),
          //     // IconButton(
          //     //   onPressed: () async {
          //     //     // var directions = await LocationService().getDirections(
          //     //     //   _originController.text,
          //     //     //   _destinationController.text,
          //     //     // );
          //     //     // _goToPlace(
          //     //     //   directions['start_location']['lat'],
          //     //     //   directions['start_location']['lng'],
          //     //     //   directions['bounds_ne'],
          //     //     //   directions['bounds_sw'],
          //     //     // );
          //     //     _getCurrentPosition(
          //     //         _locationData!.latitude!, _locationData!.longitude!);
          //     //     // _setPolyline(directions['polyline_decoded']);
          //     //   },
          //     //   icon: Icon(Icons.search),
          //     // ),
          //   ],
          // ),
          Container(
            height: 150,
            child: Padding(
              padding: const EdgeInsets.only(bottom:8.0),
              child: Expanded(
                child: GoogleMap(
                  myLocationEnabled: true,
                  //20220425 add
                  mapType: MapType.normal,
                  // 改變地圖樣式
                  markers: _markers,
                  polygons: _polygons,
                  polylines: _polylines,
                  initialCameraPosition: _kGooglePlex,
                  // initialCameraPosition: CameraPosition(target: _initialcameraposition),
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                  onTap: (point) {
                    setState(() {
                      polygonsLatLngs.add(point);
                      _setPolygon();
                    });
                  },
                ),
              ),
            ),
          ),
          OutlinedButton(
            onPressed: () {
              _updatePosition();
              // print(_drivername.text+"_____"+_carnumber.text);
            },
            child: Text('Click Me'),
          ),
          OutlinedButton(
            onPressed: () {
              _updatePosition();
            },
            child: Text('Update Position'),
          ),
        ],
      ),),
    );
  }

  Future<void> _goToPlace(
      double lat,
      double lng,
      Map<String, dynamic> boundsNe,
      Map<String, dynamic> boundsSw,
      ) async {
    // final lat = place['geometry']['location']['lat'];
    // final lng = place['geometry']['location']['lng'];
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lng), zoom: 12),
      ),
    );
    controller.animateCamera(
      CameraUpdate.newLatLngBounds(
          LatLngBounds(
            southwest: LatLng(boundsSw['lat'], boundsSw['lng']),
            northeast: LatLng(boundsNe['lat'], boundsNe['lng']),
          ),
          25),
    );
    _setMarker(LatLng(lat, lng));
  }

  Future<void> _getCurrentPosition(double lat, double lng) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lng), zoom: 15)));
  }

  Future<void> _listeningPosition() async {
    while (true) {
      _locationData = await location.getLocation();
      _originController.text = _locationData.toString();
      _getCurrentPosition(_locationData!.latitude!, _locationData!.longitude!);
      _setMarker(LatLng(_locationData!.latitude!, _locationData!.longitude!));
      await Future.delayed(Duration(seconds: 10));
    }
  }

  // Zac Test
  // DB Data Type
  // 1 t_dri_id int(11)
  // 2 t_locate_id int(11)
  // 3 t_locate_lat decimal(10,6)
  // 4 t_locate_lng decimal(10,6)
  // 5 t_locate_time timestamp
  // 6 t_box_id int(20)

  //ignored 5 timestamp

  _updatePosition() {
    Random random = Random();
    int driverID = random.nextInt(9999); //測試用隨機產生司機的ID
    int locateID = random.nextInt(9999);
    int boxID = random.nextInt(9999);


    print(sqlFlag.toString());
    if(sqlFlag){ //初始值是true
      _driverID = driverID;
    }

    //LatLng(_locationData!.latitude!, _locationData!.longitude!)
    print(_driverID.toString() +" || "+ _drivername.text+" || "+ _carnumber.text+" || "+ _locationData!.latitude!.toString()+" || "+ _locationData!.longitude!.toString()+" || "+sqlFlag.toString());
    updatePosition(_driverID, _drivername.text, _carnumber.text, _locationData!.latitude!,
        _locationData!.longitude!)
        .then((result) {
      print(result);
      if ("success" == result) {
        print("Add coordinate Successed!!");
      }
    });
  }

  static Future<String> updatePosition(int driver_id, String t_dri_name,
      String t_car_num, double lat, double lng) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = "map";
      map['t_dri_id'] = driver_id.toString();
      map['t_dri_name'] = t_dri_name;
      map['t_car_num'] = t_car_num;
      map['lat'] = lat.toString();
      map['lng'] = lng.toString();
      map['sqlFlag'] = sqlFlag.toString();
      final response = await http.post(
        // Uri.parse('http://192.168.31.167:8888/driverlocate.php'),
          Uri.parse('http://shyecheng.new.n9s.com/driverlocate.php'),
          body: map);
      print('addEmployee Response: ${response.body}');
      if (200 == response.statusCode) {
        if(sqlFlag){
          sqlFlag = false;
        }
        return response.body;
      } else {
        return "PHP1 : error";
      }
    } catch (e) {
      return "PHP2 : error: " + e.toString();
    }
  }
}
