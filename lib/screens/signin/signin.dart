import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:petcarepal/config/app_routes.dart';
import 'package:petcarepal/constants/custom_scaffold.dart';
import 'package:petcarepal/screens/signin/service/auth_api.dart';
import 'package:petcarepal/screens/signup/signup.dart';
import 'package:petcarepal/screens/signin/auth_exceptions.dart';
import '../../constants/theme.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formSignInKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool rememberPassword = true;

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      key: _scaffoldKey,
      child: Column(
        children: [
          const Expanded(
            flex: 1,
            child: SizedBox(
              height: 10,
            ),
          ),
          Expanded(
            flex: 16,
            child: Container(
              padding: const EdgeInsets.fromLTRB(25.0, 35.0, 25.0, 20.0),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 48, 148, 248),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formSignInKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Chào mừng tới',
                        style: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.w900,
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Petcarepal',
                        style: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow,
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      TextFormField(
                        controller: _usernameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Nhập Tài Khoản';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: Color.fromARGB(255, 48, 148, 248),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          label: const Text('Tài Khoản'),
                          hintText: 'Nhập Tài Khoản',
                          hintStyle: const TextStyle(
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true, // Ẩn mật khẩu
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Nhập Mật Khẩu';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Color.fromARGB(255, 48, 148, 248),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          label: const Text('Mật Khẩu'),
                          hintText: 'Nhập Mật Khẩu',
                          hintStyle: const TextStyle(
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
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
                                activeColor: lightColorScheme.primary,
                              ),
                              const Text(
                                'Ghi nhớ đăng nhập',
                                style: TextStyle(
                                  color: Color.fromARGB(115, 255, 255, 255),
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            child: Text(
                              'Quên mật khẩu?',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 251, 252, 254),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formSignInKey.currentState!.validate() &&
                                rememberPassword) {
                              Object user = {
                                'username': _usernameController.text,
                                'password': _passwordController.text,
                              };
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Đang xử lý dữ liệu'),
                                ),
                              );

                              try {
                                // Gọi hàm đăng nhập
                                AuthService().signIn(context, user);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Đăng nhập thành công'),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                              } on AuthenticationError catch (error) {
                                String errorMessage = 'Đăng nhập thất bại.';
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(errorMessage),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              } catch (error) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Đã xảy ra lỗi trong quá trình đăng nhập. Vui lòng thử lại.',
                                    ),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              } finally {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                              }
                            } else if (!rememberPassword) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Vui lòng đồng ý xử lý dữ liệu cá nhân'),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.yellow,
                          ),
                          child: const Text(
                            'Đăng nhập',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUpScreen(),
                              ),
                            );
                          },
                          child: const Text('Đăng ký'),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Logo(Logos.facebook_f),
                          Logo(Logos.google),
                        ],
                      ),
                      const SizedBox(
                        height: 25.0,
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
