import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final bool? obscureText;
  const TextFieldWidget(
      {required this.controller,
      required this.title,
      this.obscureText,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).primaryTextTheme.bodySmall?.copyWith(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          color: Colors.grey,
          child: TextFormField(
            controller: controller,
            decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                counterText: '',
                filled: true,
                contentPadding:
                    EdgeInsets.only(left: 15, right: 3, bottom: 0, top: 40),
                fillColor: Colors.transparent),
            cursorColor: Theme.of(context).iconTheme.color,
            obscureText: obscureText ?? false,
          ),
        )
      ],
    );
  }
}
