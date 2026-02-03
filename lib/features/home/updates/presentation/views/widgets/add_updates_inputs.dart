import 'package:flutter/material.dart';

class AddUpdatesInputs extends StatelessWidget {
  const AddUpdatesInputs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * .7,
          child: TextField(
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                fillColor: const Color(0xff1a2a58),
                focusColor: const Color(0xff1a2a58),
                hoverColor: const Color(0xff1a2a58),
                hintText: 'Type your message here...',
                hintStyle: const TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 107, 114, 133),
                )),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: const Color(0xff1a2a58),
              borderRadius: BorderRadius.circular(15),
              border:
                  Border.all(color: const Color.fromARGB(255, 169, 169, 169))),
          padding: const EdgeInsets.all(10),
          child: const Icon(
            Icons.attach_file,
            color: Colors.white,
            size: 27,
          ),
        )
      ],
    );
  }
}
