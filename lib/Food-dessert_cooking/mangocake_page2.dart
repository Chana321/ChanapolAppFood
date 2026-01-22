import 'package:flutter/material.dart';
import '../Gps/Mangocake_gps.dart';

class MangocakePage2 extends StatefulWidget {
  final String title;
  const MangocakePage2({super.key, required this.title});

  @override
  State<MangocakePage2> createState() => _MangocakePage2State();
}

class _MangocakePage2State extends State<MangocakePage2> {
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
          /// Background
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// Scroll ทั้งหน้า
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
                          'assets/1.jpg',
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

                      /// ขั้นตอนการทำ
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            '1. บดแครกเกอร์ให้ละเอียด เติมเนยละลายคนให้เข้ากัน',
                            style: TextStyle(fontSize: 14, height: 2.5),
                          ),
                          Text(
                            '2. ปั่นเนื้อมะม่วงและกรองเนื้อเนียน นำไปตุ๋นไฟอ่อนพออุ่น',
                            style: TextStyle(fontSize: 14, height: 2.5),
                          ),
                          Text(
                            '3. ตีวิปครีมไว้แล้วพักไว้',
                            style: TextStyle(fontSize: 14, height: 2.5),
                          ),
                          Text(
                            '4. ตีครีมชีสจนฟู แล้วเอาวิปครีมที่ตีไว้ลงมาตีให้เข้ากัน',
                            style: TextStyle(fontSize: 14, height: 2.5),
                          ),
                          Text(
                            '5. ใส่เนื้อมะม่วงบดบางส่วน 5 ชต. ลงไปผสม',
                            style: TextStyle(fontSize: 14, height: 2.5),
                          ),
                          Text(
                            '6. ใส่เจลลาตินลงในส่วนผสมครีมชีส',
                            style: TextStyle(fontSize: 14, height: 2.5),
                          ),
                          Text(
                            '7. เทใส่พิมพ์แล้วแช่เย็นจนเซตตัว',
                            style: TextStyle(fontSize: 14, height: 2.5),
                          ),
                          Text(
                            '8. ผสมเจลลาตินกับเนื้อมะม่วงที่เหลือ',
                            style: TextStyle(fontSize: 14, height: 2.5),
                          ),
                          Text(
                            '9. เทเป็นชั้นบน แล้วแช่เย็นอย่างน้อย 4 ชั่วโมง',
                            style: TextStyle(fontSize: 14, height: 2.5),
                          ),
                          Text(
                            '10. ตกแต่งด้วยวิปครีมหรือมะม่วงหั่นลูกเต๋า',
                            style: TextStyle(fontSize: 14, height: 2.5),
                          ),
                        ],
                      ),

                      const SizedBox(height: 25),

                      /// ปุ่ม Home + GPS
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
                                    builder: (context) => MangocakeGps(),
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
