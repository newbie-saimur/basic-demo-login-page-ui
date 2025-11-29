import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formState = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  int currentIndex = 0;
  bool obscureText = true;
  var visibilityIcon = Icons.visibility_outlined;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
          },
          icon: Icon(Icons.menu),
        ),
        title: Text(
          "Coffee Bar",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.camera)),
          IconButton(
            onPressed: () {
              scaffoldKey.currentState!.openEndDrawer();
            },
            icon: Icon(Icons.more_vert),
          ),
        ],
        elevation: 2,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Logo Field
                Icon(Icons.coffee_sharp, color: Colors.deepPurple, size: 80),
                SizedBox(height: 16),
                Text(
                  "Welcome Back",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Sign in to continue",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey[600], fontSize: 16),
                ),
                SizedBox(height: 40),

                // Email Field
                Form(
                  key: formState,
                  autovalidateMode: _autovalidateMode,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (email) {
                          if (email!.isEmpty) {
                            return "Please enter your email address";
                          }
                          if (!RegExp(
                            r'^[a-z][a-z0-9\-\_]*(\.[a-z0-9\_\-]+)*@[a-z0-9]+(\.[a-z]+)+$',
                          ).hasMatch(email)) {
                            return "Please enter a valid email address";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Colors.grey[300]!,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.deepPurple,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: const Color.fromARGB(255, 251, 17, 1),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1.5,
                              color: const Color.fromARGB(255, 251, 17, 1),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          filled: true,
                          fillColor: Colors.grey[50],
                          labelText: "Email",
                          labelStyle: TextStyle(color: Colors.grey[700]),
                          hintText: "Enter your email",
                          hintStyle: TextStyle(color: Colors.grey[400]),
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: Colors.deepPurple,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 16),

                      // Password Field
                      TextFormField(
                        validator: (password) {
                          if (password!.isEmpty) {
                            return "Please enter your password";
                          }
                          return null;
                        },
                        obscureText: obscureText,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Colors.grey[300]!,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.deepPurple,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: const Color.fromARGB(255, 251, 17, 1),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1.5,
                              color: const Color.fromARGB(255, 251, 17, 1),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          filled: true,
                          fillColor: Colors.grey[50],
                          labelText: "Password",
                          labelStyle: TextStyle(color: Colors.grey[700]),
                          hintText: "Enter your password",
                          hintStyle: TextStyle(color: Colors.grey[400]),
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: Colors.deepPurple,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                obscureText = !obscureText;
                                visibilityIcon = obscureText
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined;
                              });
                            },
                            icon: Icon(visibilityIcon, color: Colors.grey[600]),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24),

                // Login Button
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (!formState.currentState!.validate()) {
                        _autovalidateMode = AutovalidateMode.onUserInteraction;
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular((12)),
                    ),
                    elevation: 2,
                  ),
                  child: Text(
                    "Sign In",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 16),

                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey[400])),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "OR",
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.grey[400])),
                  ],
                ),
                SizedBox(height: 16),

                // Google Sign In
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.g_mobiledata, size: 24),
                  label: Text("Continue with Google"),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.grey[800],
                    side: BorderSide(color: Colors.grey[300]!),
                    padding: EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                SizedBox(height: 24),

                // Sign Up Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.camera_alt),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Chat"),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
        backgroundColor: Colors.deepPurple,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w800),
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      drawer: Drawer(
        backgroundColor: Colors.deepPurple,
        child: SafeArea(
          child: Column(
            children: [
              DrawerHeader(
                padding: EdgeInsets.zero,
                margin: EdgeInsets.only(bottom: 20, top: 20),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1, color: Colors.blueGrey),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      child: ClipOval(
                        child: Image.asset(
                          "assets/images/author.jpg",
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      "Saimur Rahman Robin",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                    Text(
                      "Flutter Developer",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 174, 175, 176),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text("Home", style: TextStyle(color: Colors.white, fontSize: 18)),
              SizedBox(height: 20),
              Text(
                "Profile",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              SizedBox(height: 20),
              Text(
                "Address",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              SizedBox(height: 20),
              Text(
                "Settings",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              SizedBox(height: 20),
              Text(
                "Sign Out",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
      endDrawer: Drawer(
        backgroundColor: Colors.deepPurple,
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 30),
              Text("Home", style: TextStyle(color: Colors.white, fontSize: 18)),
              SizedBox(height: 30),
              Text(
                "Profile",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              SizedBox(height: 30),
              Text(
                "Address",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              SizedBox(height: 30),
              Text(
                "Settings",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              SizedBox(height: 30),
              Text(
                "Sign Out",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
