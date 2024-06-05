import 'package:flutter/material.dart';
import 'package:tp_but_info/acteurs.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF663399),
      body: 
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Center(
              child: Text('Cinéma',
                style: TextStyle(color: Colors.white, fontSize: 36),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon : const Icon(
                    Icons.home, 
                    size: 50, 
                    color: Colors.white,
                  ), 
                  onPressed: () {
                    print("Bouton 1");
                  },
                ),
                IconButton(
                  icon : const Icon(
                    Icons.theater_comedy, 
                    size: 50, 
                    color: Colors.white,
                  ), 
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Acteurs()));
                  },
                ),
                IconButton(
                  icon : const Icon(
                    Icons.airplane_ticket, 
                    size: 50, 
                    color: Colors.white,
                  ), 
                  onPressed: () {
                    print("Bouton 3");
                  },
                ),
              ],
            ),
          ],
        )
    );
  }
  
}