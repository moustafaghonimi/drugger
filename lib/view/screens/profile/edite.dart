import 'package:flutter/material.dart';
import 'user_pro.dart';

String? f_value;
String? l_value;
String? e_value;
String? p_value;
String? ad_value;
String? g_value;
int? a_value;

bool? save = false;
bool? changed = false;

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                save == false && changed == true
                    ? showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('you want to save'),
                            content: Text('Cancle Changes..'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('No')),
                              SizedBox(width: 20),
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      save = true;
                                      changed = false;
                                    });

                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Yes')),
                            ],
                          );
                        },
                      )
                    : Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back_ios)),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                        'data:image/png;base64,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'),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          f_value = value;
                        });
                      },
                      initialValue: firstName,
                      decoration: InputDecoration(
                        label: TextButton.icon(
                            onPressed: () {},
                            icon: Icon(
                              Icons.person,
                            ),
                            label: Text('Fisrt name')),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          l_value = value;
                        });
                      },
                      initialValue: lastName,
                      decoration: InputDecoration(
                        label: TextButton.icon(
                            onPressed: () {},
                            icon: Icon(
                              Icons.person,
                            ),
                            label: Text('Last name')),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
                initialValue: email,
                decoration: InputDecoration(
                  label: TextButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.email,
                      ),
                      label: Text('Email')),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    p_value = value;
                  });
                },
                initialValue: phoneNumber,
                decoration: InputDecoration(
                  label: TextButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.phone_android,
                      ),
                      label: Text('Phone')),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          g_value = value;
                        });
                      },
                      initialValue: gender,
                      decoration: InputDecoration(
                        label: TextButton.icon(
                            onPressed: () {},
                            icon: Icon(
                              Icons.wc,
                            ),
                            label: Text('Gender')),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          a_value == value;
                        });
                      },
                      initialValue: a_value.toString(),
                      decoration: InputDecoration(
                        label: TextButton.icon(
                            onPressed: () {},
                            icon: Icon(
                              Icons.date_range,
                            ),
                            label: Text('Age')),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    ad_value = value;
                  });
                },
                initialValue: address,
                decoration: InputDecoration(
                  label: TextButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.home,
                      ),
                      label: Text('Address')),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      change();
                    });
                  },
                  icon: Icon(Icons.save),
                  label: Text('Save'))
            ],
          ),
        ));
  }
}

void change() {
  firstName = f_value;
  lastName = l_value;
  email = e_value;
  phoneNumber = p_value;
  address = ad_value;
  gender = g_value;
  age = a_value;
}
