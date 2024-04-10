import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mad_project/components/drawer.dart';
import 'package:mad_project/pages/blood.dart';
import 'package:mad_project/pages/comfort_item.dart';
import 'package:mad_project/pages/fruits.dart';
import 'package:mad_project/pages/medicine.dart';
import 'package:mad_project/pages/nutrition.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 5, 2, 2)),
        backgroundColor: const Color.fromARGB(255, 166, 197, 232),
        title: const Text(
          textAlign: TextAlign.center,
          'Save Life',
        ),
      ),
      drawer: const MyDrawer(),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 166, 197, 232),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 50),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  title: Text('Hello Nethmini!',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: Colors.white)),
                  subtitle: Text('You Can Donate',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.white54)),
                  trailing: const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                        'assets/images/michael-dam-mEZ3PoFGs_k-unsplash.jpg'),
                  ),
                ),
                const SizedBox(height: 30)
              ],
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 166, 197, 232),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(200))),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 40,
                mainAxisSpacing: 30,
                children: [
                  itemDashboard(
                    context,
                    'Medicine',
                    CupertinoIcons.capsule,
                    const Color.fromARGB(255, 185, 133, 118),
                    Medicine(),
                  ),
                  // itemDashboard(
                  //   context,
                  //   'Medical Equipments',
                  //   CupertinoIcons.bandage,
                  //   Colors.green,
                  //   Equipment(),
                  // ),
                  itemDashboard(
                    context,
                    'Blood',
                    CupertinoIcons.drop_fill,
                    Colors.red,
                    Blood(),
                  ),
                  itemDashboard(
                    context,
                    'Fruits',
                    CupertinoIcons.heart_circle_fill,
                    Colors.brown,
                    Fruits(),
                  ),
                  itemDashboard(
                    context,
                    'Nutrition',
                    CupertinoIcons.cart_fill,
                    Colors.yellow,
                    Nutrition(),
                  ),
                  itemDashboard(
                    context,
                    'Comfort Items',
                    CupertinoIcons.gift_fill,
                    const Color.fromARGB(255, 108, 127, 224),
                    ComfortItems(),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }

  Widget itemDashboard(BuildContext context, String title, IconData icon,
      Color color, Widget pageToNavigate) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => pageToNavigate),
            );
          },
          child: Column(
            children: [
              Icon(
                icon,
                size: 40,
                color: color,
              ),
              const SizedBox(height: 10),
              Text(
                textAlign: TextAlign.center,
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
