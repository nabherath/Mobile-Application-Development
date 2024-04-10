import 'package:flutter/material.dart';
import 'package:mad_project/components/signin_drawer.dart';

class CustomScaff extends StatelessWidget {
  const CustomScaff({super.key, this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme:
            const IconThemeData(color: Color.fromARGB(255, 236, 236, 236)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      drawer: MySignDrawer(),
      body: Stack(
        children: [
          Image.asset('assets/images/mob.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity),
          SafeArea(
            child: child!,
          ),
        ],
      ),
    );
  }
}
