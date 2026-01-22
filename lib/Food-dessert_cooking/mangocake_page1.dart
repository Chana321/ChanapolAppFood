import 'package:flutter/material.dart';

class MangocakePage1 extends StatefulWidget {
  final String title;
  const MangocakePage1({super.key, required this.title});

  @override
  State<MangocakePage1> createState() => _MangocakePage1State();
}

class _MangocakePage1State extends State<MangocakePage1> {
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
                image: AssetImage('assets/1.jpg'),
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
                          'assets/1.jpg',
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

                      /// รายการวัตถุดิบ
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            '• มะม่วงสุก 2 ลูก',
                            style: TextStyle(fontSize: 16, height: 2),
                          ),
                          Text(
                            '• แครกเกอร์ 20 ชิ้น',
                            style: TextStyle(fontSize: 16, height: 2),
                          ),
                          Text(
                            '• เนยละลาย 70 กรัม',
                            style: TextStyle(fontSize: 16, height: 2),
                          ),
                          Text(
                            '• ครีมชีส 450 กรัม',
                            style: TextStyle(fontSize: 16, height: 2),
                          ),
                          Text(
                            '• วิปครีม 250 กรัม',
                            style: TextStyle(fontSize: 16, height: 2),
                          ),
                          Text(
                            '• น้ำตาลทรายแดง 4–6 ช้อนโต๊ะ',
                            style: TextStyle(fontSize: 16, height: 2),
                          ),
                          Text(
                            '• น้ำมะนาว 3–4 ช้อนโต๊ะ',
                            style: TextStyle(fontSize: 16, height: 2),
                          ),
                          Text(
                            '• เจลลาตินแผ่น 5 แผ่น',
                            style: TextStyle(fontSize: 16, height: 2),
                          ),
                        ],
                      ),

                      const SizedBox(height: 25),

                      /// ปุ่ม Next
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
                            Navigator.pushNamed(context, '/mangocake_page2');
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
