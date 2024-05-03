import 'package:flutter/material.dart';

class TitleBox extends StatelessWidget{
  const TitleBox({super.key, required this.title, this.text, this.widget});

  final String? text;
  final String title;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return  Stack(
        clipBehavior: Clip.none,
        children: [Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xff5B92C6), width: 4),
            borderRadius: BorderRadius.circular(30),),
          padding: const EdgeInsets.all(30),
          child: Center(

            child: getWidget(),
          ),
        ),

          Positioned(top:-12 , left: 20, child: Container(
            decoration: BoxDecoration(color: const Color(0xffB4D8F9),
                borderRadius: BorderRadius.circular(40)
            ),
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Text(title,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: Color(0xff5B92C6),
              ),
            ),
          ),
          )


        ]
    );
  }


  Widget getWidget(){

    if (text != null)
    {
      return Text(text!,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      );
    } else if (widget != null) {
      return widget!;
    }
    else{
      return const Text("Error no widget or text...", style: TextStyle(color: Colors.red),);
    }


  }

}