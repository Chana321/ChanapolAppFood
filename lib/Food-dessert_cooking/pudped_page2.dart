import 'package:flutter/material.dart';
import '../Gps/Pudped_gps.dart';

class PudpedPage2 extends StatefulWidget {
  final String title;
  const PudpedPage2({super.key, required this.title});

  @override
  State<PudpedPage2> createState() => _PudpedPage2State();
}

class _PudpedPage2State extends State<PudpedPage2> {
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
                image: AssetImage('assets/666.jpg'),
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
                            'assets/555.jpg',
                            width: double.infinity,
                            height: 170,
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
                                      '1. ตั้งกระทะ ใส่น้ำมันตามด้วยพริกแกงเผ็ดผัดด้วยไฟแรง',
                                      style: TextStyle(fontSize: 14, height: 3),
                                    ),
                                    Text(
                                      '2. เติมน้ำเปล่าลงไป 300 มิลลิลิตร รอจนน้ำเดือด',
                                      style: TextStyle(fontSize: 14, height: 3),
                                    ),
                                    Text(
                                      '3. ปรุงรสด้วย เกลือ น้ำตาลมะพร้าว ผงปรุงรส น้ำปลา',
                                      style: TextStyle(fontSize: 14, height: 3),
                                    ),
                                    Text(
                                      '4. ใส่เนื้อปลาดุกลงไป รอจนฝั่งด้านล่างสุกค่อยกลับตัวปลา',
                                      style: TextStyle(fontSize: 14, height: 3),
                                    ),
                                    Text(
                                      '5. ใส่พริกชี้ฟ้าแดงหั่นเฉียง ใบมะกรูดฉีก ใบกะเพรา',
                                      style: TextStyle(fontSize: 14, height: 3),
                                    ),
                                    Text(
                                      '6. คลุกเคล้าให้เข้ากัน พอน้ำงวดเป็นอันเสร็จพร้อมเสิร์ฟ',
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
                                      builder: (context) => PudpedGps(),
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
