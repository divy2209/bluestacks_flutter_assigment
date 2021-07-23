import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatelessWidget {

  final TextEditingController controller;
  final TextInputAction inputAction;
  final bool isObscure;
  final IconData icon;
  final String hintText;

  const InputField({
    required this.isObscure,
    required this.inputAction,
    required this.controller,
    required this.icon,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: size.height * 0.08,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.grey[500]!.withOpacity(0.4),
          borderRadius: BorderRadius.circular(16)
        ),
        child: Center(
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Icon(
                      icon,
                      size: 28,
                      color: Colors.white,
                    ),
                  ),
                  hintText: hintText,
                  hintStyle: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    height: 1.5
                  )
              ),
              style: TextStyle(
                fontSize: 22,
                color: Colors.black,
                height: 1.5
              ),
              obscureText: isObscure,
              textInputAction: inputAction,
            )
        ),
      ),
    );
  }
}