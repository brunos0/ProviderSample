import 'package:flutter/widgets.dart';

class Cadastro {
  String? _nome;
  int? _sexo;
  int? _idade;
  bool? _pcd;

  get qNome {
    return _nome;
  }

  get qIdade {
    return _idade;
  }

  get qSexo {
    if (_sexo == 0) {
      return 'Não Informado';
    } else if (_sexo == 1) {
      return 'Masculino';
    } else if (_sexo == 2) {
      return 'Feminino';
    } /* else if (_sexo == 3) {
      return 'Não Binário';
    }*/
    //return _sexo;
  }

  get isPcd {
    if (_pcd == true) {
      return 'Sim';
    } else if (_pcd == false) {
      return 'Não';
    } else {
      return null;
    }
  }

  set nome(String nomeInf) {
    _nome = nomeInf;
  }

  set sexo(int sxVal) {
    _sexo = sxVal;
  }

  set idade(int idVal) {
    _idade = idVal;
  }

  set pcd(bool pcdVal) {
    _pcd = pcdVal;
  }

  bool permiteMudar() {
    if (_nome == null || _sexo == null || _idade == null || _pcd == null) {
      return false;
    }
    return true;
  }
}

class ProviderForm extends InheritedWidget {
  final Cadastro estadoPessoa = Cadastro();

  ProviderForm({required super.child, super.key});

  static ProviderForm? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ProviderForm>();
    //return context.dependOInheritedWidgetOfExactType<ProviderForm>();
  }

  @override
  bool updateShouldNotify(ProviderForm oldWidget) => true;


  /*
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    //throw UnimplementedError();
    return false;
    // true; //oldWidget
  }
  */
}
