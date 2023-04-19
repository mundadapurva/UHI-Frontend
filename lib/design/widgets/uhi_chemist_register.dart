import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/auth_bloc/auth_bloc.dart';

class UhiChemistRegister extends StatefulWidget {
  const UhiChemistRegister({super.key});

  @override
  State<UhiChemistRegister> createState() => _UhiChemistRegisterState();
}

class _UhiChemistRegisterState extends State<UhiChemistRegister> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _shopAddressController = TextEditingController();
  final TextEditingController _licenseController = TextEditingController();
  final TextEditingController _shopNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Register as a Chemist',
        ),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is AuthSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
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
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              padding: const EdgeInsets.all(20),
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
                    'LICENSE NUMBER',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your license number';
                      }
                      return null;
                    },
                    controller: _licenseController,
                    maxLength: 10,
                    decoration: const InputDecoration(
                      hintText: 'Enter your license number',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(5),
                      counter: Offstage(),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'SHOP NAME',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your shop name';
                      }
                      return null;
                    },
                    controller: _shopNameController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your shop name',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(5),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'SHOP ADDRESS',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your city';
                      }
                      return null;
                    },
                    controller: _shopAddressController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your city',
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
                    maxLength: 12,
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
                    obscureText: true,
                    controller: _confirmPasswordController,
                    maxLength: 12,
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
                              BlocProvider.of<AuthBloc>(context).add(
                                AuthRegisterChemistEvent(
                                  name: _nameController.text,
                                  phone: _phoneController.text,
                                  email: _emailController.text,
                                  license: _licenseController.text,
                                  shopName: _shopNameController.text,
                                  shopAddress: _shopAddressController.text,
                                  password: _passwordController.text,
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Passwords do not match'),
                                ),
                              );
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
