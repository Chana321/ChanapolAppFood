import 'package:flutter/material.dart';

class KaomooPage1 extends StatefulWidget {
  final String title;
  const KaomooPage1({super.key, required this.title});

  @override
  State<KaomooPage1> createState() => _KaomooPage1State();
}

class _KaomooPage1State extends State<KaomooPage1> {
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
                              'assets/d.jpg',
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
                                    '• หมูสามชั้นสไลด์ 300 กรัม',
                                    style: TextStyle(fontSize: 16, height: 1.8),
                                  ),
                                  Text(
                                    '• ต้นหอมซอย ตามชอบ',
                                    style: TextStyle(fontSize: 16, height: 1.8),
                                  ),
                                  Text(
                                    '• งาขาวคั่ว เล็กน้อย',
                                    style: TextStyle(fontSize: 16, height: 1.8),
                                  ),
                                  Text(
                                    '• เกลือ เล็กน้อย',
                                    style: TextStyle(fontSize: 16, height: 1.8),
                                  ),
                                  Text(
                                    '• พริกไทยดำแบบเม็ด เล็กน้อย',
                                    style: TextStyle(fontSize: 16, height: 1.8),
                                  ),
                                  Text(
                                    '• ซอสยากินิขุ 50 กรัม',
                                    style: TextStyle(fontSize: 16, height: 1.8),
                                  ),
                                  Text(
                                    '• ข้าวสวย 1 ถ้วย',
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
                                Navigator.pushNamed(context, '/kaomoo_page2');
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
                SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
