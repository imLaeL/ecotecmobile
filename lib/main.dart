import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

void main() {
  runApp(const EcoTecApp());
}

class EcoTecApp extends StatelessWidget {
  const EcoTecApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoTec',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  final String intro =
      "O saneamento básico é um direito fundamental, mas ainda distante da realidade de milhões de pessoas. A ausência de infraestrutura adequada de abastecimento de água e esgoto causa graves impactos sociais, econômicos e ambientais. A Tecnologia da Informação (TI) surge como uma aliada essencial para aprimorar a gestão, o monitoramento e a eficiência dos serviços de saneamento.";

  final List<String> challenges = [
    "Infraestrutura deficiente.",
    "Falta de monitoramento em tempo real.",
    "Desigualdade na cobertura de serviços.",
    "Escassez de financiamento e investimentos.",
    "Tratamento inadequado de esgoto.",
  ];

  final List<_CardItem> howTiHelps = [
    _CardItem(
        "IA e Análise de Dados",
        "Processam grandes volumes de informações para prever falhas em equipamentos, identificar vazamentos e planejar ações preventivas.",
        Bootstrap.cpu),
    _CardItem(
        "Automação",
        "Permitem o controle inteligente das estações de tratamento e da rede, possibilitando operações mais eficientes e sustentáveis.",
        Bootstrap.gear),
    _CardItem(
        "IoT (sensores)",
        "Coletam informações vitais da rede, como pressão, vazão e qualidade da água em tempo real.",
        Bootstrap.signal),
    _CardItem(
        "Aplicativos",
        "Criam canal para engajar a população, permitindo reportes com fotos e localização.",
        Bootstrap.phone),
  ];

  final List<String> benefits = [
    "Monitoramento da Qualidade da Água",
    "Aplicativos de Denúncia e Conscientização",
    "Análise de Dados para Prevenção de Doenças",
    "Gestão Inteligente de Recursos Hídricos",
    "Integração de Dados em Nuvem",
    "Segurança da Informação na Saúde Pública",
  ];

  final List<String> team = [
    "Isaque Lael",
    "Eduardo Honório",
    "João Estevam",
    "Guilherme Lopes",
    "Alan Kristofer"
  ];

  void _scrollToPosition(double pos) {
    _scrollController.animateTo(
      pos,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _jumpToSection(String key) {
    switch (key) {
      case 'inicio':
        _scrollToPosition(0);
        break;
      case 'desafios':
        _scrollToPosition(420);
        break;
      case 'como':
        _scrollToPosition(880);
        break;
      case 'beneficios':
        _scrollToPosition(1400);
        break;
      case 'equipe':
        _scrollToPosition(2000);
        break;
      case 'contato':
        _scrollToPosition(2600);
        break;
      default:
        _scrollToPosition(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width >= 600;
    return Scaffold(
      appBar: AppBar(
        title: const Text('EcoTec'),
        backgroundColor: const Color(0x212529),
        actions: [
          IconButton(
              tooltip: 'Início',
              onPressed: () => _jumpToSection('inicio'),
              icon: const Icon(Bootstrap.house)),
          IconButton(
              tooltip: 'Desafios',
              onPressed: () => _jumpToSection('desafios'),
              icon: const Icon(Bootstrap.exclamation_triangle)),
          IconButton(
              tooltip: 'Benefícios',
              onPressed: () => _jumpToSection('beneficios'),
              icon: const Icon(Bootstrap.hand_thumbs_up)),
          IconButton(
              tooltip: 'Equipe',
              onPressed: () => _jumpToSection('equipe'),
              icon: const Icon(Bootstrap.people)),
          const SizedBox(width: 8),
        ],
      ),
      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: [
              const ListTile(
                title: Text('Navegação'),
                leading: Icon(Icons.menu),
              ),
              ListTile(
                leading: const Icon(Bootstrap.house),
                title: const Text('Início'),
                onTap: () {
                  Navigator.pop(context);
                  _jumpToSection('inicio');
                },
              ),
              ListTile(
                leading: const Icon(Bootstrap.exclamation_triangle),
                title: const Text('Desafios'),
                onTap: () {
                  Navigator.pop(context);
                  _jumpToSection('desafios');
                },
              ),
              ListTile(
                leading: const Icon(Bootstrap.gear),
                title: const Text('Como a TI ajuda'),
                onTap: () {
                  Navigator.pop(context);
                  _jumpToSection('como');
                },
              ),
              ListTile(
                leading: const Icon(Bootstrap.hand_thumbs_up),
                title: const Text('Benefícios'),
                onTap: () {
                  Navigator.pop(context);
                  _jumpToSection('beneficios');
                },
              ),
              ListTile(
                leading: const Icon(Bootstrap.people),
                title: const Text('Equipe'),
                onTap: () {
                  Navigator.pop(context);
                  _jumpToSection('equipe');
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Bootstrap.envelope),
                title: const Text('Contato'),
                onTap: () {
                  Navigator.pop(context);
                  _jumpToSection('contato');
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ConstrainedBox(
                  constraints:
                      BoxConstraints(maxWidth: isWide ? 800 : double.infinity),
                  child: Column(
                    children: [
                      const SizedBox(height: 8),
                      Text(
                        'Transformando o saneamento básico através da tecnologia',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Inovação, sustentabilidade e inclusão social para um futuro melhor',
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton.icon(
                          onPressed: () => _jumpToSection('desafios'),
                          label: const Text('Leia mais'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF28AA00),
                            foregroundColor: Colors.white,
                          )),
                      const SizedBox(height: 18),
                      Container(
                        width: double.infinity,
                        height: 180,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            'assets/images/image1.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 22),
              SectionTitle(title: 'Introdução'),
              Card(
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child:
                      Text(intro, style: Theme.of(context).textTheme.bodyLarge),
                ),
              ),
              const SizedBox(height: 18),
              SectionTitle(title: 'Desafios do saneamento básico'),
              Card(
                color: const Color(0xFF28AA00),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: challenges
                        .map((c) => ListTile(
                              leading: const Icon(Icons.arrow_right,
                                  color: Colors.white),
                              title: Text(
                                c,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              SectionTitle(title: 'Como a TI pode ajudar ?'),
              const SizedBox(height: 8),
              Column(
                children: howTiHelps
                    .map((h) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: ListTile(
                            tileColor: Colors.grey[50],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            leading: CircleAvatar(
                              backgroundColor: const Color(0xFF28AA00),
                              child: Icon(
                                h.icon,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            title: Text(h.title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            subtitle: Text(h.subtitle),
                          ),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 18),
              SectionTitle(title: 'Benefícios da aplicação de TI'),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: benefits
                        .map((b) => ListTile(
                              leading: const Icon(Icons.check_circle_outline),
                              title: Text(b),
                              trailing: TextButton(
                                  onPressed: () {},
                                  child: const Text('Saiba Mais')),
                            ))
                        .toList(),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              SectionTitle(title: 'Desafios e limitações'),
              Card(
                color: const Color(0xFF28AA00), // fundo verde
                child: Padding(
                  padding: const EdgeInsets.all(16.0), // padding maior
                  child: Text(
                    'Apesar das vantagens, a aplicação da TI enfrenta barreiras, como alto custo inicial, necessidade de infraestrutura digital, capacitação técnica e integração com redes antigas.',
                    style: TextStyle(
                      color: Colors.white, // cor da fonte branca
                      height: 1.6, // espaçamento entre linhas maior
                      fontSize: 16, // opcional: deixa o texto mais legível
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              SectionTitle(title: 'Time'),
              const SizedBox(height: 8),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: team.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isWide ? 3 : 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 3.5,
                ),
                itemBuilder: (context, index) {
                  final name = team[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 4.0), // espaço entre cards
                    child: Row(
                      children: [
                        ClipOval(
                          child: Image.asset(
                            'assets/images/user${index + 1}.jpeg', // coloque as imagens na pasta assets/images
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 18),
              SectionTitle(title: 'Contato'),
              const SizedBox(height: 12),
              Center(
                child: Wrap(
                  spacing: 40, // espaço horizontal entre os itens
                  runSpacing: 12, // espaço vertical entre linhas
                  alignment: WrapAlignment.center,
                  children: const [
                    Text('contato@ecotec.com.br'),
                    Text('www.ecotec.com.br'),
                    Text('João Pessoa, Brasil'),
                    Text('+55 83 99999-9999'),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: Text(
                    '© Copyright EcoTec 2025. Todos os direitos reservados.',
                    style: Theme.of(context).textTheme.bodySmall),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Topo',
        onPressed: () => _scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOut,
        ),
        backgroundColor: const Color(0xFF28AA00), // cor de fundo verde
        foregroundColor: Colors.white, // cor do ícone
        child: const Icon(Icons.arrow_upward),
      ),
    );
  }
}

class _CardItem {
  final String title;
  final String subtitle;
  final IconData icon;
  _CardItem(this.title, this.subtitle, this.icon);
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6.0, bottom: 8),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
