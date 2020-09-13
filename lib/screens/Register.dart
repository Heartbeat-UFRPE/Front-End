import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _checkedtermos = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [
                  0.1,
                  0.9
                ],
                colors: [
                  //F94F4F
                  Colors.white,
                  Colors.redAccent,
                ])),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top:70,bottom: 30),
                      child: Image.asset("assets/heart.png",
                          width: 160,
                          height: 160,
                          fit: BoxFit.contain),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: Form(
                        child: Column(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.white70,
                                          width: 0.5
                                      )
                                  )
                              ),
                              child: TextFormField(
                                obscureText: true,
                                style: TextStyle(
                                    color: Colors.white70
                                ),
                                decoration: InputDecoration(
                                    icon: Icon(Icons.navigation,color: Colors.white70,),
                                    border: InputBorder.none,
                                    hintText: "Nome",
                                    hintStyle: TextStyle(color: Colors.white70,fontSize: 15),
                                    contentPadding: EdgeInsets.only(
                                        top: 30,
                                        bottom: 30,
                                        right: 30,
                                        left: 5
                                    )
                                ),
                              ),
                            ),

                            Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.white70,
                                          width: 0.5
                                      )
                                  )
                              ),
                              child: TextFormField(
                                obscureText: false,
                                style: TextStyle(
                                    color: Colors.white70
                                ),
                                decoration: InputDecoration(
                                    icon: Icon(Icons.email,color: Colors.white70,),
                                    border: InputBorder.none,
                                    hintText: "Email",
                                    hintStyle: TextStyle(color: Colors.white70,fontSize: 15),
                                    contentPadding: EdgeInsets.only(
                                        top: 30,
                                        bottom: 30,
                                        right: 30,
                                        left: 5
                                    )
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.white70,
                                          width: 0.5
                                      )
                                  )
                              ),
                              child: TextFormField(
                                obscureText: true,
                                style: TextStyle(
                                    color: Colors.white70
                                ),
                                decoration: InputDecoration(
                                    icon: Icon(Icons.lock,color: Colors.white70,),
                                    border: InputBorder.none,
                                    hintText: "Senha",
                                    hintStyle: TextStyle(color: Colors.white70,fontSize: 15),
                                    contentPadding: EdgeInsets.only(
                                        top: 30,
                                        bottom: 30,
                                        right: 30,
                                        left: 5
                                    )
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.white70,
                                          width: 0.5
                                      )
                                  )
                              ),
                              child: TextFormField(
                                obscureText: true,
                                style: TextStyle(
                                    color: Colors.white70
                                ),
                                decoration: InputDecoration(
                                    icon: Icon(Icons.lock,color: Colors.white70,),
                                    border: InputBorder.none,
                                    hintText: "Repetir Senha",
                                    hintStyle: TextStyle(color: Colors.white70,fontSize: 15),
                                    contentPadding: EdgeInsets.only(
                                        top: 30,
                                        bottom: 30,
                                        right: 30,
                                        left: 5
                                    )
                                ),
                              ),
                            ),
                            Container (
                              child: CheckboxListTile(
                                title: Text(
                                  "Concordo com o termo de usos do app",
                                   ),
                                value: _checkedtermos,
                                onChanged: (newValue) {
                                  setState(() {
                                    _checkedtermos = true;
                                  });
                                },
                                checkColor: Colors.red,
                                controlAffinity: ListTileControlAffinity.leading,
                              )
                            ),
                            Container(
                              margin: EdgeInsets.all(20.0),
                              height: 70,
                              width: 250,
                              child: RaisedButton(
                                  child: const Text("Registrar-se", textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
                                  onPressed: () {},
                                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                                  textColor: Colors.red,
                                  color: Colors.white,
                              ),
                            ),
                            GestureDetector(
                                child :Container(
                                    child: Text(
                                      "Termos de Uso do app",
                                      style: TextStyle(color: Colors.blue, fontSize: 19),
                                    ),
                            ),
                              onTap: (){showAlertDialogtermos(context);},
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

}
showAlertDialogtermos(BuildContext context) {
  Widget naoButton = FlatButton(
    child: Text("ok"),
    onPressed:  () {Navigator.of(context).pop();},
  );
  AlertDialog alert = AlertDialog(
    title: Text('Termos de Uso', textScaleFactor: 2),
    content: Container(
      height: 400,
      width: 300,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),


            Text(
              """TERMOS DE SERVIÇO
    ----
        VISÃO GERAL
        Esse app é operado pelo Heartbeat. Em todo o app, os termos “nós”, “nos” e “nosso” se referem ao Heartbeat. O Heartbeat proporciona esse app, incluindo todas as informações, ferramentas e serviços disponíveis deste app para você, o usuário, com a condição da sua aceitação de todos os termos, condições, políticas e avisos declarados aqui.
        Ao visitar nosso app e/ou usor alguma coisa no nosso app, você está utilizando nossos “Serviços”. Consequentemente, você  concorda com os seguintes termos e condições (“Termos de serviço”, “Termos”), incluindo os termos e condições e políticas adicionais mencionados neste documento e/ou disponíveis por hyperlink. Esses Termos de serviço se aplicam a todos os usuários do app, incluindo, sem limitação, os usuários que são navegadores, fornecedores, clientes, lojistas e/ou contribuidores de conteúdo.
 ,
 SEÇÃO 1 - TERMOS DA AMBIENTE VIRTUAL
 
Ao concordar com os Termos de serviço, você confirma que você é maior de idade em seu estado ou província de residência e que você nos deu seu consentimento para permitir que qualquer um dos seus dependentes menores de idade usem esse app.
Você não deve usar nossos produtos para qualquer fim ilegal ou não autorizado. Você também não pode, ao usufruir deste Serviço, violar quaisquer leis em sua jurisdição (incluindo, mas não limitado, a leis de direitos autorais).
Você não deve transmitir nenhum vírus ou qualquer código de natureza destrutiva

SEÇÃO 2 - CONDIÇÕES GERAIS

Reservamos o direito de recusar o serviço a qualquer pessoa por qualquer motivo a qualquer momento.
Você concorda em não reproduzir, duplicar, copiar, vender, revender ou explorar qualquer parte do Serviço, uso do Serviço, acesso ao Serviço, ou qualquer contato no app através do qual o serviço é fornecido, sem nossa permissão expressa por escrito.
Os títulos usados nesse acordo são incluídos apenas por conveniência e não limitam ou  afetam os Termos.

SEÇÃO 3 - PRECISÃO, INTEGRIDADE E ATUALIZAÇÃO DAS INFORMAÇÕES

Não somos responsáveis por informações disponibilizadas nesse app que não sejam precisas, completas ou atuais. O material desse app é fornecido apenas para fins informativos e não deve ser usado como a única base para tomar decisões sem consultar fontes de informações primárias, mais precisas, mais completas ou mais atuais. Qualquer utilização do material desse app é por sua conta e risco.
Esse app pode conter certas informações históricas. As informações históricas podem não ser atuais e são fornecidas apenas para sua referência. Reservamos o direito de modificar o conteúdo desse app a qualquer momento, mas nós não temos obrigação de atualizar nenhuma informação em nosso app. Você concorda que é de sua responsabilidade monitorar alterações no nosso app.

SEÇÃO 4 - FERRAMENTAS OPCIONAIS

Podemos te dar acesso a ferramentas de terceiros que não monitoramos e nem temos qualquer controle.
Você reconhece e concorda que nós fornecemos acesso a tais ferramentas ”como elas são” e “conforme a disponibilidade” sem quaisquer garantias, representações ou condições de qualquer tipo e sem qualquer endosso. Não nos responsabilizamos de forma alguma pelo seu uso de ferramentas opcionais de terceiros.
Qualquer uso de ferramentas opcionais oferecidas através do app é inteiramente por sua conta e risco e você se familiarizar e aprovar os termos das ferramentas que são fornecidas por fornecedor(es) terceiro(s).
Também podemos, futuramente, oferecer novos serviços e/ou recursos através do app (incluindo o lançamento de novas ferramentas e recursos). Tais recursos e/ou serviços novos também devem estar sujeitos a esses Termos de serviço.

SEÇÃO 5- LINKS DE TERCEIROS

Certos produtos, conteúdos e serviços disponíveis pelo nosso Serviço podem incluir materiais de terceiros.
Os links de terceiros nesse app podem te direcionar para apps de terceiros que não são afiliados a nós. Não nos responsabilizamos por examinar ou avaliar o conteúdo ou precisão. Não garantimos e nem temos obrigação ou responsabilidade por quaisquer materiais ou apps de terceiros, ou por quaisquer outros materiais, produtos ou serviços de terceiros.
Não somos responsáveis por quaisquer danos ou prejuízos relacionados com a uso ou uso de mercadorias, serviços, recursos, conteúdo, ou quaisquer outras transações feitas em conexão com quaisquer apps de terceiros. Por favor, revise com cuidado as políticas e práticas de terceiros e certifique-se que você as entende antes de efetuar qualquer transação. As queixas, reclamações, preocupações ou questões relativas a produtos de terceiros devem ser direcionadas ao terceiro.

SEÇÃO6 - INFORMAÇÕES PESSOAIS

O envio de suas informações pessoais através da ambiente é regido pela nossa Política de privacidade. 
exclusão ou a limitação de responsabilidade por danos consequentes ou incidentais, em tais estados ou jurisdições, a nossa responsabilidade será limitada à extensão máxima permitida por lei.

SEÇÃO 7 - INDEPENDÊNCIA

No caso de qualquer disposição destes Termos de serviço ser considerada ilegal, nula ou ineficaz, tal disposição deve, contudo, ser aplicável até ao limite máximo permitido pela lei aplicável, e a porção inexequível será considerada separada desses Termos de serviço. Tal determinação não prejudica a validade e aplicabilidade de quaisquer outras disposições restantes.

SEÇÃO 8 - SERVIÇOS

Caso não exerçamos ou executemos qualquer direito ou disposição destes Termos de serviço, isso não constituirá uma renúncia de tal direito ou disposição.
Estes Termos de serviço e quaisquer políticas ou normas operacionais postadas por nós neste app ou no que diz respeito ao serviço constituem a totalidade do acordo  entre nós. Estes termos regem o seu uso do Serviço, substituindo quaisquer acordos anteriores ou contemporâneos, comunicações e propostas, sejam verbais ou escritos, entre você e nós (incluindo, mas não limitado a quaisquer versões anteriores dos Termos de serviço).
Quaisquer ambiguidades na interpretação destes Termos de serviço não devem ser interpretadas contra a parte que os redigiu.
"""
            ),

          ],
        ),
      ),
    ),
    actions: [
      naoButton,
    ],
    elevation: 24.0,
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}