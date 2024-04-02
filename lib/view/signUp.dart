import 'package:flutter/material.dart';
import 'package:notes_app/controller/auth_controller.dart';
import 'package:notes_app/view/add_note.dart';
import 'package:notes_app/view/home.dart';
import 'package:notes_app/view/signIn.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final getPrvdr = Provider.of<AuthController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(
              'Hi..Welcome',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                  label: Text("Email"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                  label: Text("Password"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          const Color.fromARGB(255, 0, 67, 121))),
                  onPressed: () async {
                    try {
                      await getPrvdr.signUp(
                          _emailController.text, _passwordController.text);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ));
                    } catch (e) {
                      rethrow;
                    }
                  },
                  child: Text(
                    'SignUp',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            Row(
              children: [
                Text('Already you have an Account?'),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignInScreen(),
                          ));
                    },
                    child: Text('SignIn'))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
