import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:landing_page/design/pages/login_page.dart';
import 'package:landing_page/logic/auth_bloc/auth_bloc.dart';

import '../../home_page.dart';

class UhiPatientRegister extends StatefulWidget {
  const UhiPatientRegister({super.key});

  @override
  State<UhiPatientRegister> createState() => _UhiPatientRegisterState();
}

class _UhiPatientRegisterState extends State<UhiPatientRegister> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _aadharController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is AuthSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(
                id: state.id,
                type: state.type ?? 'user',
              ),
            ),
          );
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Patient Register'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'NAME',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    controller: _nameController,
                    keyboardType: TextInputType.name,
                    maxLength: 50,
                    decoration: const InputDecoration(
                      hintText: 'Enter your name',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(5),
                      counter: Offstage(),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'PHONE NUMBER',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                    decoration: const InputDecoration(
                      hintText: 'Enter your phone number',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(5),
                      counter: Offstage(),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'EMAIL',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    maxLength: 320,
                    decoration: const InputDecoration(
                      hintText: 'Enter your email',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(5),
                      counter: Offstage(),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'AADHAAR NUMBER',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your aadhaar number';
                      }
                      return null;
                    },
                    controller: _aadharController,
                    maxLength: 12,
                    decoration: const InputDecoration(
                      hintText: 'Enter your license number',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(5),
                      counter: Offstage(),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Data of Birth',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your dob';
                      }
                      return null;
                    },
                    controller: _dobController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your dob',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(5),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'ADDRESS',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your address';
                      }
                      return null;
                    },
                    controller: _addressController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Enter your address',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(5),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'PASSWORD',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    obscureText: true,
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(5),
                      counter: Offstage(),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'CONFIRM PASSWORD',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your confirm password';
                      }
                      return null;
                    },
                    controller: _confirmPasswordController,
                    maxLength: 12,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Enter your confirm password',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(5),
                      counter: Offstage(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          textStyle: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if (_passwordController.text ==
                                _confirmPasswordController.text) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Processing Data'),
                                ),
                              );

                              log('Register button pressed');
                              BlocProvider.of<AuthBloc>(context)
                                  .add(AuthRegisterEvent(
                                name: _nameController.text,
                                phone: _phoneController.text,
                                email: _emailController.text,
                                aadhar: _aadharController.text,
                                address: _addressController.text,
                                password: _passwordController.text,
                                dob: _dobController.text,
                              ));
                            }
                          }
                        },
                        child: const Text(
                          'REGISTER',
                          style: TextStyle(fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
