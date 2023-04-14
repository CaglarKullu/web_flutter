import 'dart:convert';

import 'package:caglar_portfolio/widgets/mobile_layout_widgets/mobile_contact/textfields.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutter_dotenv/flutter_dotenv.dart';

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
  void dispose() {
    super.dispose();
    emailController.dispose();
    subjectController.dispose();
    messageController.dispose();
  }

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
                        return const Color.fromRGBO(
                            32, 184, 1, 1); // Use the component's default.
                      },
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ))),
                onPressed: _enableBtn
                    ? () {
                        sendEmail(
                            email: emailController.text,
                            message: messageController.text,
                            subject: subjectController.text);
                      }
                    : null,
                child: const Text(
                  "Send",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future sendEmail({
    required String email,
    required String message,
    required String subject,
  }) async {
    try {
      final serviceId = dotenv.env['SERVICE_ID'];
      final templateId = dotenv.env['TEMPLETE_ID'];
      final userId = dotenv.env['USER_ID'];
      final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
      final response = await http.post(
        url,
        headers: {
          'origin': 'http:localhost',
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'user_subject': subject,
            'user_message': message,
            'user_email': email,
          },
        }),
      );
      print(response.statusCode.toString());
    } catch (e) {
      print(e);
    }
  }
}
