import 'package:ab_sport/src/bloc/signup_bloc.dart';
import 'package:ab_sport/src/models/usuario_model.dart';
//import 'package:ab_sport/src/services/usuario_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
late String us = "";

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _obscureText = true;
  final SignUpBloc _signUpBloc = SignUpBloc();
  //final UsuarioService _usrServ = UsuarioService();

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            color: Theme.of(context).primaryColorDark,
            height: size * 0.4,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80.0, left: 35.0, right: 35.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text("Registro de usuario",
                      style: Theme.of(context).textTheme.headline4!.apply(
                          color: Theme.of(context).scaffoldBackgroundColor)),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).hintColor, width: 2.0),
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        StreamBuilder<String>(
                            stream: _signUpBloc.usernameStream,
                            builder: (context, snapshot) {
                              return TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: _signUpBloc.changeUsername,
                                  decoration: InputDecoration(
                                      errorText: snapshot.error?.toString(),
                                      icon: const Icon(Icons.person),
                                      labelText: "Nombre",
                                      hintText: "Nombre y apellido"));
                            }),
                        StreamBuilder<String>(
                            stream: _signUpBloc.emailStream,
                            builder: (context, snapshot) {
                              return TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: _signUpBloc.changeEmail,
                                  decoration: InputDecoration(
                                      errorText: snapshot.error?.toString(),
                                      icon: const Icon(Icons.email),
                                      labelText: "Correo electrónico",
                                      hintText: "admin@absport.com"));
                            }),
                        StreamBuilder<String>(
                            stream: _signUpBloc.passwordStream,
                            builder: (context, snapshot) {
                              return TextField(
                                  onChanged: _signUpBloc.changePassword,
                                  obscureText: _obscureText,
                                  decoration: InputDecoration(
                                      errorText: snapshot.error?.toString(),
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            _obscureText = !_obscureText;
                                            setState(() {});
                                          },
                                          icon: Icon(
                                            _obscureText
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                          )),
                                      icon: const Icon(Icons.lock),
                                      labelText: "Contraseña"));
                            }),
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: StreamBuilder<bool>(
                              stream: _signUpBloc.formSignUpStream,
                              builder: (context, snapshot) {
                                return ElevatedButton.icon(
                                    onPressed: snapshot.hasData
                                        ? () async {
                                            Usuario usr = Usuario(
                                                displayName:
                                                    _signUpBloc.username,
                                                    
                                                email: _signUpBloc.email,
                                                password: _signUpBloc.password);
                                            await _register(usr);
                                            await _sendToServer(usr);
                                            //showDialog(context: context, builder: builder)
                                            showDialog(
                                              barrierDismissible: false,
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: const Text(
                                                    'Registro Completado',
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  content: SingleChildScrollView(
                                                    child: ListBody(
                                                      children: [
                                                        Image.asset(
                                                          "assets/images/visto.gif",
                                                          height: 125.0,
                                                          width: 125.0,
                                                        ),
                                                        const Text(
                                                          'Bienvenidos a "AB Sport", procede a iniciar sesión ',
                                                          textAlign: TextAlign.center,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                        child: const Align(
                                                            alignment: Alignment.center,
                                                            child: Text('Aceptar',
                                                                textAlign: TextAlign.center,
                                                                style: TextStyle(
                                                                  color: Colors.black,
                                                                ))),
                                                        onPressed: () {
                                                           Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (_) =>
                                                                  const LoginPage()));
                                                        })
                                                  ],
                                                );
                                              });
                                          }
                                        : null,
                                    icon: const Icon(Icons.login),
                                    label: const Text("Registrar"));
                              }),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    )));
  }
}

Future<void> _sendToServer(Usuario usuario) async {
  FirebaseFirestore.instance.runTransaction((Transaction transaction) async {
    CollectionReference reference;
    reference = FirebaseFirestore.instance.collection("usuario");
    await reference.add({
      // ignore: unnecessary_string_interpolations
      "uid": "$us",
      "name": usuario.displayName.toString(),
    });
  });
}

Future<void> _register(Usuario usuario) async {
  final User? user = (await _auth.createUserWithEmailAndPassword(
    email: usuario.email.toString(),
    password: usuario.password.toString(),
  ))
      .user;
  us = user!.uid;
  // ignore: unnecessary_null_comparison
}