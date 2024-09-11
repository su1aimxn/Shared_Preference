import 'package:flutter/material.dart';
import 'package:labshared_pref/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:labshared_pref/pages/first_page.dart';

class AnotherPage extends StatefulWidget {
  const AnotherPage({super.key});

  @override
  State<AnotherPage> createState() => _AnotherPageState();
}

class _AnotherPageState extends State<AnotherPage> {
  // Declare your variable for data
  String? myName;

  // Function to load data from SharedPreferences
  void loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      myName = prefs.getString("myname");
    });
  }

  // Function to remove data from SharedPreferences
  void removeData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.remove("myname");
    });
  }

  @override
  void initState() {
    loadData(); 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Another Page"),
        backgroundColor: Color(0xFFF48C06),
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFF48C06),  
              Color(0xFFF72585),  
              Color(0xFFFF006E),  
              Color(0xFFFFBA08),  
            ],
          ),
        ), 
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Text(
                myName ?? "รอสักครู่",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white.withOpacity(0.9),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),

              // Button to go to FirstPage
              ElevatedButton(
                onPressed: () {
                  removeData();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FirstPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: Colors.white,
                  shadowColor: Colors.black.withOpacity(0.3),
                  elevation: 5,
                ),
                child: const Text(
                  'FirstPage',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Button to go back to HomePage
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: const Color.fromARGB(255, 243, 131, 19), // Orange button color
                  shadowColor: Colors.black.withOpacity(0.3),
                  elevation: 5,
                ),
                child: const Text(
                  'Back',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
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
