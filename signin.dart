import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mad_project/otherpages/navigation.dart';
import 'package:mad_project/screens/signup.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:mad_project/widgets/custom_scaffold.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // static Future<User?> loginUsingEmaiPassword(
  //     {required String email,
  //     required String password,
  //     required BuildContext context}) async {
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //   User? user;
  //   try {
  //     UserCredential userCredential = await auth.signInWithEmailAndPassword(
  //         email: email, password: password);
  //     user = userCredential.user;
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == "user-not-found") {
  //       print('No user foun for that email');
  //     }
  //   }
  //   return user;
  // }

  final _formSignInKey = GlobalKey<FormState>();
  bool rememberPassword = false;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomScaff(
      child: Column(
        children: [
          const Expanded(
            flex: 1,
            child: SizedBox(
              height: 1,
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formSignInKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Sign In\n',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      //Email
                      TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Your Email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text("Email"),
                          hintText: 'Enter Your Email',
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      //Password
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        obscuringCharacter: '*',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Your Password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text("Password"),
                          hintText: 'Enter Your Password',
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          fillColor: Colors.black,
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: rememberPassword,
                                onChanged: (bool? value) {
                                  setState(() {
                                    rememberPassword = value!;
                                  });
                                },
                                activeColor: Colors.blueAccent,
                              ),
                              const Text(
                                'Remember Me',
                                style: TextStyle(
                                  color: Colors.black45,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            child: TextButton(
                              child: const Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent,
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formSignInKey.currentState!.validate() &&
                                rememberPassword) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Processing Data'),
                                ),
                              );
                            } else if (!rememberPassword) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Please agree to the processing of personal data')),
                              );
                            }
                            FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: _emailController.text,
                                    password: _passwordController.text)
                                .then((value) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (e) => Home(),
                                ),
                              ).onError((error, stackTrace) {
                                print("Error ${error.toString()}");
                              });
                            });
                          },
                          child: const Text(
                              style: TextStyle(
                                color: Colors.blueAccent,
                              ),
                              'Sign In'),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.9,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 10,
                            ),
                            child: Text(
                              'Sign up with',
                              style: TextStyle(
                                color: Colors.black45,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(EvaIcons.facebook),
                          Icon(EvaIcons.twitter),
                          Icon(EvaIcons.google),
                          Icon(BoxIcons.bxl_apple),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don\'t have an account? ',
                            style: TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (e) => const SignUp(),
                                ),
                              );
                            },
                            child: const Text(
                              'Sign up',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
