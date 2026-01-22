import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'fire-cal/firebase_options.dart';
import 'fire-cal/firemain.dart';

import 'Food-dessert_cooking/tomyum_page1.dart';
import 'Food-dessert_cooking/tomyum_page2.dart';
import 'Food-dessert_cooking/kaitod_page1.dart';
import 'Food-dessert_cooking/kaitod_page2.dart';
import 'Food-dessert_cooking/pudped_page1.dart';
import 'Food-dessert_cooking/pudped_page2.dart';
import 'Food-dessert_cooking/kaomoo_page1.dart';
import 'Food-dessert_cooking/kaomoo_page2.dart';
import 'Food-dessert_cooking/pudding_page1.dart';
import 'Food-dessert_cooking/pudding_page2.dart';
import 'Food-dessert_cooking/banoffi_page1.dart';
import 'Food-dessert_cooking/banoffi_page2.dart';
import 'Food-dessert_cooking/mangocake_page1.dart';
import 'Food-dessert_cooking/mangocake_page2.dart';

import 'Food-dessert_Video/video_tomyum.dart';
import 'Food-dessert_Video/video_kaitod.dart';
import 'Food-dessert_Video/video_pudped.dart';
import 'Food-dessert_Video/video_kaomoo.dart';
import 'Food-dessert_Video/video_banoffi.dart';
import 'Food-dessert_Video/video_mangocake.dart';
import 'Food-dessert_Video/video_pudding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mytitle',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const MainPage(),
        '/tomyum_page1': (context) => TomyumPage1(title: 'วัตถุดิบต้มยำกุ้ง'),
        '/tomyum_page2': (context) => TomyumPage2(title: 'วิธีการทำต้มยำกุ้ง'),
        '/kaitod_page1': (context) => KaitodPage1(title: 'วัตถุดิบไก่ทอด'),
        '/kaitod_page2': (context) => KaitodPage2(title: 'วิธีการทำไก่ทอด'),
        '/pudped_page1': (context) => PudpedPage1(title: 'วัตถุดิบผัดเผ็ด'),
        '/pudped_page2': (context) => PudpedPage2(title: 'วิธีการทำผัดเผ็ด'),
        '/kaomoo_page1': (context) => KaomooPage1(title: 'วัตถุดิบข้าวหน้าหมู'),
        '/kaomoo_page2': (context) => KaomooPage2(title: 'วิธีการทำ'),
        '/pudding_page1': (context) => PuddingPage1(title: 'วัตถุดิบPudding'),
        '/pudding_page2': (context) => PuddingPage2(title: 'วิธีการทำPudding'),
        '/mangocake_page1': (context) => MangocakePage1(title: 'วัตถุดิบ'),
        '/mangocake_page2': (context) => MangocakePage2(title: 'วิธีการทำ'),
        '/banoffi_page1': (context) => BanoffiPage1(title: 'วัตถุดิบ'),
        '/banoffi_page2': (context) => BanoffiPage2(title: 'วิธีการทำ'),

        '/video_tomyum': (context) =>
            VideoTomyum(title: 'TomyumKung', videoUrl: 'assets/TomyumKung.mp4'),
        '/video_kaitod': (context) =>
            VideoKaitod(title: 'Fried chicken', videoUrl: 'assets/kaitod.mp4'),
        '/video_pudped': (context) => VideoPudped(
          title: 'Thai Spicy Catfish',
          videoUrl: 'assets/kaitod.mp4',
        ),
        '/video_kaomoo': (context) =>
            VideoKaomoo(title: 'RicePork', videoUrl: 'assets/kaitod.mp4'),
        '/video_banoffi': (context) =>
            VideoBanoffi(title: 'Banoffi', videoUrl: 'assets/banoffi.mp4'),
        '/video_mangocake': (context) =>
            VideoMangocake(title: 'MangoCake', videoUrl: 'assets/banoffi.mp4'),
        '/video_pudding': (context) =>
            VideoPudding(title: 'Pudding', videoUrl: 'assets/cx banoffi.mp4'),
      },
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 16, 16, 15),
      appBar: AppBar(
        title: const Text(
          'ChanaFoodapp',
          style: TextStyle(
            fontSize: 30,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 146, 3),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Shopping()),
              );
            },
          ),
        ],
      ),
      body: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Stack(
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
            child: Container(
              padding: EdgeInsets.all(screenWidth * 0.013),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.all(screenWidth * 0.02),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/tom.png',
                              width: screenWidth * 0.32,
                              height: screenWidth * 0.32,
                            ),

                            Text(
                              'ต้มยำกุ้ง',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: screenHeight * 0.006),
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/tomyum_page1',
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.black,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.03,
                                      vertical: screenHeight * 0.01,
                                    ),
                                  ),
                                  child: Text('Click'),
                                ),
                                SizedBox(width: screenWidth * 0.013),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/video_tomyum',
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    foregroundColor: Colors.white,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.02,
                                      vertical: screenHeight * 0.01,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.play_circle_fill, size: 16),
                                      SizedBox(width: 3),
                                      Text('วีดีโอ'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.all(screenWidth * 0.02),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/kai1.png',
                              width: screenWidth * 0.32,
                              height: screenWidth * 0.32,
                            ),

                            Text(
                              'ไก่ทอด',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: screenHeight * 0.006),
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/kaitod_page1',
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.black,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.03,
                                      vertical: screenHeight * 0.01,
                                    ),
                                  ),
                                  child: Text('Click'),
                                ),
                                SizedBox(width: screenWidth * 0.013),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/video_kaitod',
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    foregroundColor: Colors.white,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.02,
                                      vertical: screenHeight * 0.01,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.play_circle_fill, size: 16),
                                      SizedBox(width: 3),
                                      Text('วีดีโอ'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.012),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.all(screenWidth * 0.02),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/ped.png',
                              width: screenWidth * 0.32,
                              height: screenWidth * 0.32,
                            ),
                            Text(
                              'ผัดเผ็ดปลาดุก',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: screenHeight * 0.006),
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/pudped_page1',
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.black,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.03,
                                      vertical: screenHeight * 0.01,
                                    ),
                                  ),
                                  child: Text('Click'),
                                ),
                                SizedBox(width: screenWidth * 0.013),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/video_pudped',
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    foregroundColor: Colors.white,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.02,
                                      vertical: screenHeight * 0.01,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.play_circle_fill, size: 16),
                                      SizedBox(width: 3),
                                      Text('วีดีโอ'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.all(screenWidth * 0.02),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/kaomoo.png',
                              width: screenWidth * 0.32,
                              height: screenWidth * 0.32,
                            ),
                            Text(
                              'ข้าวหน้าหมูย่าง',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: screenHeight * 0.006),
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/kaomoo_page1',
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.black,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.03,
                                      vertical: screenHeight * 0.01,
                                    ),
                                  ),
                                  child: Text('Click'),
                                ),
                                SizedBox(width: screenWidth * 0.013),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/video_kaomoo',
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    foregroundColor: Colors.white,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.02,
                                      vertical: screenHeight * 0.01,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.play_circle_fill, size: 16),
                                      SizedBox(width: 3),
                                      Text('วีดีโอ'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.07),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.all(screenWidth * 0.016),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/tao.png',
                              width: screenWidth * 0.26,
                              height: screenWidth * 0.26,
                            ),
                            SizedBox(height: screenHeight * 0.004),
                            Text(
                              'พุดดิ้งเต้าหู้',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.004),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/pudding_page1');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.02,
                                  vertical: screenHeight * 0.008,
                                ),
                              ),
                              child: Text(
                                'Click',
                                style: TextStyle(fontSize: 11),
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.004),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/video_pudding');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.016,
                                  vertical: screenHeight * 0.008,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.play_circle_fill, size: 14),
                                  SizedBox(width: 3),
                                  Text(
                                    'วีดีโอ',
                                    style: TextStyle(fontSize: 11),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.all(screenWidth * 0.016),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/ba.png',
                              width: screenWidth * 0.26,
                              height: screenWidth * 0.26,
                            ),
                            SizedBox(height: screenHeight * 0.004),
                            Text(
                              'บานอฟฟี่',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.004),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/banoffi_page1');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.02,
                                  vertical: screenHeight * 0.008,
                                ),
                              ),
                              child: Text(
                                'Click',
                                style: TextStyle(fontSize: 11),
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.004),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/video_banoffi');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.016,
                                  vertical: screenHeight * 0.008,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.play_circle_fill, size: 14),
                                  SizedBox(width: 3),
                                  Text(
                                    'วีดีโอ',
                                    style: TextStyle(fontSize: 11),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.all(screenWidth * 0.016),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/mk.png',
                              width: screenWidth * 0.26,
                              height: screenWidth * 0.26,
                            ),
                            SizedBox(height: screenHeight * 0.004),
                            Text(
                              'เค้กมะม่วง',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.004),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  '/mangocake_page1',
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.02,
                                  vertical: screenHeight * 0.008,
                                ),
                              ),
                              child: Text(
                                'Click',
                                style: TextStyle(fontSize: 11),
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.004),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  '/video_mangocake',
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.016,
                                  vertical: screenHeight * 0.008,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.play_circle_fill, size: 14),
                                  SizedBox(width: 3),
                                  Text(
                                    'วีดีโอ',
                                    style: TextStyle(fontSize: 11),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
