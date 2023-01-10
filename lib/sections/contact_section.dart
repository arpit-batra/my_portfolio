import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/heading.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({Key? key}) : super(key: key);

  inputFieldDecoration() {
    return const InputDecoration(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderSide: BorderSide(width: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const Heading(text: 'Contact', dark: true),
          const SizedBox(
            height: 10,
          ),
          Form(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 64),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 1, child: Text("Name:")),
                      Expanded(
                          flex: 5,
                          child: TextFormField(
                            decoration: inputFieldDecoration(),
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 64),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(flex: 1, child: Text("Email:")),
                      Expanded(
                          flex: 5,
                          child: TextFormField(
                            decoration: inputFieldDecoration(),
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 64),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(flex: 1, child: Text("Message:")),
                      Expanded(
                          flex: 5,
                          child: TextFormField(
                            decoration: inputFieldDecoration(),
                            maxLength: 1000,
                            maxLines: 5,
                          ))
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(16),
                    child: TextButton(
                      onPressed: () {},
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 3,
                              )),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
                            ),
                          )),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
