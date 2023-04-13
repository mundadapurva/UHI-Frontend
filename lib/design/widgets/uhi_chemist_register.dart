import 'package:flutter/material.dart';

class UhiChemistRegister extends StatefulWidget {
  const UhiChemistRegister({super.key});

  @override
  State<UhiChemistRegister> createState() => _UhiChemistRegisterState();
}

class _UhiChemistRegisterState extends State<UhiChemistRegister> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
              'LANDMARK',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your landmark';
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: 'Enter your landmark',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(5),
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'CITY',
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
              decoration: const InputDecoration(
                hintText: 'Enter your city',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(5),
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'STATE',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your state';
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: 'Enter your state',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(5),
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'PINCODE',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your pincode';
                }
                return null;
              },
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Enter your pincode',
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
                  onPressed: () {},
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
    );
  }
}
