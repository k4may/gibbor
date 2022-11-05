import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gibbor/auth/service/auth_service.dart';
import 'package:gibbor/const/icons.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final senha = TextEditingController();
  bool loading = false;

  bool isLogin = true;
  late String titulo;
  late String actionButton;
  late String toggleButton;

  @override
  void initState() {
    super.initState();
    setFormAction(true);
  }

  setFormAction(bool acao) {
    setState(() {
      isLogin = acao;
      if (isLogin) {
        titulo = 'Bem Vindo';
        actionButton = 'Login';
        toggleButton = 'Ainda não tem conta? Cadastre-se agora.';
      } else {
        titulo = 'Crie sua conta';
        actionButton = 'Cadastrar';
        toggleButton = 'Voltar ao login';
      }
    });
  }

  login() async {
    setState(() => loading = true);
    try {
      await context.read<AuthService>().login(email.text, senha.text);
    } on AuthExceptions catch (e) {
      setState(() => loading = false);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message),
      ));
    }
  }

  register() async {
    setState(() => loading = true);
    try {
      await context.read<AuthService>().register(email.text, senha.text);
    } on AuthExceptions catch (e) {
      setState(() => loading = false);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Form(
            key: formKey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                height: 70,
                child: SvgPicture.asset(
                  gibbor,
                  color: const Color(0xFF394730),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: TextFormField(
                  controller: email,
                  decoration: const InputDecoration(
                      //border: OutlineInputBorder(),
                      labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Informe o email corretamente';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 24.0),
                child: TextFormField(
                  controller: senha,
                  obscureText: true,
                  decoration: const InputDecoration(
                    // border: OutlineInputBorder(),
                    labelText: 'Senha',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Informe sua senha!';
                    } else if (value.length < 6) {
                      return 'Sua senha deve ter no mínimo 6 caracteres';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF394730)),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      if (isLogin) {
                        login();
                      }
                    }
                    register();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: (loading)
                        ? [
                            const Padding(
                              padding: EdgeInsets.all(16),
                              child: SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ]
                        : [
                            const Icon(Icons.check),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                actionButton,
                                style: const TextStyle(fontSize: 20),
                              ),
                            )
                          ],
                  ),
                ),
              ),
              TextButton(
                onPressed: () => setFormAction(!isLogin),
                child: Text(toggleButton),
              ),
              const Divider(color: Colors.white),
            ]),
          ),
        ),
      ),
    );
  }
}
