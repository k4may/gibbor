import 'package:flutter/material.dart';
import 'package:Gibbor/auth/service/auth_service.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Perfil'),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: OutlinedButton(
            onPressed: () => context.read<AuthService>().logout(),
            style: OutlinedButton.styleFrom(
              primary: Colors.red,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Sair',
                    style: TextStyle(fontSize: 18),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
