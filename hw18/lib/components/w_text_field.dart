import 'package:flutter/material.dart';
import 'package:weather_api/screens/home_screen.dart';

class WTextField extends StatefulWidget {
  const WTextField({
    super.key,
  });

  @override
  State<WTextField> createState() => _WTextFieldState();
}

class _WTextFieldState extends State<WTextField> {
  TextEditingController textEditingController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      cursorColor: Colors.grey[900],
      decoration: InputDecoration(
        focusColor: const Color.fromARGB(255, 0, 0, 0),
        prefixIconColor: Color.fromARGB(255, 0, 0, 0),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        fillColor: Color.fromARGB(174, 160, 160, 160),
        prefixIcon: const Icon(Icons.search),
        filled: true,
      ),
      onSubmitted: (text) {
        showBottomSheet(
          context: context,
          builder: (context) {
            return SelectingSheet(keyword: text);
          },
        );
      },
    );
  }
}
