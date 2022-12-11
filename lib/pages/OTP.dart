
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:flutter_app/pages/home_page.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:otp_timer_button/otp_timer_button.dart';
class OTP extends StatefulWidget {
  const OTP({Key? key}) : super(key: key);

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  @override
  Widget build(BuildContext context) {
    OtpTimerButtonController controller = OtpTimerButtonController();
    return Scaffold(
      backgroundColor: const Color(0xffE5E5E5),
      appBar: AppBar(
        excludeHeaderSemantics: false,
        automaticallyImplyLeading: true,
        backgroundColor: const Color(0xffE5E5E5),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body:Form(
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 40, top: 40),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: const Image(
                        image: AssetImage('assets/images/OTP.png'),
                        height: 220.8,
                        width: 244,
                        fit: BoxFit.fitHeight),
                  ),
                ),
                // SizedBox(height: 10,),
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Text('Enter 4 digit code sent to your Email ID',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'DMSans',
                            fontSize: 21))),
                const SizedBox(
                  height: 20,
                ),
                OtpTextField(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  enabledBorderColor: Colors.black,
                  // focusedBorderColor: Color(0xffCED7F1),
                  decoration: const InputDecoration(
                      fillColor: Color(0xffCED7F1),
                      hintStyle: TextStyle(
                        color: Color(0xffC7D3F9),
                      )
                  ),
                  // fillColor: Color(0xffCED7F1),
                  // cursorColor: Color(0xffCED7F1),
                  numberOfFields: 4,
                  borderColor: const Color(0xffCED7F1),
                  showFieldAsBox: true,
                  onCodeChanged: (String code){

                  },
                  onSubmit: (String verificationCode){
                    showDialog(context: context, builder: (context){
                      return AlertDialog(
                        title: const Text('Verification Code'),
                        content: Text('Entered code is $verificationCode'),
                      );
                    });
                  },
                ),
               const SizedBox(
                 height: 20,
                ),
                // Center(
                //   child: OtpTimerButton(
                //     controller: controller,
                //     onPressed: () {},
                //     text: Text('Resend OTP'),
                //     duration: 120,
                //   ),
                // ),
                const SizedBox(
                  height: 20,
                ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   OtpTimerButton(
                     backgroundColor: const Color(0xffC7D3F9),
                     //textColor: Color(0xffC7D3F9),
                     height: 51,
                   //  buttonType: ButtonType.text_button, // or ButtonType.outlined_button
                    // loadingIndicator: CircularProgressIndicator(
                      // strokeWidth: 2,
                      // color: Colors.red,
                     //),
                   //  loadingIndicatorColor: Colors.red,
                     controller: controller,
                     onPressed: () {},
                     text: const Text('Resend OTP',style: TextStyle(
                         color: Colors.white,
                         fontWeight: FontWeight.bold,
                         fontSize:18,
                         fontFamily: 'ReadexPro'
                     ),),
                     duration: 120,
                   ),
                   MaterialButton(
                       onPressed: () {
                         Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) => const HomePage()),
                         );
                       },
                       child: Container(
                         height: 51,
                         width: 76,
                        // padding: EdgeInsets.all(2),
                         margin: const EdgeInsets.symmetric(horizontal: 5),
                         decoration: BoxDecoration(
                           color: const Color(0xffC7D3F9),
                           borderRadius: BorderRadius.circular(5.0),
                         ),
                         child: const Center(
                           child: Text("Verify", style: TextStyle(
                               color: Colors.white,
                               fontWeight: FontWeight.bold,
                               fontSize:18,
                               fontFamily: 'ReadexPro'
                           ),
                           ),
                         ),
                       )
                   ),
                 ],
               ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
