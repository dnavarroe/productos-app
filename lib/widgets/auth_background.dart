import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;
  const AuthBackground({
    super.key, 
    required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.deepPurple,
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children:[
          const _PurpleBox(),
          const _HeaderIcon(),
          child
        ],
      ),
    );
  }
}

class _PurpleBox extends StatelessWidget {
  const _PurpleBox({super.key});

  @override
  Widget build(BuildContext context) {

    final Size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: Size.height*0.4,
      decoration: _gradientPurple(),
      child: Stack(
        children: const [
          Positioned(top: 50, left: 40,child: _Bubble(),),
          Positioned(top: -30, right: 50,child: _Bubble()),
          Positioned(bottom: 30, right: 120,child: _Bubble()),
          Positioned(bottom: -30, left: -15,child: _Bubble()),
          Positioned(bottom: 70, right: -45,child: _Bubble())
        ],
      ),
    );
  }

  BoxDecoration _gradientPurple() => const BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color.fromRGBO(63, 63, 156, 1),
        Color.fromRGBO(90, 70, 178, 1)
      ]
    )
  );
}

class _Bubble extends StatelessWidget {
  const _Bubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Color.fromRGBO(255, 255, 255, 0.05)
      ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  const _HeaderIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 30),
        child: const Icon(Icons.person_pin, color: Colors.white, size: 100,),
      )
    );
  }
}