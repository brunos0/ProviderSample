import 'package:flutter/material.dart';
import 'Provider/provider.dart';
import 'dart:math';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  String geraNome() {
    List<String> vogal = ['a', 'e', 'i', 'o', 'u'];
    List<String> consoante = ['b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm'];
    consoante.addAll(['n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'x', 'y', 'z']);

    String nomeGerado1 = '';
    String nomeGerado2 = '';
    int letra1nome = Random().nextInt(8) + 2; //de 2 / 10 letras: 1 nome
    int letra2nome = Random().nextInt(8) + 2; //de 2 / 10 letras: 2 nome

    for (int a = 1; a <= letra1nome; a++) {
      if ((a % 2) == 0) {
        nomeGerado1 += consoante[Random().nextInt(21)];
      } else {
        nomeGerado1 += vogal[Random().nextInt(5)];
      }
    }

    nomeGerado1 = nomeGerado1[0].toUpperCase() + nomeGerado1.substring(1);
    nomeGerado1 += ' ';

    for (int a = 1; a <= letra2nome; a++) {
      if ((a % 2) == 0) {
        nomeGerado2 += consoante[Random().nextInt(21)];
      } else {
        nomeGerado2 += vogal[Random().nextInt(5)];
      }
    }
    nomeGerado2 = nomeGerado2[0].toUpperCase() + nomeGerado2.substring(1);
    return nomeGerado1 + nomeGerado2;
  }

  cadPessoa(ctx) {
    ctx?.estadoPessoa.nome = geraNome(); //'Maria Joao';
    ctx?.estadoPessoa.idade = Random().nextInt(100);
    ctx?.estadoPessoa.sexo = Random().nextInt(3);
    ctx?.estadoPessoa.pcd = Random().nextBool();
  }

  @override
  Widget build(BuildContext context) {
    //
    final xpto = ProviderForm.of(context);
    /*
    String nome = '';
    if (xpto?.estadoPessoa.qNome == null) {
      nome = '';
    } else {
      nome = xpto!.estadoPessoa.qNome;
    }
    */
    /*
    //print("teste");
    var idade = xpto?.estadoPessoa.qIdade;
    String idComp = '';
    if (idade != null) {
      idComp = (idade == 1
          ? 'ano'
          : idade > 2
              ? 'anos'
              : '');
    }

    */
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: const Text("Cadastro Pessoa"),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Column(children: [
                  const Text('com o const'),
                  const FormPessoa(),
                  const Text('sem o const'),
                  FormPessoa(), //aqui não pode ser const

                  /*
                Column(children: [
                  Text(
                      "O nome atual da pessoa é: ${xpto?.estadoPessoa.qNome ?? ('_' * 21)}."),
                  Text(
                      "A idade atual da pessoa é:  ${idade ?? ('_' * 8)} ${idComp}."),
                  Text(
                      "O sexo atual da pessoa é: ${xpto?.estadoPessoa.qSexo ?? ('_' * 13)}."),
                  Text(
                      "A pessoa atual é PCD: ${xpto?.estadoPessoa.isPcd ?? ('_' * 3)}."),
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Divider(color: Colors.black, height: 10),
                  ),
                  */
                  const Text(
                      "Clique no botão abaixo para criar e \n cadastrar uma pessoa aleatoriamente: \n\n",
                      //"Maria João, 32 anos, Não informado, Não PCD. \n",
                      textAlign: TextAlign.center),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          cadPessoa(xpto);
                        });
                      },
                      child: const Text("Cadastrar")),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Sair")),
                ]),
              ),
            )));
  }
}

class FormPessoa extends StatelessWidget {
  const FormPessoa({super.key});

  @override
  //List<Widget> build(BuildContext context) {
  Widget build(BuildContext context) {
    final xpto = ProviderForm.of(context);
    var idade = xpto?.estadoPessoa.qIdade;
    String idComp = '';
    if (idade != null) {
      idComp = (idade == 1
          ? 'ano'
          : idade > 2
              ? 'anos'
              : '');
    }

    return Column(children: [
      Text(
          "O nome atual da pessoa é: ${xpto?.estadoPessoa.qNome ?? ('_' * 21)}."),
      //Text("A idade atual da pessoa é:  ${idade ?? ('_' * 8)} ${idComp}."),
      Text("A idade atual da pessoa é:  ${idade ?? ('_' * 8) + idComp}."),
      Text(
          "O sexo atual da pessoa é: ${xpto?.estadoPessoa.qSexo ?? ('_' * 13)}."),
      Text("A pessoa atual é PCD: ${xpto?.estadoPessoa.isPcd ?? ('_' * 3)}."),
      const Padding(
        padding: EdgeInsets.all(20),
        child: Divider(color: Colors.black, height: 10),
      ),
    ]);
  }
}
