import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'calc.dart';

class Shopping extends StatefulWidget {
  const Shopping({super.key});

  @override
  State<Shopping> createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  int khaopad = 0;
  int kaprao = 0;
  int somtam = 0;
  int kuayteaw = 0;
  int khaomangai = 0;
  int padthai = 0;
  int khaokhamoo = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 146, 3),
        elevation: 4,
        centerTitle: true,
        leading: const Icon(
          Icons.restaurant_menu,
          size: 28,
          color: Colors.white,
        ),
        title: const Text(
          "Food Order",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              "เลือกอาหารที่ต้องการสั่ง",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // ข้าวผัด - assets/tom.png
            _buildFoodItem("ต้มยำกุ้งน้ำข้น", 40, "assets/tom.png", khaopad, (
              val,
            ) {
              setState(() => khaopad = val);
            }),

            // ผัดกะเพรา - assets/kai1.png
            _buildFoodItem("ไก่ทอด(กรอบ)", 45, "assets/kai1.png", kaprao, (
              val,
            ) {
              setState(() => kaprao = val);
            }),

            // ส้มตำ - assets/ped.png
            _buildFoodItem("ผัดเผ็ดปลาดุก", 35, "assets/ped.png", somtam, (
              val,
            ) {
              setState(() => somtam = val);
            }),

            // ก๋วยเตี้ยว - assets/kaomoo.png
            _buildFoodItem(
              "ข้าวหน้าหมู(ราดซอส)",
              40,
              "assets/kaomoo.png",
              kuayteaw,
              (val) {
                setState(() => kuayteaw = val);
              },
            ),

            // ข้าวมันไก่ - assets/tao.png
            _buildFoodItem("พุดดิ้งเต้าหู้", 50, "assets/tao.png", khaomangai, (
              val,
            ) {
              setState(() => khaomangai = val);
            }),

            // ผัดไทย - assets/ba.png
            _buildFoodItem("บานอฟฟี่(Banana)", 45, "assets/ba.png", padthai, (
              val,
            ) {
              setState(() => padthai = val);
            }),

            // ข้าวขาหมู - assets/mk.png
            _buildFoodItem("MangoCake", 50, "assets/mk.png", khaokhamoo, (val) {
              setState(() => khaokhamoo = val);
            }),

            const Spacer(),

            // ปุ่มด้านล่าง
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      khaopad = 0;
                      kaprao = 0;
                      somtam = 0;
                      kuayteaw = 0;
                      khaomangai = 0;
                      padthai = 0;
                      khaokhamoo = 0;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text("ล้างข้อมูล"),
                ),

                ElevatedButton(
                  onPressed: () async {
                    int total =
                        khaopad +
                        kaprao +
                        somtam +
                        kuayteaw +
                        khaomangai +
                        padthai +
                        khaokhamoo;

                    if (total == 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("กรุณาเลือกอาหารอย่างน้อย 1 รายการ"),
                        ),
                      );
                      return;
                    }

                    // สร้างรายการอาหารที่สั่ง
                    List<Map<String, dynamic>> items = [];
                    int netTotal = 0;

                    // เพิ่มรายการที่มีจำนวน > 0
                    if (khaopad > 0) {
                      int itemTotal = khaopad * 40;
                      items.add({
                        "item": "ข้าวผัด",
                        "price": 40,
                        "pc": khaopad,
                        "total": itemTotal,
                      });
                      netTotal += itemTotal;
                    }
                    if (kaprao > 0) {
                      int itemTotal = kaprao * 45;
                      items.add({
                        "item": "ผัดกะเพรา",
                        "price": 45,
                        "pc": kaprao,
                        "total": itemTotal,
                      });
                      netTotal += itemTotal;
                    }
                    if (somtam > 0) {
                      int itemTotal = somtam * 35;
                      items.add({
                        "item": "ส้มตำ",
                        "price": 35,
                        "pc": somtam,
                        "total": itemTotal,
                      });
                      netTotal += itemTotal;
                    }
                    if (kuayteaw > 0) {
                      int itemTotal = kuayteaw * 40;
                      items.add({
                        "item": "ก๋วยเตี้ยว",
                        "price": 40,
                        "pc": kuayteaw,
                        "total": itemTotal,
                      });
                      netTotal += itemTotal;
                    }
                    if (khaomangai > 0) {
                      int itemTotal = khaomangai * 50;
                      items.add({
                        "item": "ข้าวมันไก่",
                        "price": 50,
                        "pc": khaomangai,
                        "total": itemTotal,
                      });
                      netTotal += itemTotal;
                    }
                    if (padthai > 0) {
                      int itemTotal = padthai * 45;
                      items.add({
                        "item": "ผัดไทย",
                        "price": 45,
                        "pc": padthai,
                        "total": itemTotal,
                      });
                      netTotal += itemTotal;
                    }
                    if (khaokhamoo > 0) {
                      int itemTotal = khaokhamoo * 50;
                      items.add({
                        "item": "ข้าวขาหมู",
                        "price": 50,
                        "pc": khaokhamoo,
                        "total": itemTotal,
                      });
                      netTotal += itemTotal;
                    }

                    // บันทึกลง Firestore
                    await firestore.collection("food_tab").add({
                      "items": items,
                      "net_total": netTotal,
                      "timestamp": FieldValue.serverTimestamp(),
                    });

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const CalcPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text("คำนวณราคา"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget สำหรับแสดงรายการอาหารแต่ละอย่าง พร้อมรูปภาพ
  Widget _buildFoodItem(
    String name,
    int price,
    String imagePath,
    int quantity,
    Function(int) onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          // รูปภาพอาหาร
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 60,
                  height: 60,
                  color: Colors.grey[300],
                  child: const Icon(Icons.restaurant, color: Colors.grey),
                );
              },
            ),
          ),
          const SizedBox(width: 12),

          // ชื่อและราคา
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "ราคา $price บาท",
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),

          IconButton(
            onPressed: () {
              if (quantity > 0) {
                onChanged(quantity - 1);
              }
            },
            icon: const Icon(Icons.remove_circle_outline, color: Colors.red),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              "$quantity",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),

          IconButton(
            onPressed: () {
              onChanged(quantity + 1);
            },
            icon: const Icon(Icons.add_circle_outline, color: Colors.green),
          ),
        ],
      ),
    );
  }
}
