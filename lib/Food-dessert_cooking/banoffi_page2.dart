import 'package:flutter/material.dart';
import '../Gps/Banoffi_gps.dart';

class BanoffiPage2 extends StatefulWidget {
  final String title;
  const BanoffiPage2({super.key, required this.title});

  @override
  State<BanoffiPage2> createState() => _BanoffiPage2State();
}

class _BanoffiPage2State extends State<BanoffiPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(widget.title, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.black87,
      ),
      body: Stack(
        children: [
          // Background
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/2.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Scrollable content
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Center(
              child: FractionallySizedBox(
                widthFactor: 0.95,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7F2EC),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          'assets/2.jpg',
                          width: double.infinity,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),

                      const SizedBox(height: 15),

                      const Text(
                        'วิธีการทำ',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),
                      const Divider(thickness: 1),

                      // รายละเอียดขั้นตอน
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            '1. บดแครกเกอร์พอหยาบ',
                            style: TextStyle(fontSize: 14, height: 2.5),
                          ),
                          Text(
                            '2. นำเนยชนิดเค็มละลายมาผสมกับแครกเกอร์ให้เข้ากัน',
                            style: TextStyle(fontSize: 14, height: 2.5),
                          ),
                          Text(
                            '3. กรุลงในแก้วให้เข้ากัน แล้วนำไปใส่ตู้เย็นพักไว้',
                            style: TextStyle(fontSize: 14, height: 2.5),
                          ),
                          Text(
                            '4. นำน้ำตาลทรายตั้งไฟให้ขึ้นสี',
                            style: TextStyle(fontSize: 14, height: 2.5),
                          ),
                          Text(
                            '5. จากนั้นเทวิปปิงครีมใส่ลงไป รีบคนให้เข้ากัน',
                            style: TextStyle(fontSize: 14, height: 2.5),
                          ),
                          Text(
                            '6. ใส่เนยชนิดเค็มลงไปละลายให้เข้ากันแล้วพักไว้',
                            style: TextStyle(fontSize: 14, height: 2.5),
                          ),
                          Text(
                            '7. จากนั้นนำวิปปิงครีมเย็นจัดมาตีด้วยเครื่องตีให้ขึ้นฟู',
                            style: TextStyle(fontSize: 14, height: 2.5),
                          ),
                          Text(
                            '8. หั่นกล้วยหอมเป็นแว่น เรียงลงในแก้วที่กรุแครกเกอร์ไว้',
                            style: TextStyle(fontSize: 14, height: 2.5),
                          ),
                          Text(
                            '9. จากนั้นใส่ผลิตภัณฑ์นมข้นหวาน',
                            style: TextStyle(fontSize: 14, height: 2.5),
                          ),
                          Text(
                            '10. ตามด้วยซอสคาราเมลและวิปปิงครีม,ช่อสะระแหน่(ตกแต่ง)',
                            style: TextStyle(fontSize: 14, height: 2.5),
                          ),
                        ],
                      ),

                      const SizedBox(height: 25),

                      // ปุ่ม Home + GPS
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 140,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black87,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: () {
                                Navigator.popUntil(
                                  context,
                                  ModalRoute.withName('/'),
                                );
                              },
                              child: const Text(
                                "Home Page",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),

                          const SizedBox(width: 10),

                          SizedBox(
                            width: 140,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BanoffiGps(),
                                  ),
                                );
                              },
                              icon: const Icon(
                                Icons.location_on,
                                color: Colors.white,
                                size: 20,
                              ),
                              label: const Text(
                                "GPS",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
