import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home_page.dart';

class AfterPage extends StatefulWidget {
  const AfterPage({Key? key}) : super(key: key);

  @override
  State<AfterPage> createState() => _AfterPageState();
}

class _AfterPageState extends State<AfterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color(0xffBDE6F1),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'assets/images/Polygon_contact.png',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.7,
                fit: BoxFit.fill,
                color: const Color(0xffE5E5E5),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/images/contact_bgimage.png',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.42,
                fit: BoxFit.contain,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: FittedBox(
                fit: BoxFit.cover,
                child: Text(
                  'Thank you for contacting us\nYour reply has been recorded',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 23,
              child: InkWell(
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const HomePage()));
                },
              ),
            ),
            const Positioned(
              top: 20,
              child: Text(
                "Contact Us",
                style: TextStyle(fontSize: 30, fontFamily: 'OpenSans'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
