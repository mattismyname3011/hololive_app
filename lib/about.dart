import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children:[
        Column(
          children: [
            Image.asset("assets/hololive_landing_page.webp"),
            const Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: Center(
                child: Text(
                  'About',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.cyan,
                  ),
                ),
              
              ),
            ),
            const Center(
              child: Text(
                '"hololive production"',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.cyan,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                'With over 50 million fans on YouTube, hololive Production is a popular VTuber agency not only in Japan but all over the world.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
    
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}