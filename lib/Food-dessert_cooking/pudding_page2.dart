import 'package:flutter/material.dart';
import '../Gps/Pudding_gps.dart';

class PuddingPage2 extends StatefulWidget {
  final String title;
  const PuddingPage2({super.key, required this.title});

  @override
  State<PuddingPage2> createState() => _PuddingPage2State();
}

class _PuddingPage2State extends State<PuddingPage2> {
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
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/3.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // เลื่อนทั้งหน้า
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
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          'assets/3.jpg',
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
                            '1. นำนมถั่วเหลืองชินโป รสจืด ใส่ลงในถ้วย',
                            style: TextStyle(fontSize: 14, height: 2.5),
                          ),
                          Text(
                            '2. นำผงวุ้นคนให้ส่วนผสมเข้ากัน',
                            style: TextStyle(fontSize: 14, height: 2.5),
                          ),
                          Text(
                            '3. นำเข้าไมโครเวฟด้วยอุณหภูมิ 800 วัตต์ (10นาที)',
                            style: TextStyle(fontSize: 14, height: 2.5),
                          ),
                          Text(
                            '4. ให้นำน้ำเต้าหู้ออกมากรองแล้วแบ่งเป็น 2 ถ้วย',
                            style: TextStyle(fontSize: 14, height: 2.5),
                          ),
                          Text(
                            '5. ถ้วยแรกใส่น้ำเต้าหู้ปริมาณ 2 ถ้วยตวง',
                            style: TextStyle(fontSize: 14, height: 2.5),
                          ),
                          Text(
                            '6. ถ้วยที่สองใส่น้ำเต้าหู้ปริมาณ 1 ถ้วยตวง',
                            style: TextStyle(fontSize: 14, height: 2.5),
                          ),
                          Text(
                            '7. นำน้ำเต้าหู้ ถ้วยแรก เทลงในถ้วยที่ต้องการจัดเสิร์ฟ',
                            style: TextStyle(fontSize: 14, height: 2.5),
                          ),
                          Text(
                            '8. นำน้ำเต้าหู้เข้าตู้เย็น เพื่อให้เซตตัวเป็นพุดดิ้ง',
                            style: TextStyle(fontSize: 14, height: 2.5),
                          ),
                          Text(
                            '9. เมื่อ Pudding เซ็ตตัวให้นำออกมาจัดจานเป็นอันเสร็จ',
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
                                    builder: (context) => PuddingGps(),
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
