import 'package:flutter/material.dart';
import '../Gps/Kaomoo_gps.dart';

class KaomooPage2 extends StatefulWidget {
  final String title;
  const KaomooPage2({super.key, required this.title});

  @override
  State<KaomooPage2> createState() => _KaomooPage2State();
}

class _KaomooPage2State extends State<KaomooPage2> {
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
                image: AssetImage('assets/d.jpg'),
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
                            'assets/d.jpg',
                            width: double.infinity,
                            height: 150,
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
                                      '1. หั่นหมูสามชั้นให้ได้ความยาวประมาณ 3 นิ้ว',
                                      style: TextStyle(fontSize: 14, height: 3),
                                    ),
                                    Text(
                                      '2. นำไปย่างบนกระทะจนหมูสุกเปลี่ยนสี นำหมูขึ้นมาพัก',
                                      style: TextStyle(fontSize: 14, height: 3),
                                    ),
                                    Text(
                                      '3. ตั้งกระทะใส่ซอสยากินิขุลงไป',
                                      style: TextStyle(fontSize: 14, height: 3),
                                    ),
                                    Text(
                                      '4. ซอสเริ่มเดือดให้นำหมูที่ย่างลงไปคลุกเคล้ากับซอสให้ทั่ว',
                                      style: TextStyle(fontSize: 14, height: 3),
                                    ),
                                    Text(
                                      '5. นำข้าวสวยที่เตรียมไว้มาใส่จาน โปะหน้าด้วยหมูย่าง',
                                      style: TextStyle(fontSize: 14, height: 3),
                                    ),
                                    Text(
                                      '6. โรยด้วย งา และพริกไทยดำ เป็นอันเสร็จ',
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
                                      builder: (context) => KaomooGps(),
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
