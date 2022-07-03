import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        child: Image.asset('assets/images/login_page_pic.jpeg',height: 200,),
      ),
    );
  }
}
