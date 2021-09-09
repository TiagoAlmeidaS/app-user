import 'package:app_user/features/data/models/user_model.dart';
import 'package:app_user/features/presenter/create_user/controller/create_user_store.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CreateUserPage extends StatefulWidget {
  const CreateUserPage({Key? key}) : super(key: key);

  @override
  _CreateUserPageState createState() => _CreateUserPageState();
}

class _CreateUserPageState
    extends ModularState<CreateUserPage, CreateUserStore> {
  late UserModel userModel;
  late GlobalKey<FormState> _formKeys;

  String name = "";
  String email = "";
  String pass = "";
  String passConfirmation = "";
  String cpfOrCnpj = "";
  String tel = "";

  @override
  void initState() {
    super.initState();
    _formKeys = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    bool validator() {
      if (_formKeys.currentState != null &&
          _formKeys.currentState!.validate()) {
        print("Validated");
        return true;
      } else {
        print("Is not Validated");
        return false;
      }
    }

    ScrollController controller = ScrollController();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
          title: Container(
              child: Text(
            "Cadastro",
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
        ),
        body: SingleChildScrollView(
            controller: controller,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              height: MediaQuery.of(context).size.height * 0.7,
              child: Form(
                key: _formKeys,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        child: TextFormField(
                      key: Key('name-field'),
                      validator: (val) =>
                          val!.isNotEmpty ? null : "Digite seu nome por favor",
                      decoration: InputDecoration(
                        hintText: "Nome:",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      keyboardType: TextInputType.text,
                      onChanged: (val) {
                        name = val;
                      },
                    )),
                    Container(
                        child: TextFormField(
                      key: Key('email-field'),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Digite seu e-mail por favor";
                        } else if (!val.contains("@")) {
                          return "Digite um e-mail válido por favor";
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "E-mail:",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (val) {
                        email = val;
                      },
                    )),
                    Container(
                        child: TextFormField(
                      key: Key('cpf-cnpj-field'),
                      validator: (val) => val!.isNotEmpty
                          ? null
                          : "Digite seu cpf/cnpj por favor",
                      decoration: InputDecoration(
                        hintText: "CPF/CNPJ:",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (val) {
                        cpfOrCnpj = val;
                      },
                    )),
                    Container(
                        child: TextFormField(
                      key: Key('tel-field'),
                      validator: (val) => val!.isNotEmpty
                          ? null
                          : "Digite seu telefone por favor",
                      decoration: InputDecoration(
                        hintText: "Telefone:",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (val) {
                        tel = val;
                      },
                    )),
                    Container(
                        child: TextFormField(
                      key: Key('pass-field'),
                      validator: (val) =>
                          val!.isNotEmpty ? null : "Digite sua senha por favor",
                      decoration: InputDecoration(
                        hintText: "Senha:",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      onChanged: (val) {
                        pass = val;
                      },
                    )),
                    Container(
                        child: TextFormField(
                      key: Key('pass-field'),
                      validator: (val) => (pass.isNotEmpty && val == pass)
                          ? null
                          : "Senha incorreta. Repita por favor",
                      decoration: InputDecoration(
                        hintText: "Senha confirmação:",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      onChanged: (val) {
                        passConfirmation = val;
                      },
                    )),
                    Container(height: 20),
                    Container(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blueAccent),
                            child: Text("Enviar"),
                            onPressed: () async {
                              if (validator()) {
                                try {
                                  userModel = UserModel(
                                      name: name,
                                      email: email,
                                      cpfOrCnpj: cpfOrCnpj,
                                      tel: tel,
                                      pass: pass);
                                  await store.createUser(userModel);
                                  Modular.to.pushNamed("/home");
                                } on Exception catch (e) {
                                  AwesomeDialog(
                                    context: context,
                                    animType: AnimType.SCALE,
                                    dialogType: DialogType.ERROR,
                                    body: Center(
                                      child: Text(
                                        e.toString().replaceAll("Exception: ", ""),
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic),
                                      ),
                                    ),
                                    title: 'This is Ignored',
                                    desc: 'This is also Ignored',
                                    btnOkOnPress: () {},
                                  )..show();
                                }
                              }
                            }))
                  ],
                ),
              ),
            )));
  }
}
