import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class PudpedGps extends StatefulWidget {
  const PudpedGps({super.key});

  @override
  State<PudpedGps> createState() => _PudpedGpsState();
}

class _PudpedGpsState extends State<PudpedGps> {
  static const double targetLat = 18.2812772;
  static const double targetLng = 99.4510211;

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
      'https://www.google.com/maps/place/%E0%B8%84%E0%B8%99%E0%B8%84%E0%B8%AD%E0%B8%99+%E0%B8%82%E0%B9%89%E0%B8%B2%E0%B8%A7%E0%B9%81%E0%B8%81%E0%B8%87%E0%B8%9B%E0%B8%B1%E0%B8%81%E0%B8%A9%E0%B9%8C%E0%B9%83%E0%B8%95%E0%B9%89+%E0%B8%93+%E0%B8%A5%E0%B8%B3%E0%B8%9B%E0%B8%B2%E0%B8%87/@18.2812772,99.4510211,14z/data=!4m10!1m2!2m1!1z4LiC4LmJ4Liy4Lin4LmB4LiB4LiH4Lib4Lix4LiB4Lip4LmM4LmD4LiV4LmJIOC4kyDguKXguLPguJvguLLguIc!3m6!1s0x30d96b829e8e7477:0xdaa9ca3a240f67bd!8m2!3d18.2876187!4d99.4935759!15sCkHguILguYnguLLguKfguYHguIHguIfguJvguLHguIHguKnguYzguYPguJXguYkg4LiTIOC4peC4s-C4m-C4suC4h1pFIkPguILguYnguLLguKfguYHguIHguIcg4Lib4Lix4LiB4Lip4LmMIOC5g-C4leC5iSDguJMg4Lil4Liz4Lib4Liy4LiHkgEKcmVzdGF1cmFudJoBI0NoWkRTVWhOTUc5blMwVkpRMEZuVFVOQk5reHFZMlpuRUFF4AEA-gEECAAQEQ!16s%2Fg%2F11w3brvtyq?entry=ttu&g_ep=EgoyMDI1MTIwOS4wIKXMDSoASAFQAw%3D%3D',
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
        title: const Text("ข้าวแกงปักษ์ใต้ ณ ลำปาง"),
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
