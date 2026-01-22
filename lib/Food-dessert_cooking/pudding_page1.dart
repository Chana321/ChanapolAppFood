import 'package:flutter/material.dart';

class PuddingPage1 extends StatefulWidget {
  final String title;
  const PuddingPage1({super.key, required this.title});

  @override
  State<PuddingPage1> createState() => _PuddingPage1State();
}

class _PuddingPage1State extends State<PuddingPage1> {
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
          /// พื้นหลัง
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/3.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// ✅ เลื่อนทั้งหน้า
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Center(
              child: FractionallySizedBox(
                widthFactor: 0.9,
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
                        'วัตถุดิบ',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),
                      const Divider(thickness: 1),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            '• นมถั่วเหลืองชินโป รสจืด 1,000 มล.',
                            style: TextStyle(fontSize: 16, height: 2),
                          ),
                          Text(
                            '• ไซรัปวนิลลา 3 ช้อนโต๊ะ',
                            style: TextStyle(fontSize: 16, height: 2),
                          ),
                          Text(
                            '• ผงวุ้น 2 ช้อนชา',
                            style: TextStyle(fontSize: 16, height: 2),
                          ),
                          Text(
                            '• ผงมัทฉะ 1 ช้อนโต๊ะ',
                            style: TextStyle(fontSize: 16, height: 2),
                          ),
                          Text(
                            '• ถั่วแดงกวน ตามต้องการ',
                            style: TextStyle(fontSize: 16, height: 2),
                          ),
                        ],
                      ),

                      const SizedBox(height: 25),

                      SizedBox(
                        width: 160,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black87,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/pudding_page2');
                          },
                          child: const Text(
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
          ),
        ],
      ),
    );
  }
}
