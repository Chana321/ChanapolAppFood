import 'package:flutter/material.dart';

class BanoffiPage1 extends StatefulWidget {
  final String title;
  const BanoffiPage1({super.key, required this.title});

  @override
  State<BanoffiPage1> createState() => _BanoffiPage1State();
}

class _BanoffiPage1State extends State<BanoffiPage1> {
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
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/2.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

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
                          'assets/2.jpg',
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
                            '• กล้วยหอม 2 ลูก',
                            style: TextStyle(fontSize: 16, height: 2),
                          ),
                          Text(
                            '• แครกเกอร์ 20 ชิ้น',
                            style: TextStyle(fontSize: 16, height: 2),
                          ),
                          Text(
                            '• นมข้นหวาน 50 กรัม',
                            style: TextStyle(fontSize: 16, height: 2),
                          ),
                          Text(
                            '• วิปปิงครีมอุณหภูมิห้อง 200 กรัม',
                            style: TextStyle(fontSize: 16, height: 2),
                          ),
                          Text(
                            '• วิปปิงครีมเย็น 200 กรัม',
                            style: TextStyle(fontSize: 16, height: 2),
                          ),
                          Text(
                            '• น้ำตาลทราย 200 กรัม',
                            style: TextStyle(fontSize: 16, height: 2),
                          ),
                          Text(
                            '• ผงโกโก้ (ตกแต่ง)',
                            style: TextStyle(fontSize: 16, height: 2),
                          ),
                          Text(
                            '• ช่อสะระแหน่ (ตกแต่ง)',
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
                            Navigator.pushNamed(context, '/banoffi_page2');
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
