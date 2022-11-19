import 'package:flutter/material.dart';

class OwnerPage extends StatefulWidget{
  const OwnerPage ({Key? key}) : super(key:key);
  @override
  State<OwnerPage> createState() => _OwnerPageState();
}
class _OwnerPageState extends State<OwnerPage>{
  @override
  Widget build(BuildContext contet){
    var screensize = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color(0xffE5E5E5),
              ),
            ),
            Positioned(
              //left: 30,
              left: screensize.width * 0.08,
              top: screensize.height * 0.08,
              child: InkWell(
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            Positioned(
              left: screensize.width * 0.85,
              top: screensize.height * 0.08,
              child: InkWell(
                child: Row(
                  children: [
                    Container(
                      child: const Icon(Icons.calendar_today, size: 28),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: screensize.width * 0.91,
              height: screensize.height * 0.19,
              decoration: const BoxDecoration(
                color:  Color(0xffA6D1E6),
              ),
              margin: EdgeInsets.only(
                top: screensize.height * 0.15,
                left: screensize.width * 0.04,
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: screensize.height * 0.02,
                      right: screensize.width * 0.6,
                    ),
                    child: Text(
                      '18 Dec 2019',
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    ),
                    //Positioned(),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: screensize.height * 0.01,
                      right: screensize.width * 0.55,
                    ),
                    child: Text(
                      'Vishwas Bhatt',
                      style: TextStyle(fontSize: 20, fontFamily: 'Readxpro'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: screensize.height * 0.01,
                      right: screensize.width * 0.67,
                    ),
                    child: Text(
                      'Sanskruti',
                      style: TextStyle(fontSize: 18,fontFamily: 'Readxpro'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: screensize.height * 0.0002,
                      left: screensize.width * 0.6,
                    ),
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(255, 240, 255, 100))
                      ),
                      onPressed: () {},
                      child: Text('View Report'),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: screensize.width * 0.91,
              height: screensize.height * 0.19,
              decoration: const BoxDecoration(
                color: Color(0xffA6D1E6),
              ),
              margin: EdgeInsets.only(
                top: screensize.height * 0.35,
                left: screensize.width * 0.04,
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: screensize.height * 0.02,
                      right: screensize.width * 0.6,
                    ),
                    child: Text(
                      '18 Dec 2019',
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: screensize.height * 0.01,
                        right: screensize.width * 0.55),
                    child: Text(
                      'Priyansh Bhatt',
                      style: TextStyle(fontSize: 20, fontFamily: 'Readxpro'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: screensize.height * 0.01,
                      right: screensize.width * 0.69,
                    ),
                    child: Text(
                      'Sanskruti',
                      style: TextStyle(fontSize: 18,fontFamily: 'Readxpro'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: screensize.height * 0.0002,
                      left: screensize.width * 0.6,
                    ),
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(255, 240, 255, 100))
                      ),
                      onPressed: () {},
                      child: Text('View Report'),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: screensize.width * 0.91,
              height: screensize.height * 0.19,
              decoration: const BoxDecoration(
                color: Color(0xffA6D1E6),
              ),
              margin: EdgeInsets.only(
                top: screensize.height * 0.55,
                left: screensize.width * 0.04,
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: screensize.height * 0.02,
                      right: screensize.width * 0.6,
                    ),
                    child: Text(
                      '18 Dec 2019',
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: screensize.height * 0.01,
                        right: screensize.width * 0.50),
                    child: Text(
                      'Shivam Shethiya',
                      style: TextStyle(fontSize: 20, fontFamily: 'Readxpro'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: screensize.height * 0.01,
                      right: screensize.width * 0.69,
                    ),
                    child: Text(
                      'Sanskruti',
                      style: TextStyle(fontSize: 18,fontFamily: 'Readxpro'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: screensize.height * 0.0002,
                      left: screensize.width * 0.6,
                    ),
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(255, 240, 255, 100))
                      ),
                      onPressed: () {},
                      child: Text('View Report'),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: screensize.width * 0.91,
              height: screensize.height * 0.19,
              decoration: const BoxDecoration(
                color: Color(0xffA6D1E6),
              ),
              margin: EdgeInsets.only(
                top: screensize.height * 0.75,
                left: screensize.width * 0.04,
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: screensize.height * 0.02,
                      right: screensize.width * 0.6,
                    ),
                    child: Text(
                      '18 Dec 2019',
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: screensize.height * 0.01,
                      right: screensize.width * 0.55,
                    ),
                    child: Text(
                      'Vedant Chavan',
                      style: TextStyle(fontSize: 20, fontFamily: 'Readxpro'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: screensize.height * 0.01,
                      right: screensize.width * 0.69,
                    ),
                    child: Text(
                      'Sanskruti',
                      style: TextStyle(fontSize: 18,fontFamily: 'Readxpro'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: screensize.height * 0.0002,
                      left: screensize.width * 0.6,
                    ),
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(255, 240, 255, 100))
                      ),
                      onPressed: () {},
                      child: Text('View Report'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}