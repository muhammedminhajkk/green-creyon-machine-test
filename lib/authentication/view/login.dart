import 'package:flutter/material.dart';
import 'package:green_craeon_machine_test/authentication/view/register.dart';
import 'package:green_craeon_machine_test/homepage/view/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    String user ='minhaj';
   
   

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
            const Text('Password'),
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
            InkWell(
                onTap: () {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return const RegisterPage();
                  }));
                },
                child:
                    const Text('Dont have an Account?                Sign in')),
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
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return  const HomePage();
                      }));
                    },
                    child: const Text(
                      'Done',
                      style: TextStyle(
                          fontWeight: FontWeight.w900, color: Colors.white),
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
