import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "dart:math";

import 'package:heartbeat/screens/components/custom_drawer.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _frases = ["A verdadeira amizade é como a saúde: o seu valor só é reconhecido quando a perdemos.",
    "O maior erro que um homem pode cometer é sacrificar a sua saúde a qualquer outra vantagem.",
    "A verdadeira felicidade é impossível sem verdadeirde é impossível sem um rigoroso controle da gula.",
    "Dificuldades e obstáculos são fontes valiosas de saúde e força para qualquer sociedade.",
    "Se alguém procura a saúde, pergunta-lhe primeiro s…doença; em caso contrário, abstém-te de o ajudar.",
    "O segredo da saúde mental e corporal está em não s…oblemas, mas viver sábia e seriamente o presente.",
    "O primeiro dos bens, depois da saúde, é a paz interior.",
    "O homem joga sua saúde fora para conseguir dinheiro; depois, usa o dinheiro para reconquistá-la.",
    "Não é sinal de saúde estar bem adaptado a uma sociedade doente.",
    "Aquele que não tem tempo para cuidar da saúde vai ter que arrumar tempo para cuidar da doença.",
    "Exercício: o seu melhor plano de saúde.", "A saúde e a alegria promovem-se uma à outra.",
    "A saúde do homem depende muito da saúde do planeta.",
    "Quem quiser ter saúde no corpo, procure tê-la na alma.",
    "Uma das formas de saúde é a doença. Um homem perfe…eria o ser mais anormal que se poderia encontrar.",
    "Ter saúde significa muito mais do que não apresentar nenhuma doença física.",
    "É mais importante a saúde do que o dinheiro. Uma p…um ricalhaço doente pode não ter posição na cama.",
    "A saúde é o estado no qual as funções necessárias se cumprem insensivelmente ou com prazer.",
    "A saúde depende mais das precauções que dos médicos.",
    "Nada mais perigoso para a saúde da mente humana que carregar pensamentos negativos.",
    "Os homens têm geralmente saúde quando não a sabem apreciar, e riqueza quando a não podem gozar.",
    "Temos que curar o mundo enquanto ainda nos restar saúde.",
    "O importante para um ser humano não é quantos anos de vida, e sim quantos anos de saúde.",
    "Seja feliz, saudável e que se dane o resto.", "A felicidade consiste em três pontos: trabalho, paz e saúde.",
    "Cultivar estados mentais positivos, como a generos…ente conduz a melhor saúde mental e a felicidade.",
    "A felicidade é como a saúde: se não sentes a falta dela, significa que ela existe.",
    "Quem ama preserva. Preservar a saúde é preservar a vida.",
    "Cuide do seu corpo e da sua mente. A saúde é o que nos faz permanecer em pé.",
    "A única maneira de conservar a saúde é comer o que…gosta e fazer aquilo que se preferiria não fazer.",
    "Qualquer amor já é um pouquinho de saúde, um descanso na loucura.",
    "Quando a alma está feliz, a prosperidade cresce, a…cê! O mundo exterior reflete o universo interior.",
    "Felicidade é nada mais que boa saúde e memória ruim.", "Tu não compras nem a alegria, nem a saúde, nem o amor verdadeiro.",
    "Para a saúde da mente e do corpo, os homens deveri… seus próprios braços, sem artefatos ou máquinas.",
    "A saúde e o prazer são para o homem o que o sol e o ar são para as plantas.",
    "Saúde e paz. O resto, a gente corre atrás.", "A vida trabalha para a nossa harmonia. Ninguém pod…, largar o passado e perdoar a ignorância alheia.",
    "A saúde é o resultado não só de nossos atos como também de nossos pensamentos.", "Resolvi ser feliz porque é melhor para a saúde!"];

  final random = new Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Color(0xffbf4747),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FaIcon(FontAwesomeIcons.bookMedical,size: 30,)
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child:
                  Text(_frases[random.nextInt(_frases.length)],
                    textAlign: TextAlign.center,
                    style: TextStyle(),),
                )
              ],
            )
          ],
        )
    );
  }
}
