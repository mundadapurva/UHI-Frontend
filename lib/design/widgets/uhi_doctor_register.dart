import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:landing_page/design/pages/login_page.dart';
import 'package:landing_page/logic/auth_bloc/auth_bloc.dart';

class UhiDoctorRegister extends StatefulWidget {
  const UhiDoctorRegister({super.key});

  @override
  State<UhiDoctorRegister> createState() => _UhiDoctorRegisterState();
}

class _UhiDoctorRegisterState extends State<UhiDoctorRegister> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _licenseController = TextEditingController();
  final _specialityController = TextEditingController();
  final _associatedHospitalController = TextEditingController();
  final _addressController = TextEditingController();
  final _qualificationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
        if (state is AuthSuccess) {
          // TODO: push to home page
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(
                type: 'doctor',
                id: state.id,
              ), // TODO: DoctorHomePage
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Doctor Registration'),
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
                    'SPECIALIZATION',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your specialization';
                      }
                      return null;
                    },
                    controller: _specialityController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your specialization',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(5),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'QUALIFICATION',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your qualification';
                      }
                      return null;
                    },
                    controller: _qualificationController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your specialization',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(5),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'ASSOCIATED HOSPITAL',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your associated hospital';
                      }
                      return null;
                    },
                    controller: _associatedHospitalController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your associated hospital',
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
                    decoration: const InputDecoration(
                      hintText: 'Enter your landmark',
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
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Processing Data'),
                                ),
                              );
                              BlocProvider.of<AuthBloc>(context).add(
                                AuthRegisterDoctorEvent(
                                  name: _nameController.text,
                                  phone: _phoneController.text,
                                  email: _emailController.text,
                                  license: _licenseController.text,
                                  specialization: _specialityController.text,
                                  hospital: _associatedHospitalController.text,
                                  address: _addressController.text,
                                  password: _passwordController.text,
                                  qualification: _qualificationController.text,
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
