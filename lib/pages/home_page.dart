import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:labshared_pref/pages/another_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Declare your variable for data
  String? myName;

  // Function to load data from SharedPreferences
  void loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      myName = prefs.getString("myname");
    });
  }

  @override
  void initState() {
    loadData(); // Load data when the page is initialized
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"), // Main title of the app bar
        backgroundColor: Colors.blueAccent,
        
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blueAccent,
              Colors.lightBlueAccent,
              Colors.cyan,
            ],
          ),
        ), // Gradient background
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Show the name or loading text
              Text(
                myName ?? "รอสักครู่...",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white.withOpacity(0.9),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),

              // Button to go to Another Page
              ElevatedButton(
                onPressed: () {
                  // Navigate to AnotherPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AnotherPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: Colors.white, // Button background
                  shadowColor: Colors.black.withOpacity(0.3),
                  elevation: 5,
                ),
                child: const Text(
                  'หน้าถัดไป',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
