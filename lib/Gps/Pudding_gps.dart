import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class PuddingGps extends StatefulWidget {
  const PuddingGps({super.key});

  @override
  State<PuddingGps> createState() => _PuddingGpsState();
}

class _PuddingGpsState extends State<PuddingGps> {
  static const double targetLat = 18.343878389821683;
  static const double targetLng = 99.48440925616934;

  double? currentLat;
  double? currentLng;
  double distance = 0;
  final MapController _mapController = MapController();

  Future<void> _requestPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      await Geolocator.requestPermission();
    }
  }

  Future<void> _getCurrentPosition() async {
    await _requestPermission();
    Position pos = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    setState(() {
      currentLat = pos.latitude;
      currentLng = pos.longitude;
      distance =
          Geolocator.distanceBetween(
            currentLat!,
            currentLng!,
            targetLat,
            targetLng,
          ) /
          1000;
    });
    _mapController.move(LatLng(currentLat!, currentLng!), 15);
  }

  Future<void> _openGoogleMapLink() async {
    final Uri url = Uri.parse(
      'https://www.google.com/maps/place/%E0%B8%AB%E0%B8%A7%E0%B8%B2%E0%B8%99%E0%B8%A5%E0%B8%B0%E0%B9%84%E0%B8%A1+%E0%B8%A5%E0%B8%B3%E0%B8%9B%E0%B8%B2%E0%B8%87+Waan+Lamai+Lampang/@18.5260259,98.5453368,9z/data=!4m10!1m2!2m1!1s+wann+la+mai!3m6!1s0x30d96df8ade3461d:0x335b9b47c320a5da!8m2!3d18.2905796!4d99.4859859!15sCgt3YW5uIGxhIG1haZIBEmRlc3NlcnRfcmVzdGF1cmFudOABAA!16s%2Fg%2F11l2kdvc9p?entry=ttu&g_ep=EgoyMDI1MTIwOS4wIKXMDSoASAFQAw%3D%3D',
    );
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'ไม่สามารถเปิดลิงก์ได้';
    }
  }

  @override
  Widget build(BuildContext context) {
    LatLng targetPoint = LatLng(targetLat, targetLng);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Waan,Lamai Lampang"),
        backgroundColor: const Color.fromARGB(255, 14, 14, 14),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: FlutterMap(
              mapController: _mapController,
              options: MapOptions(initialCenter: targetPoint, initialZoom: 14),
              children: [
                TileLayer(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: const ['a', 'b', 'c'],
                ),

                MarkerLayer(
                  markers: [
                    if (currentLat != null && currentLng != null)
                      Marker(
                        width: 40,
                        height: 40,
                        point: LatLng(currentLat!, currentLng!),
                        child: const Icon(
                          Icons.my_location,
                          color: Colors.blue,
                          size: 40,
                        ),
                      ),
                    Marker(
                      width: 40,
                      height: 40,
                      point: targetPoint,
                      child: const Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 40,
                      ),
                    ),
                  ],
                ),

                if (currentLat != null && currentLng != null)
                  PolylineLayer(
                    polylines: [
                      Polyline(
                        points: [LatLng(currentLat!, currentLng!), targetPoint],
                        strokeWidth: 4,
                        color: Colors.blue,
                      ),
                    ],
                  ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  currentLat == null
                      ? "กดปุ่มเพื่อดึงตำแหน่งปัจจุบัน"
                      : "ตำแหน่งปัจจุบัน:\nLat: $currentLat\nLng: $currentLng",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  "ระยะทาง: ${distance.toStringAsFixed(3)} กม.",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: _getCurrentPosition,
                      icon: const Icon(Icons.location_searching),
                      label: const Text("คำนวนระยะทาง"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 5, 5, 5),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 20,
                        ),
                        textStyle: const TextStyle(fontSize: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),

                    const SizedBox(width: 16),

                    ElevatedButton.icon(
                      onPressed: _openGoogleMapLink,
                      icon: const Icon(Icons.map),
                      label: const Text("ร้านบนแผนที่"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 23, 139, 12),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 20,
                        ),
                        textStyle: const TextStyle(fontSize: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
