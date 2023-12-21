import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/http_request/post.dart';
import 'package:untitled/widgets/upload_image.dart';
import 'login_page.dart';



class SignupPage extends StatelessWidget {
  const SignupPage({Key? key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    TextEditingController usernameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    TextEditingController countryCodeController = TextEditingController();
    TextEditingController mobileNumberController = TextEditingController();
    TextEditingController branchController = TextEditingController();

    return Builder(builder: (BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              height: MediaQuery.of(context).size.height - 50,
              width: double.infinity,

              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        const SizedBox(height: 60.0),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Center(
                          child: ImagePickerWidget(),
                        ),

                        TextFormField(
                          controller: usernameController,
                          decoration: InputDecoration(
                              hintText: "Username",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  borderSide: BorderSide.none),
                              fillColor: Colors.purple.withOpacity(0.1),
                              filled: true,
                              prefixIcon: const Icon(Icons.person)),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a username';
                            }
                            if (!RegExp(r'^[a-z]+$').hasMatch(value)) {
                              return 'Username must contain only lowercase alphabetic characters';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),

                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: Colors.purple.withOpacity(0.1),
                            filled: true,
                            prefixIcon: const Icon(Icons.email),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter an email';
                            }
                            if (!RegExp(
                                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                .hasMatch(value)) {
                              return 'Enter a valid email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),

                        TextFormField(
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            hintText: "Password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide: BorderSide.none),
                            fillColor: Colors.purple.withOpacity(0.1),
                            filled: true,
                            prefixIcon: const Icon(Icons.password),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter a password';
                            }
                            // if (!RegExp(
                            //     r'^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$')
                            //     .hasMatch(value)) {
                            //   return 'Password must contains special character, number, lowercase letter,uppercase letter, and be at least 8 characters long';
                            // }
                            // Add more password validation logic here if needed
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),

                        TextFormField(
                          controller: confirmPasswordController,
                          decoration: InputDecoration(
                            hintText: "Confirm Password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide: BorderSide.none),
                            fillColor: Colors.purple.withOpacity(0.1),
                            filled: true,
                            prefixIcon: const Icon(Icons.password),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Confirm  password';
                            }
                            // Add password match validation logic here
                            if (passwordController.text != value) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),

                        Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                controller: countryCodeController,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                maxLength: 3,
                                decoration: InputDecoration(
                                  counterText: '',
                                  hintText: " 91",
                                  prefixText: "+",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    borderSide: BorderSide.none,
                                  ),
                                  fillColor: Colors.purple.withOpacity(0.1),
                                  filled: true,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                controller: mobileNumberController,
                                maxLength: 10,
                                decoration: InputDecoration(
                                  counterText: '',
                                  hintText: "Mobile Number",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18),
                                      borderSide: BorderSide.none),
                                  fillColor:
                                  Colors.purple.withOpacity(0.1),
                                  filled: true,
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your mobile number';
                                  }
                                  // Add more mobile number validation logic here if needed
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: Colors.purple.withOpacity(0.1),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16),
                          child: TextFormField(
                            controller: branchController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Branch You want to manage Ex' +
                                  " '6'",
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the branch';
                              }
                              // Add more branch validation logic here if needed
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding:
                      const EdgeInsets.only(top: 3, left: 3),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!
                              .validate()) {
                            String username =
                                usernameController.text;
                            String email = emailController.text;
                            String password =
                                passwordController.text;
                            String confirmPassword =
                                confirmPasswordController
                                    .text;
                            String countryCode =
                                countryCodeController.text;
                            String mobileNumber =
                                mobileNumberController.text;
                            String branch =
                                branchController.text;
                            makePostRequest(
                                username,
                                email,
                                password,
                                countryCode,
                                mobileNumber,
                                branch);
                          }
                        },
                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.symmetric(
                              vertical: 16),
                          backgroundColor:
                          Colors.purple,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                            "Already have an account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(), // Navigate to LoginPage
                              ),
                            );
                          },
                          child: const Text("Login",
                              style: TextStyle(
                                  color: Colors.purple)),
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
    });
  }
}
