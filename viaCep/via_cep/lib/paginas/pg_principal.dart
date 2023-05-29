import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:via_cep/util/componentes.dart';

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key});

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  TextEditingController cepController = TextEditingController();
  GlobalKey<FormState> formController = GlobalKey<FormState>();

  String rua = "Rua";
  String complemento = "Complemenmto";
  String bairro = "Bairro";
  String cidade = "Cidade";
  String estado = "Estado";

  limparTela() {
    setState(() {
      rua = "Rua";
      complemento = "Complemento";
      bairro = "Bairro";
      cidade = "Cidade";
      estado = "Estado";
      cepController.text = "";
      formController = GlobalKey<FormState>();
    });
  }

  buscaEndereco() async {
    String url = 'https://viacep.com.br/ws/${cepController.text}/json/';
    Response resposta = await get(Uri.parse(url));
    Map endereco = json.decode(resposta.body);
    setState(() {
      rua = "Rua: ${endereco['logradouro']}";
      complemento = "Complemento: ${endereco['complemento']}";
      bairro = "Bairro: ${endereco['bairro']}";
      cidade = "Cidade: ${endereco['localidade']}";
      estado = "Estado: ${endereco['uf']}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Componentes().criaAppBar('ViaCep', limparTela),
      body: Form(
        key: formController,
        child: Column(
          children: [
            const SizedBox(height: 20),
            Componentes().iconeGrande(),
            Componentes().criaInputTexto(
                TextInputType.number, 'CEP', cepController, 'Informe seu CEP'),
            Componentes()
                .criaBotao(formController, buscaEndereco, 'Buscar Endereço'),
            Componentes()
                .criaContainerDados(rua, complemento, bairro, cidade, estado),
          ],
        ),
      ),
    );
  }
}
