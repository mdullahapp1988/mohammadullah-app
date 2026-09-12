import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mohammadullah All-in-One AI App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _balance = 0.0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // প্রতি ২০ মিনিট পর পর অ্যামাউন্ট যোগ হওয়া এবং নোটিফিকেশনের লজিক
    _timer = Timer.periodic(const Duration(minutes: 20), (timer) {
      setState(() {
        _balance += 10.0;
      });
      _showNotificationEffect();
    });
  }

  void _showNotificationEffect() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('আপনার অ্যাকাউন্টে ১০ টাকা যোগ হয়েছে!'),
        duration: Duration(seconds: 4),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mohammadullah All-in-One AI App'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // ইউজারের প্রোফাইল ছবি
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/mohammadullah.jpg'),
            ),
            const SizedBox(height: 15),
            const Text(
              'স্বাগতম, Mohammadullah Sikder!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            
            // ব্যালেন্স কার্ড
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    const Text(
                      'আপনার বর্তমান অ্যামাউন্ট',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '৳ ${_balance.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25),
            
            // সমস্ত ফিচার ও প্রোগ্রামসমূহের সেকশন
            const Text(
              'আপনার প্রয়োজনীয় এআই ও অন্যান্য টুলসসমূহ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(height: 15),

            // গ্রিড ভিউতে এক্সাম ও রেজাল্টসহ সমস্ত প্রোগ্রাম
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.3,
              children: [
                _buildFeatureCard(Icons.quiz, 'এক্সাম ও রেজাল্ট', Colors.deepPurple, () {
                  _showFeatureMessage('এক্সাম ও রেজাল্ট মডিউল ওপেন হচ্ছে...');
                }),
                _buildFeatureCard(Icons.psychology, 'এআই জ্যামিনী', Colors.teal, () {
                  _showFeatureMessage('এআই জ্যামিনী (Gemini AI) চ্যাটবট ওপেন হচ্ছে...');
                }),
                _buildFeatureCard(Icons.mic, 'ভয়েস সিস্টেম', Colors.indigo, () {
                  _showFeatureMessage('ভয়েস কমান্ড ও ভয়েস অ্যাসিস্ট্যান্ট চালু হচ্ছে...');
                }),
                _buildFeatureCard(Icons.photo_camera, 'ফটো এডিটর', Colors.blue, () {
                  _showFeatureMessage('ফটো এডিটর ওপেন হচ্ছে...');
                }),
                _buildFeatureCard(Icons.video_library, 'ভিডিও নির্মাণ', Colors.orange, () {
                  _showFeatureMessage('ভিডিও নির্মাণ টুলস ওপেন হচ্ছে...');
                }),
                _buildFeatureCard(Icons.picture_as_pdf, 'পিডিএফ রিডার', Colors.red, () {
                  _showFeatureMessage('পিডিএফ ফাইল স্ক্যানার ওপেন হচ্ছে...');
                }),
                _buildFeatureCard(Icons.print, 'প্রিন্টার', Colors.purple, () {
                  _showFeatureMessage('প্রিন্টার কানেকশন চেক করা হচ্ছে...');
                }),
              ],
            ),

            const SizedBox(height: 30),

            // বিভিন্ন প্রতিষ্ঠান ও মাদ্রাসার লোগো সেকশন
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'প্রতিষ্ঠানের লোগো ও প্রতীকসমূহ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
            ),
            const SizedBox(height: 15),

            // লোগো দেখানোর জন্য হরিজন্টাল লিস্ট
            SizedBox(
              height: 90,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildLogoItem('মাদ্রাসা লোগো', Icons.school, Colors.brown),
                  _buildLogoItem('অফিসিয়াল লোগো', Icons.business, Colors.blueGrey),
                  _buildLogoItem('বোর্ড লোগো', Icons.account_balance, Colors.amber.shade800),
                  _buildLogoItem('অন্যান্য লোগো', Icons.star, Colors.deepOrange),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ফিচার কার্ড তৈরির ফাংশন
  Widget _buildFeatureCard(IconData icon, String title, Color color, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36, color: color),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: color),
            ),
          ],
        ),
      ),
    );
  }

  // লোগো আইটেম তৈরির ফাংশন
  Widget _buildLogoItem(String title, IconData icon, Color color) {
    return Container(
      width: 90,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 30, color: color),
          const SizedBox(height: 5),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  void _showFeatureMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
    );
  }
}
