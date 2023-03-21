import 'package:flutter/material.dart';
import 'Provider/provider.dart';
import 'cadastro.dart' as screencad;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderForm(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Exemplo de uso: Provider '),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  abreTela() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return const screencad.Cadastro();
    })).then((_) {
      setState(() {});
    });
  }

  /*
  refresh() {
    setState(() {});
  }
  */

  @override
  Widget build(BuildContext context) {
    final xpto = ProviderForm.of(context);
    /*
    late String nome; //= '';
    if (xpto?.estadoPessoa.qNome == null) {
      nome = "";
    } else {
      nome = xpto!.estadoPessoa.qNome;
    }
    */
    //print("debug");
    var idade = xpto?.estadoPessoa.qIdade;
    String idComp = '';
    if (idade != null) {
      idComp = (idade == 1
          ? 'ano'
          : idade > 2
              ? 'anos'
              : '');
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //caso o dado qNome seja nulo ele troca para '' senao ele traz o valor - espero eu
              Text(
                'O nome da pessoa é: ${xpto?.estadoPessoa.qNome ?? ('_' * 21)}.',
              ),
              //Text('O nome da pessoa é: $nome .'),
              Text(
                'A idade da pessoa é: ${idade ?? ('_' * 8) + idComp} .',
                //'A idade da pessoa é: ${idade ?? ('_' * 8) } ${idComp}.',
              ),
              Text(
                'O sexo da pessoa é: ${xpto?.estadoPessoa.qSexo ?? ('_' * 13)}.',
              ),
              Text(
                'A pessoa é PCD: ${xpto?.estadoPessoa.isPcd ?? ('_' * 3)}.',
              ),
              TextButton(
                  onPressed: () {
                    abreTela();
                  },
                  child: const Text(
                      'Cadastrar Pessoa')) /*,
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              */
            ],
          ),
        )
        /*,
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      */
        );
  }
}
