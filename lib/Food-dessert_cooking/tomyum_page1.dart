import 'package:flutter/material.dart';

class TomyumPage1 extends StatefulWidget {
  final String title;
  const TomyumPage1({super.key, required this.title});

  @override
  State<TomyumPage1> createState() => _TomyumPage1State();
}

class _TomyumPage1State extends State<TomyumPage1> {
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

          SingleChildScrollView(
            child: Column(
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
                              'assets/333.jpg',
                              width: double.infinity,
                              height: 160,
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
                                children: const [
                                  Text(
                                    '• กุ้ง 500 กรัม',
                                    style: TextStyle(fontSize: 16, height: 1.7),
                                  ),
                                  Text(
                                    '• น้ำปลาปรุงรสหมู 4 ช้อน',
                                    style: TextStyle(fontSize: 16, height: 1.7),
                                  ),
                                  Text(
                                    '• ข่า 3–4 ชิ้น',
                                    style: TextStyle(fontSize: 16, height: 1.7),
                                  ),
                                  Text(
                                    '• ผงไก่ 2 ช้อน',
                                    style: TextStyle(fontSize: 16, height: 1.7),
                                  ),
                                  Text(
                                    '• ใบมะกรูด 5–6 ใบ',
                                    style: TextStyle(fontSize: 16, height: 1.7),
                                  ),
                                  Text(
                                    '• พริกกี้หนู 5–7 เม็ด',
                                    style: TextStyle(fontSize: 16, height: 1.7),
                                  ),
                                  Text(
                                    '• เกลือป่น 1 ช้อน',
                                    style: TextStyle(fontSize: 16, height: 1.7),
                                  ),
                                  Text(
                                    '• มะเขือเทศ 3 ลูก',
                                    style: TextStyle(fontSize: 16, height: 1.7),
                                  ),
                                  Text(
                                    '• น้ำปลา 3 ช้อนโต๊ะ',
                                    style: TextStyle(fontSize: 16, height: 1.7),
                                  ),
                                  Text(
                                    '• น้ำมะนาว 2 ช้อนโต๊ะ',
                                    style: TextStyle(fontSize: 16, height: 1.7),
                                  ),
                                  Text(
                                    '• น้ำพริกเผา 2 ช้อนโต๊ะ',
                                    style: TextStyle(fontSize: 16, height: 1.7),
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
                                Navigator.pushNamed(context, '/tomyum_page2');
                              },
                              child: Text(
                                "Next",
                                style: TextStyle(color: Colors.white),
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
