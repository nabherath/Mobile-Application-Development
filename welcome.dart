import 'package:flutter/material.dart';
import 'package:mad_project/screens/signin.dart';
import 'package:mad_project/screens/signup.dart';
import 'package:mad_project/theme/theme.dart';
import 'package:mad_project/widgets/custom_scaffold.dart';
import 'package:mad_project/widgets/welcome_button.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaff(
      child: Column(
        children: [
          Flexible(
              flex: 6,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 40.0,
                ),
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      children: [
                        TextSpan(
                            text: 'Welcome To Apeksha Donation App\n',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30.0,
                              fontWeight: FontWeight.w600,
                            )),
                        TextSpan(
                            text: '\nEnter personal details to  Sign In',
                            style: TextStyle(
                              color: Color.fromARGB(251, 12, 80, 148),
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              height: 0,
                            ))
                      ],
                    ),
                  ),
                ),
              )),
          Flexible(
            // flex: 1,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Row(
                children: [
                  const Expanded(
                    child: WelcomeButton(
                      buttonText: 'Sign In',
                      onTap: SignIn(),
                      color: Colors.transparent,
                      textColor: Color.fromARGB(255, 7, 8, 8),
                    ),
                  ),
                  Expanded(
                    child: WelcomeButton(
                      buttonText: 'Sign up',
                      onTap: const SignUp(),
                      color: Colors.white,
                      textColor: lightColorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
