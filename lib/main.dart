import 'package:flutter/material.dart';
import 'package:flutter_app/api_call.dart';
import 'package:flutter_app/fact_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Flutter Demo",
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: null,
          title: const Text("Login"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(hintText: "Email"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter email";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: passController,
                        obscureText: true,
                        decoration: const InputDecoration(hintText: "Password"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter password";
                          }
                          return null;
                        },
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              bool isLogin = await ApiCall().loginAPI(
                                  emailController.text, passController.text);
                              if (isLogin) {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const FactScreen(),
                                ));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("login failed")));
                              }
                            }
                          },
                          child: const Text("Login"))
                    ],
                  )),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const RegisterPage(),
                  ));
                },
                child: const Text(
                  "New User? Register",
                  style: TextStyle(color: Colors.blue),
                ),
              )
            ],
          ),
        ));
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  Future<bool> register(String name, String email, String password) async {
    return false;
  }

  @override
  build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Register"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration(hintText: "Name"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter name";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(hintText: "Email"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter email";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: passController,
                        obscureText: true,
                        decoration: const InputDecoration(hintText: "Password"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter password";
                          }
                          return null;
                        },
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              bool isRegister = await ApiCall().registerAPI(
                                  nameController.text,
                                  emailController.text,
                                  passController.text);
                              if (isRegister) {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const FactScreen(),
                                ));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("Register user Failed")));
                              }
                            }
                          },
                          child: const Text("Register"))
                    ],
                  )),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  "Existing User? Login",
                  style: TextStyle(color: Colors.blue),
                ),
              )
            ],
          ),
        ));
  }
}
