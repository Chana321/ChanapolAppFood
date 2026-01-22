import 'package:flutter/material.dart';

class PudpedPage1 extends StatefulWidget {
  final String title;
  const PudpedPage1({super.key, required this.title});

  @override
  State<PudpedPage1> createState() => _PudpedPage1State();
}

class _PudpedPage1State extends State<PudpedPage1> {
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

          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                Center(
                  child: FractionallySizedBox(
                    widthFactor: 0.85,
                    child: Container(
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
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ),

                          SizedBox(height: 15),

                          Text(
                            'วัตถุดิบ',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 10),
                          Divider(thickness: 1),

                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Text(
                                    '• เนื้อปลาดุก 400 กรัม',
                                    style: TextStyle(fontSize: 16, height: 1.8),
                                  ),
                                  Text(
                                    '• เกลือ 1/2 ช้อนชา (ล้างกลิ่นคาวปลา)',
                                    style: TextStyle(fontSize: 16, height: 1.8),
                                  ),
                                  Text(
                                    '• น้ำส้มสายชู 3 ช้อนโต๊ะ (ล้างกลิ่นคาวปลา)',
                                    style: TextStyle(fontSize: 16, height: 1.8),
                                  ),
                                  Text(
                                    '• พริกแกงเผ็ด 80 กรัม',
                                    style: TextStyle(fontSize: 16, height: 1.8),
                                  ),
                                  Text(
                                    '• พริกชี้ฟ้าแดงหั่นเฉียง 1 เม็ด',
                                    style: TextStyle(fontSize: 16, height: 1.8),
                                  ),
                                  Text(
                                    '• ใบมะกรูดฉีก 5 ใบ',
                                    style: TextStyle(fontSize: 16, height: 1.8),
                                  ),
                                  Text(
                                    '• ใบกะเพรา 1 กรัม',
                                    style: TextStyle(fontSize: 16, height: 1.8),
                                  ),
                                  Text(
                                    '• เกลือ 1/3 ช้อนชา',
                                    style: TextStyle(fontSize: 16, height: 1.8),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          SizedBox(height: 20),

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
                                Navigator.pushNamed(context, '/pudped_page2');
                              },
                              child: Text(
                                "Next",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
