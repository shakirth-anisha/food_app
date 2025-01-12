import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Breakfast",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
		elevation: 0.0,
        centerTitle: true,
		leading: Container(
			margin: EdgeInsets.all(10),
			decoration: BoxDecoration(
				color: const Color.fromARGB(15, 0, 0, 0),
				borderRadius: BorderRadius.circular(10)
			),
			
		),
      ),
    );
  }
}
