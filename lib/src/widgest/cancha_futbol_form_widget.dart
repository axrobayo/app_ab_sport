import 'dart:io';

import 'package:ab_sport/src/models/foto_models.dart';
import 'package:ab_sport/src/services/foto_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:trifasic_101/src/models/foto_model.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:trifasic_101/src/services/foto_service.dart';

class CanchaFutbolFormWidget extends StatefulWidget {
  const CanchaFutbolFormWidget({Key? key, required this.idFutbol})
      : super(key: key);
  final String idFutbol;

  @override
  _CanchaFutbolFormWidgetState createState() => _CanchaFutbolFormWidgetState();
}

class _CanchaFutbolFormWidgetState extends State<CanchaFutbolFormWidget> {
  late Foto _foto;
  File? _imagen;
  final ImagePicker _picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();
  bool _onSaving = false;
  final FotoService _fotoService = FotoService();

  @override
  void initState() {
    super.initState();
    _foto = Foto.created(widget.idFutbol);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0),
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            width: size.width * .80,
            decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                    width: 2.0, color: Theme.of(context).primaryColorDark)),
            child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 14.0, horizontal: 7.0),
                  child: Column(children: [
                    TextFormField(
                        keyboardType: TextInputType.text,
                        initialValue: _foto.observacion,
                        onSaved: (value) {
                          //Este evento se ejecuta cuando el Form ha sido guardado localmente
                          _foto.observacion =
                              value; //Asigna el valor del TextFormField al atributo del modelo
                        },
                        validator: (value) {
                          return _validateObservacion(value!);
                        },
                        decoration:
                            const InputDecoration(labelText: "Observación"),
                        maxLength: 255,
                        maxLines: 3),
                    Padding(
                        padding: const EdgeInsets.only(top: 7.0),
                        child: Text("Ingresar la fecha",
                            style: Theme.of(context).textTheme.subtitle1)),
                    DatePickerWidget(
                        lastDate: DateTime.now(),
                        looping: false, // default is not looping
                        dateFormat: "dd-MMMM-yyyy",
                        locale: DatePicker.localeFromString('es'),
                        onChange: (DateTime newDate, _) {
                          _foto.fecha = newDate;
                        }),
                    Padding(
                        padding: const EdgeInsets.only(top: 7.0),
                        child: Text("Ingresar la imagen ",
                            style: Theme.of(context).textTheme.subtitle1)),
                    SizedBox(
                        height: 100.h,
                        width: 150.h,
                        child: Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: _imagen == null
                              ? Image.asset('assets/images/futbol.jpeg')
                              : Image.file(_imagen!),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton.icon(
                            onPressed: () => _selectImage(ImageSource.camera),
                            icon: const Icon(Icons.camera),
                            label: const Text("Cámara")),
                        ElevatedButton.icon(
                            onPressed: () => _selectImage(ImageSource.gallery),
                            icon: const Icon(Icons.image),
                            label: const Text("Galería")),
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: _onSaving
                            ? const CircularProgressIndicator()
                            : Tooltip(
                                message: "Registrar observación ",
                                child: ElevatedButton.icon(
                                    onPressed: () {
                                      _sendForm();
                                    },
                                    label: const Text("Guardar"),
                                    icon: const Icon(Icons.save)),
                              ))
                  ]),
                )),
          ),
        ],
      ),
    );
  }

  _selectImage(ImageSource source) async {
    XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      _imagen = File(pickedFile.path);
    } else {
      _imagen = null;
      //print('No image selected.');
    }
    setState(() {});
  }

  _validateObservacion(String value) {
    if (value.length < 15) {
      return "Debe ingresar al menos 15 caracteres";
    }
    return null; //Cuando se retorna nulo el campo te texto está validado
  }

  _sendForm() async {
    if (!_formKey.currentState!.validate()) return;

    _onSaving = true;
    setState(() {});

    //_foto.inicial = widget.isInicio;

    _formKey.currentState!.save(); //Guarda el form localmente

    if (_imagen != null) {
      _foto.url = await _fotoService.uploadImage(_imagen!);
    }

    //Invoca al servicio POST para enviar la Foto
    int estado = await _fotoService.postFoto(_foto);
    if (estado == 201) {
      _formKey.currentState!.reset();
      _onSaving = false;
      Navigator.pop(context);
    }
  }
}
