import 'package:caglar_portfolio/widgets/mobile_layout_widgets/mobile_contact/textfields.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  bool _enableBtn = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      onChanged: (() {
        setState(() {
          _enableBtn = _formKey.currentState!.validate();
        });
      }),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFields(
                controller: subjectController,
                name: "Subject",
                validator: ((value) {
                  if (value!.isEmpty) {
                    return 'Name is required';
                  }
                  return null;
                })),
            TextFields(
                controller: emailController,
                name: "Email",
                validator: ((value) {
                  if (value!.isEmpty) {
                    return 'Email is required';
                  } else if (!value.contains('@')) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                })),
            TextFields(
                controller: messageController,
                name: "Message",
                validator: ((value) {
                  if (value!.isEmpty) {
                    setState(() {
                      _enableBtn = true;
                    });
                    return 'Message is required';
                  }
                  return null;
                }),
                maxLines: null,
                type: TextInputType.multiline),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.5);
                        } else if (states.contains(MaterialState.disabled)) {
                          return Colors.grey;
                        }
                        return Colors.blue; // Use the component's default.
                      },
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ))),
                onPressed: () {},
                child: null,
              ),
            )
          ],
        ),
      ),
    );
  }
}
