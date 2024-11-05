import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:green_craeon_machine_test/authentication/view/login.dart';
import 'package:green_craeon_machine_test/homepage/view/home_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    int a = 0;String? user;
   
    Future<void> signUpWithEmail(String email, String password) async {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
user =userCredential.user?.email.toString();
        log("User signed up: ${userCredential.user?.email}");
        a = 1;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          log('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          log('An account already exists for that email.');
        } else {
          log('Failed with error code: ${e.code}');
          log(e.toString());
        }
      } catch (e) {
        log(e.toString());
      }
    }

    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    TextEditingController confirmpasswordcontroller = TextEditingController();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 67, 139, 255),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              flex: 2,
              child: SizedBox(),
            ),
            const Center(
                child: Text(
              'Weather\nAnd\nTodo Application',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            )),
            const Expanded(
              flex: 2,
              child: SizedBox(),
            ),
            const Text('Email'),
            Container(
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
              ),
              child: TextField(
                controller: emailcontroller,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const Expanded(
              child: SizedBox(),
            ),
            const Text('Create Password'),
            Container(
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
              ),
              child: TextField(
                controller: passwordcontroller,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const Expanded(
              child: SizedBox(),
            ),
            const Text('Confirm Password'),
            Container(
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
              ),
              child: TextField(
                controller: confirmpasswordcontroller,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  return const LoginPage();
                }));
              },
              child:
                  const Text('Already Have An Account?                Log in'),
            ),
            const Expanded(
              flex: 3,
              child: SizedBox(),
            ),
            Center(
              child: Container(
                height: 70,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 48, 48, 48)),
                child: Center(
                  child: TextButton(
                    onPressed: () async {
                      await signUpWithEmail(
                          emailcontroller.text, passwordcontroller.text);
                      if (passwordcontroller.text ==
                              confirmpasswordcontroller.text &&
                          a == 1) {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return  const HomePage();
                        }));
                      } else {
                        const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                    child: const Text(
                      "data",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            const Expanded(
              flex: 2,
              child: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
