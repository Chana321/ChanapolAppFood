import 'package:flutter/material.dart';

class KaitodPage1 extends StatefulWidget {
  final String title;

  const KaitodPage1({super.key, required this.title});

  @override
  State<KaitodPage1> createState() => _KaitodPage1State();
}

class _KaitodPage1State extends State<KaitodPage1> {
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
                              'assets/444.jpg',
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
                                    '• เนื้อไก่ 1,000 กรัม',
                                    style: TextStyle(fontSize: 16, height: 1.8),
                                  ),
                                  Text(
                                    '• น้ำตาลทราย 1 ช้อนโต๊ะ',
                                    style: TextStyle(fontSize: 16, height: 1.8),
                                  ),
                                  Text(
                                    '• กระเทียมป่น 2 ช้อนชา',
                                    style: TextStyle(fontSize: 16, height: 1.8),
                                  ),
                                  Text(
                                    '• พริกไทยป่น 1 ช้อนโต๊ะ',
                                    style: TextStyle(fontSize: 16, height: 1.8),
                                  ),
                                  Text(
                                    '• แป้งทอดกรอบ 300 กรัม',
                                    style: TextStyle(fontSize: 16, height: 1.8),
                                  ),
                                  Text(
                                    '• แป้งสาลี 300 กรัม',
                                    style: TextStyle(fontSize: 16, height: 1.8),
                                  ),
                                  Text(
                                    '• เกลือป่น 1 ช้อน',
                                    style: TextStyle(fontSize: 16, height: 1.8),
                                  ),
                                  Text(
                                    '• น้ำเปล่า',
                                    style: TextStyle(fontSize: 16, height: 1.8),
                                  ),
                                  Text(
                                    '• น้ำมันปาล์มสำหรับทอด',
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
                                Navigator.pushNamed(context, '/kaitod_page2');
                              },
                              child: Text(
                                "Next",
                                style: TextStyle(
                                  color: const Color.fromARGB(
                                    255,
                                    255,
                                    255,
                                    255,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
