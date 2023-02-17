import 'package:flutter/material.dart';
import 'package:my_portfolio/providers/section_heights_provider.dart';
import 'package:my_portfolio/widgets/animation/animated_heading.dart';
import 'package:my_portfolio/widgets/heading.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatefulWidget {
  ContactSection({Key? key}) : super(key: key);

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  String? _name;

  String? _message;

  final _formKey = GlobalKey<FormState>();
  final _sectionKey = GlobalKey();

  inputFieldDecoration() {
    return const InputDecoration(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderSide: BorderSide(width: 2),
      ),
    );
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  @override
  void didChangeDependencies() {
    //For Calculating height of the Section
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<SectionHeightsProvider>(context, listen: false)
          .setContactMeSectionHeight(_sectionKey.currentContext!.size!.height);
      // print(_sectionKey.currentContext!.size);
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      key: _sectionKey,
      children: [
        Row(
          children: [
            Expanded(
              child: Container(),
            ),
            const AnimatedHeading(text: 'Contact', dark: true),
            Expanded(child: Container()),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Form(
          key: _formKey,
          child: Column(
            children: [
              //Name
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
                        validator: (value) {
                          if (value == null || value == "" || value.isEmpty) {
                            return "Name can't be empty";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          _name = value;
                        },
                      ),
                    )
                  ],
                ),
              ),
              //message
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
                        validator: (value) {
                          if (value == null || value.isEmpty || value == "") {
                            return "Message cant be empty";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          _message = value;
                        },
                      ),
                    )
                  ],
                ),
              ),
              //Submit Button
              Padding(
                  padding: EdgeInsets.all(16),
                  child: TextButton(
                    onPressed: () async {
                      bool _isValid = _formKey.currentState!.validate();
                      if (_isValid) {
                        _formKey.currentState!.save();
                        try {
                          final Uri emailLaunchUri = Uri(
                            scheme: 'mailto',
                            // host: _clientEmail,
                            path: 'arpitbatra98@gmail.com',
                            query: encodeQueryParameters(<String, String>{
                              'subject':
                                  '*Portfolio Mail* $_name wants to connect ',
                              'body': '$_message \nRegards,\n$_name',
                            }),
                          );
                          print(await canLaunchUrl(emailLaunchUri));

                          launchUrl(emailLaunchUri);

                          // launchUrl(Uri.parse(
                          //     "mailto:arpitbatra98@gmail.com?Subject=Testing&body=This is a simple test"));
                        } catch (e) {
                          print(e);
                        }
                      }
                    },
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
    );
  }
}
