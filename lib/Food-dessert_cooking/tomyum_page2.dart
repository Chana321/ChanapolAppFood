import 'package:flutter/material.dart';
import '../Gps/Tumyum_gps.dart';

class TomyumPage2 extends StatefulWidget {
  final String title;
  const TomyumPage2({super.key, required this.title});

  @override
  State<TomyumPage2> createState() => _TomyumPage2State();
}

class _TomyumPage2State extends State<TomyumPage2> {
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
                image: AssetImage('assets/333.jpg'),
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
                            'assets/333.jpg',
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
                                      '1. ใส่น้ำซุปลงหม้อ ใส่ตะไคร้ ข่า ใบมะกรูด ต้มเดือด 5 นาที',
                                      style: TextStyle(fontSize: 14, height: 3),
                                    ),
                                    Text(
                                      '2. ใส่กะทิและเครื่องเครา เติมกะทิลงไปคนให้เข้ากัน',
                                      style: TextStyle(fontSize: 14, height: 3),
                                    ),
                                    Text(
                                      '3. ใส่เห็ดและมะเขือเทศ ต้มจนสุก',
                                      style: TextStyle(fontSize: 14, height: 3),
                                    ),
                                    Text(
                                      '4. ใส่กุ้ง ต้มจนกุ้งสุก (ประมาณ 3-4 นาที)',
                                      style: TextStyle(fontSize: 14, height: 3),
                                    ),
                                    Text(
                                      '5. ใส่น้ำปลา น้ำมะนาว พริกขี้หนูและพริกเผา',
                                      style: TextStyle(fontSize: 14, height: 3),
                                    ),
                                    Text(
                                      '6. ชิมรสตามชอบ ตักใส่ชาม โรยผักชี พร้อมเสิร์ฟร้อนๆ',
                                      style: TextStyle(fontSize: 14, height: 3),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 20),

                        // ปุ่ม Home และ GPS
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // ปุ่ม Home
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
                                      builder: (context) => TomyumGPS(),
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
