import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmailForm extends StatefulWidget {
  const EmailForm({Key? key}) : super(key: key);

  @override
  _EmailFormState createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  //final _formKey = GlobalKey<FormState>();
  String conPara = "axrobayo@espe.edu.ec";
  final conAsunto = TextEditingController();
  final conDescripcion = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text("Envianos un correo"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
                //key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 14.0, horizontal: 7.0),
                  child: Column(children: [
                    ListTile(
                      title: const Text("Para:"),
                      subtitle: Text(conPara),
                    ),
                    TextFormField(
                        keyboardType: TextInputType.text,
                        controller: conAsunto,
                        validator: (value) {
                          return _validateAsunto(value!);
                        },
                        decoration: const InputDecoration(labelText: "Asunto"),
                        maxLength: 255,
                        maxLines: 3),
                    TextFormField(
                        keyboardType: TextInputType.text,
                        controller: conDescripcion,
                        validator: (value) {
                          return _validateDescripcion(value!);
                        },
                        decoration:
                            const InputDecoration(labelText: "Descripción"),
                        maxLength: 255,
                        maxLines: 5),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Tooltip(
                          message: "Registrar observación ",
                          child: ElevatedButton.icon(
                              onPressed: () => launchEmail(
                                    asunto: conAsunto.text,
                                    descripcion: conDescripcion.text,
                                  ),
                              label: const Text("Enviar"),
                              icon: const Icon(Icons.send)),
                        ))
                  ]),
                )),
          ],
        ),
      ));
  Future launchEmail({
    required String asunto,
    required String descripcion,
  }) async {
    final url =
        'mailto:$conPara?subject=${Uri.encodeFull(asunto)}&body=${Uri.encodeFull(descripcion)}';
    if (!await launch(url)) {
      throw 'no se puede acceder al siguiente enlace: $url';
    }
  }

  /*_validatePara(String value) {
    if (value.length < 5) {
      return "Debe ingresar al menos 5 caracteres";
    }
    return null; //Cuando se retorna nulo el campo te texto está validado
  }*/

  _validateAsunto(String value) {
    if (value.length < 5) {
      return "Debe ingresar al menos 5 caracteres";
    }
    return null; //Cuando se retorna nulo el campo te texto está validado
  }

  _validateDescripcion(String value) {
    if (value.length < 10) {
      return "Debe ingresar al menos 10 caracteres";
    }
    return null; //Cuando se retorna nulo el campo te texto está validado
  }
}
