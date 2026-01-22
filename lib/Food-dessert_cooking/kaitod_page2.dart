import 'package:flutter/material.dart';
import '../Gps/Kaitod_gps.dart';

class KaitodPage2 extends StatefulWidget {
  final String title;
  const KaitodPage2({super.key, required this.title});

  @override
  State<KaitodPage2> createState() => _KaitodPage2State();
}

class _KaitodPage2State extends State<KaitodPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(widget.title, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black87,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/444.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: FractionallySizedBox(
                  widthFactor: 0.95,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(0xFFF7F2EC),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            'assets/444.jpg',
                            width: double.infinity,
                            height: 160,
                            fit: BoxFit.cover,
                          ),
                        ),

                        SizedBox(height: 15),

                        Text(
                          'วิธีการทำ',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 10),
                        Divider(thickness: 1),

                        Row(
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Text(
                                      '1. คลุกไก่กับกระเทียม,พริกไทย,น้ำตาลให้เข้ากัน(หมัก)',
                                      style: TextStyle(fontSize: 14, height: 3),
                                    ),
                                    Text(
                                      '2. คลุกแป้ง โรยแป้งทอดกรอบให้ทั่วไก่',
                                      style: TextStyle(fontSize: 14, height: 3),
                                    ),
                                    Text(
                                      '3. ตั้งกระทะใส่น้ำมันพอท่วม ไฟปานกลาง–สูง',
                                      style: TextStyle(fontSize: 14, height: 3),
                                    ),
                                    Text(
                                      '4. ไก่ลงทอดจนเหลืองกรอบทั้งสองด้าน 10-15 นาที',
                                      style: TextStyle(fontSize: 14, height: 3),
                                    ),
                                    Text(
                                      '5. ตักไก่ขึ้นวางบนกระดาษซับน้ำมัน แล้วเสิร์ฟร้อนๆ',
                                      style: TextStyle(fontSize: 14, height: 3),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 20),

                      
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
                                child: Text(
                                  "Home Page",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),

                            SizedBox(width: 10),

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
                                      builder: (context) => KaitodGps(),
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.location_on,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                label: Text(
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
            ],
          ),
        ],
      ),
    );
  }
}
