import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'pt'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? ptText = '',
  }) =>
      [enText, ptText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // auth_Login
  {
    '3p97u62u': {
      'en': 'Welcome Back!',
      'pt': 'Bem vindo de volta!',
    },
    'xkz4xjo6': {
      'en': 'Use the form below to access your account.',
      'pt': 'Utilize o formulário abaixo para acessar sua conta.',
    },
    'k9u5spqi': {
      'en': 'Email Address',
      'pt': 'Endereço de email',
    },
    'f4xxyrqv': {
      'en': 'Enter your email here...',
      'pt': 'Digite seu email aqui...',
    },
    'lfzvgi5q': {
      'en': 'Password',
      'pt': 'Senha',
    },
    'wt8sx5du': {
      'en': 'Enter your password here...',
      'pt': 'Digite sua senha aqui...',
    },
    's8bicxzh': {
      'en': 'Forgot Password?',
      'pt': 'Esqueceu sua senha?',
    },
    'm9klj9ah': {
      'en': 'Login',
      'pt': 'Conecte-se',
    },
    'zy328lg7': {
      'en': 'Use a social platform to continue',
      'pt': 'Use uma plataforma social para continuar',
    },
    'tcu0c8bu': {
      'en': 'Don\'t have an account?',
      'pt': 'Não tem uma conta?',
    },
    'kk2rdqi2': {
      'en': 'Create Account',
      'pt': 'Criar uma conta',
    },
    'kfm1khsu': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório',
    },
    'p7rdh4r8': {
      'en': 'Please choose an option from the dropdown',
      'pt': 'Escolha uma opção no menu suspenso',
    },
    'ud7wd8di': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório',
    },
    'bwbzfuju': {
      'en': 'Please choose an option from the dropdown',
      'pt': 'Escolha uma opção no menu suspenso',
    },
    'iha5socs': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // forgotPassword
  {
    '3hcuc8v6': {
      'en': 'Forgot Password',
      'pt': 'Esqueceu sua senha',
    },
    'sjjd1jb9': {
      'en':
          'Don\'t remember your password? Enter the email associated with your account below and we will send you a new link.',
      'pt':
          'Não lembra da sua senha? Digite o e-mail associado à sua conta abaixo e enviaremos um novo link.',
    },
    'tzm5opaa': {
      'en': 'Email Address',
      'pt': 'Endereço de email',
    },
    'uvsotzng': {
      'en': 'Please enter a valid email...',
      'pt': 'Por favor digite um email válido...',
    },
    '3sdzjivm': {
      'en': 'Send Reset Link',
      'pt': 'Enviar link de redefinição',
    },
    '8p6xd6cl': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // auth_Create
  {
    'l2xxy1gf': {
      'en': 'Get Started',
      'pt': 'Iniciar',
    },
    '59g0bt96': {
      'en': 'Use the form below to get started.',
      'pt': 'Use o formulário abaixo para começar.',
    },
    'seheok8a': {
      'en': 'Email Address',
      'pt': 'Endereço de email',
    },
    '0uknk55c': {
      'en': 'Enter your email here...',
      'pt': 'Digite seu email aqui...',
    },
    'wwxuev1r': {
      'en': 'Password',
      'pt': 'Senha',
    },
    'eextb60x': {
      'en': 'Create your password...',
      'pt': 'Crie sua senha...',
    },
    'kx2trk1o': {
      'en': 'Confirm Password',
      'pt': 'Confirme sua senha',
    },
    'k8c3y3u7': {
      'en': 'Create your password...',
      'pt': 'Crie sua senha...',
    },
    '29ut49wi': {
      'en': 'Create Account',
      'pt': 'Criar uma conta',
    },
    '07gxzzhq': {
      'en': 'Use a social platform to continue',
      'pt': 'Use uma plataforma social para continuar',
    },
    'ysqhbhpe': {
      'en': 'Already have an account?',
      'pt': 'já tem uma conta?',
    },
    'ud92zl8z': {
      'en': 'Log In',
      'pt': 'Conecte-se',
    },
    'zuuuklky': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // Main_Home
  {
    '3bi54x5g': {
      'en': 'Home',
      'pt': 'Lar',
    },
    'tbv3eies': {
      'en': 'Start Travel',
      'pt': 'Iniciar viagem',
    },
    't39kaccg': {
      'en': 'Next Travel',
      'pt': 'Próxima viagem',
    },
    'y24lcr13': {
      'en': 'Dashboard',
      'pt': 'Painel',
    },
    'xdxbdj20': {
      'en': '__',
      'pt': '__',
    },
  },
  // Main_customerList
  {
    'n99lg1qh': {
      'en': 'Travels Request',
      'pt': 'Solicitação de viagens',
    },
    'auj104ss': {
      'en': 'Account Manager',
      'pt': 'Gerente de contas',
    },
    'auu81fj9': {
      'en': 'ACME Co.',
      'pt': 'ACME Co.',
    },
    'k2az1zb3': {
      'en': 'ACME Co.',
      'pt': 'ACME Co.',
    },
    'fcyoodds': {
      'en': 'Customers',
      'pt': 'Clientes',
    },
    '3ourv2w9': {
      'en': '__',
      'pt': '__',
    },
  },
  // Main_Travels
  {
    '4h88trkp': {
      'en': 'Contracts',
      'pt': 'Contratos',
    },
    'smh1o93d': {
      'en': 'Travels',
      'pt': 'Viagens',
    },
    't967eizl': {
      'en': 'Future',
      'pt': 'Futuro',
    },
    'j08eiorc': {
      'en': '__',
      'pt': '__',
    },
  },
  // Main_messages
  {
    '8jlklje5': {
      'en': 'Messages',
      'pt': 'Mensagens',
    },
    '13b6p0ri': {
      'en': 'Search messages here...',
      'pt': 'Pesquise mensagens aqui...',
    },
    'ji93kcxu': {
      'en': 'Me:',
      'pt': 'Meu:',
    },
    'r0cqh4ec': {
      'en':
          'I am a freelancer and I need help writing content for a proposal for a project. Can I give you some context for the projecct I need to write a proposal for?',
      'pt':
          'Sou freelancer e preciso de ajuda para escrever conteúdo para uma proposta de projeto. Posso fornecer algum contexto para o projeto para o qual preciso escrever uma proposta?',
    },
    'cu0iov54': {
      'en': 'Just Now',
      'pt': 'Agora mesmo',
    },
    'it69akbs': {
      'en': 'Hey really love what you are doing!',
      'pt': 'Ei, realmente amo o que você está fazendo!',
    },
    'pu94epux': {
      'en': 'a few moments ago',
      'pt': 'alguns momentos atrás',
    },
    'yny0f2zl': {
      'en': 'This is my intro video',
      'pt': 'Este é meu vídeo de introdução',
    },
    'q2bmh3xq': {
      'en': 'Just Now',
      'pt': 'Agora mesmo',
    },
    '4lc34hro': {
      'en': 'Hey really love what you are doing!',
      'pt': 'Ei, realmente amo o que você está fazendo!',
    },
    'rv9g1zmc': {
      'en': 'Just Now',
      'pt': 'Agora mesmo',
    },
    'bbpyr9q4': {
      'en': 'Hey really love what you are doing!',
      'pt': 'Ei, realmente amo o que você está fazendo!',
    },
    'jkyrunx9': {
      'en': 'Just Now',
      'pt': 'Agora mesmo',
    },
    'p20c60zu': {
      'en': 'Start typing here...',
      'pt': 'Comece a digitar aqui...',
    },
    'ym579y79': {
      'en': 'Dashboard',
      'pt': 'Painel',
    },
    'smtxdnbn': {
      'en': '__',
      'pt': '__',
    },
  },
  // Main_profilePage
  {
    'qrxn5crt': {
      'en': 'My Profile',
      'pt': 'Meu perfil',
    },
    'fyxsf6vn': {
      'en': 'Account Settings',
      'pt': 'Configurações de Conta',
    },
    'h43llaan': {
      'en': 'Change Password',
      'pt': 'Alterar a senha',
    },
    'b1lw0hfu': {
      'en': 'Edit Profile',
      'pt': 'Editar Perfil',
    },
    'clf3bzn3': {
      'en': 'Update Theme',
      'pt': 'Atualizar tema',
    },
    'dujofvd2': {
      'en':
          'Update the theme of your application from seleccting one of the options below.',
      'pt':
          'Atualize o tema do seu aplicativo selecionando uma das opções abaixo.',
    },
    'zohqypc2': {
      'en': 'Dark Mode',
      'pt': 'Modo escuro',
    },
    't3a5lo8r': {
      'en': 'Light Mode',
      'pt': 'Modo claro',
    },
    'abqf147c': {
      'en': 'Log Out',
      'pt': 'Sair',
    },
    'o3dp9tss': {
      'en': '__',
      'pt': '__',
    },
  },
  // userDetails
  {
    '3j85rgus': {
      'en': 'Name',
      'pt': 'Nome',
    },
    'g3g8ygpp': {
      'en': 'Zone',
      'pt': 'Zona',
    },
    'c9ywf2if': {
      'en': 'Vehicle',
      'pt': 'Veículo',
    },
    '0snxvy2k': {
      'en': 'Brand',
      'pt': 'Marca',
    },
    '3vt2vbu7': {
      'en': 'Model',
      'pt': 'Modelo',
    },
    'lgwbwfi2': {
      'en': 'Plate',
      'pt': 'Placa',
    },
    '9t913b44': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // editProfile
  {
    'mk8nnw94': {
      'en': 'Change Photo',
      'pt': 'Mudar foto',
    },
    '4no7ue4a': {
      'en': 'Your Name',
      'pt': 'Seu nome',
    },
    '2rqce1pj': {
      'en': 'The email associated with this account is:',
      'pt': 'O e-mail associado a esta conta é:',
    },
    'kn82q4oc': {
      'en': 'Select Location',
      'pt': 'Selecione o local',
    },
    'rr8ksatz': {
      'en': 'Save Changes',
      'pt': 'Salvar alterações',
    },
    '20uycztj': {
      'en': 'Edit Profile',
      'pt': 'Editar Perfil',
    },
  },
  // searchPage
  {
    'ao46xsuv': {
      'en': 'Add Members',
      'pt': 'Adicionar membros',
    },
    'g8rv8zhr': {
      'en': 'Search members...',
      'pt': 'Pesquisar membros...',
    },
    'op7ngmsb': {
      'en': 'Option 1',
      'pt': 'Opção 1',
    },
    '5x8u4g0u': {
      'en': 'All Members',
      'pt': 'Todos os membros',
    },
    '4cek35uo': {
      'en': 'View',
      'pt': 'Visualizar',
    },
    'mvx2sb5k': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // messagesDetails
  {
    'buzhmfr6': {
      'en': 'Start typing here...',
      'pt': 'Comece a digitar aqui...',
    },
    'pjym5jdv': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // Create_travel
  {
    'k9rixcex': {
      'en': 'Create Your Travel',
      'pt': 'Crie sua viagem',
    },
    '7thpy0mn': {
      'en': 'Select Date',
      'pt': 'Selecione a data',
    },
    'v81qiwqx': {
      'en': 'Choose Travelers',
      'pt': 'Escolha viajantes',
    },
    'iprwyex9': {
      'en': 'Create Travel',
      'pt': 'Criar viagem',
    },
  },
  // Start
  {
    'tu8ddi0q': {
      'en': 'Welcome',
      'pt': 'Bem-vindo',
    },
    'c0e0o4kh': {
      'en': 'CarSharing',
      'pt': 'Compartilhamento de carro',
    },
    're96rdes': {
      'en': 'The Utad platform that will take you further',
      'pt': 'A plataforma Utad que o levará mais longe',
    },
    'rj6rx8nt': {
      'en':
          'Make your profile\nChoose where to pick you up\nDecide when you wan\'t to leave\nAnd just wait for it...',
      'pt':
          'Faça seu perfil\nEscolha onde buscá-lo\nDecida quando você não quer sair\nE espere por isso...',
    },
    'jh8hc52y': {
      'en':
          'You can be a driver too...\nCreate a Travel and add some users\nBecause of that you can be rewarded',
      'pt':
          'Você também pode ser motorista...\nCrie uma viagem e adicione alguns usuários\nPor causa disso você pode ser recompensado',
    },
    'agwgpscu': {
      'en':
          'The app will be managed by UTAD\nSo every user will be a student\nSo will need to give your email to be checked',
      'pt':
          'A aplicação será gerida pela UTAD\nEntão todo usuário será um estudante\nEntão será necessário fornecer seu e-mail para ser verificado',
    },
    'tphxyidm': {
      'en': 'Skip',
      'pt': 'Pular',
    },
    'inq2a2a2': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // Profile_Driver_Passenger
  {
    'riif880k': {
      'en': 'Your Name',
      'pt': 'Seu nome',
    },
    'gd4wvi7q': {
      'en': 'Your UTAD E-mail',
      'pt': 'O seu e-mail UTAD',
    },
    'z2ye8h97': {
      'en': 'Nossa',
      'pt': 'Nossa',
    },
    'm2unwmkq': {
      'en': 'Nossa',
      'pt': 'Nossa',
    },
    'y6ucxm6z': {
      'en': 'Residências',
      'pt': 'Residências',
    },
    '8wst40oi': {
      'en': 'Sinaleiro',
      'pt': 'Sinaleiro',
    },
    'dx1xes4l': {
      'en': 'Pio',
      'pt': 'Pio',
    },
    '57flybtw': {
      'en': 'Select Zone',
      'pt': 'Selecione Zona',
    },
    '53x1vto0': {
      'en': 'Select Location',
      'pt': 'Selecione o local',
    },
    'p9yh6daz': {
      'en': 'Passenger',
      'pt': 'Passageiro',
    },
    'dkp4oggt': {
      'en': 'Driver',
      'pt': 'Motorista',
    },
    '5nrnpgrn': {
      'en': 'Passenger',
      'pt': 'Passageiro',
    },
    '75gqljeg': {
      'en': 'Save Changes',
      'pt': 'Salvar alterações',
    },
  },
  // travelDetails
  {
    'fqn1yirg': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // Profile_Driver
  {
    'vady71qu': {
      'en': 'Drivers License',
      'pt': 'Carteira de motorista',
    },
    'pl13ezpp': {
      'en': 'Import your Drivers License Here\nCan be PNG, JPEG, JPG',
      'pt': 'Importe sua carteira de motorista aqui\nPode ser PNG, JPEG, JPG',
    },
    '1bpogn20': {
      'en': 'Brand',
      'pt': 'Marca',
    },
    'zoa1yaao': {
      'en': 'Model',
      'pt': 'Modelo',
    },
    'xif1omcy': {
      'en': 'Plate',
      'pt': 'Placa',
    },
    'xk0gh7wn': {
      'en': 'Vehicle Photo',
      'pt': 'Foto do veículo',
    },
    '06hj9svc': {
      'en': 'Import your Vehicle Document\nCan be PNG, JPEG, JPG',
      'pt': 'Importe o documento do seu veículo\nPode ser PNG, JPEG, JPG',
    },
    '27jii4ix': {
      'en': 'Save Changes',
      'pt': 'Salvar alterações',
    },
    '39el1lw6': {
      'en': 'Driver Info',
      'pt': 'Informações do motorista',
    },
  },
  // Create_Request
  {
    'gasgvuuc': {
      'en': 'Create Your Travel',
      'pt': 'Crie sua viagem',
    },
    '6z9qmugc': {
      'en': 'Create Travel',
      'pt': 'Criar viagem',
    },
  },
  // storetry
  {
    '9q9s4er6': {
      'en': 'Store',
      'pt': 'Loja',
    },
    'fb745vqy': {
      'en': 'Shop',
      'pt': 'Comprar',
    },
  },
  // modal_Message
  {
    'wa4vkne2': {
      'en': 'Congratulations!',
      'pt': 'Parabéns!',
    },
    '3hf2ocig': {
      'en':
          'Now that a contract has been generated for this customer please contact them with the date you will send the signed agreement.',
      'pt':
          'Agora que um contrato foi gerado para este cliente, entre em contato com ele informando a data em que enviará o contrato assinado.',
    },
    'q0jvi1lp': {
      'en': 'Okay',
      'pt': 'OK',
    },
    'oo4y13nf': {
      'en': 'Continue',
      'pt': 'Continuar',
    },
  },
  // modal_Welcome
  {
    '00flvi93': {
      'en': 'Congratulations!',
      'pt': 'Parabéns!',
    },
    'fmzceh74': {
      'en': 'Your Profile has been created, now you can travel with us',
      'pt': 'Seu perfil foi criado, agora você pode viajar conosco',
    },
    'g8q2u55w': {
      'en': 'Continue',
      'pt': 'Continuar',
    },
  },
  // createComment
  {
    'l2jlnhye': {
      'en': 'Create Note',
      'pt': 'Criar nota',
    },
    'd6yfe8tj': {
      'en': 'Find members by searching below',
      'pt': 'Encontre membros pesquisando abaixo',
    },
    'p3rj5ra0': {
      'en': 'Ricky Rodriguez',
      'pt': 'Ricky Rodriguez',
    },
    '9gf6o5ss': {
      'en': 'Enter your note here...',
      'pt': 'Digite sua nota aqui...',
    },
    'farrki57': {
      'en': 'Create Note',
      'pt': 'Criar nota',
    },
  },
  // mobileNav
  {
    'sy0pxvma': {
      'en': 'Dashboard',
      'pt': 'Painel',
    },
    't5c3aiuy': {
      'en': 'My Team',
      'pt': 'Meu time',
    },
    'nkz3c58a': {
      'en': 'Customers',
      'pt': 'Clientes',
    },
    '1mkyyjwj': {
      'en': 'Contracts',
      'pt': 'Contratos',
    },
    'eg79coc6': {
      'en': 'Profile',
      'pt': 'Perfil',
    },
  },
  // webNav
  {
    'xai8ocja': {
      'en': 'Search',
      'pt': 'Procurar',
    },
    'yg07zi4c': {
      'en': 'Dashboard',
      'pt': 'Painel',
    },
    'lbojdpxg': {
      'en': 'Customers',
      'pt': 'Clientes',
    },
    '9pjba90p': {
      'en': 'Contracts',
      'pt': 'Contratos',
    },
    '5s0d776i': {
      'en': 'Messages',
      'pt': 'Mensagens',
    },
    '01nu9cy0': {
      'en': 'Profile',
      'pt': 'Perfil',
    },
  },
  // commandPalette
  {
    'pw6kvl1f': {
      'en': 'Quick Links',
      'pt': 'Links Rápidos',
    },
    'zsq8vj02': {
      'en': 'Find Customer',
      'pt': 'Encontre o cliente',
    },
    'iqxwv326': {
      'en': 'New Travel',
      'pt': 'Nova viagem',
    },
  },
  // editProfilePhoto
  {
    '6bnefz1c': {
      'en': 'Change Photo',
      'pt': 'Mudar foto',
    },
    'yaxe7q8v': {
      'en':
          'Upload a new photo below in order to change your avatar seen by others.',
      'pt':
          'Carregue uma nova foto abaixo para alterar seu avatar visto por outras pessoas.',
    },
    're4x0sz7': {
      'en': 'Upload Image',
      'pt': 'Enviar Imagem',
    },
    'sr54fsk6': {
      'en': 'Save Changes',
      'pt': 'Salvar alterações',
    },
  },
  // travel_Detail
  {
    '918p9oc4': {
      'en': 'Driver',
      'pt': 'Motorista',
    },
    '57kpypjm': {
      'en': 'Date',
      'pt': 'Data',
    },
    '8pl44wxy': {
      'en': 'Vehicle',
      'pt': 'Veículo',
    },
    'ry5bhm51': {
      'en': 'Brand',
      'pt': 'Marca',
    },
    '7mudqbqj': {
      'en': 'Model',
      'pt': 'Modelo',
    },
    'rfwppr5v': {
      'en': 'Plate',
      'pt': 'Placa',
    },
  },
  // dropdown_UserEdit
  {
    'vqk7im3j': {
      'en': 'Options',
      'pt': 'Opções',
    },
    'dv4r7r4u': {
      'en': 'View Profile',
      'pt': 'Ver perfil',
    },
  },
  // projectDetails_alt
  {
    'zgyw4s95': {
      'en': 'ACME Co.',
      'pt': 'ACME Co.',
    },
    'izuvtgws': {
      'en': 'Contracts for New Opportunities',
      'pt': 'Contratos para Novas Oportunidades',
    },
    'gamp8n19': {
      'en': 'Assigned To',
      'pt': 'Atribuído a',
    },
    'obbewkqp': {
      'en': 'Randy Rudolph',
      'pt': 'Randy Rodolfo',
    },
    'ae8di6vv': {
      'en': 'name@domain.com',
      'pt': 'nome@domínio.com',
    },
    'x6aorxwd': {
      'en': 'Next Action',
      'pt': 'Próxima ação',
    },
    '8sktau69': {
      'en': 'Tuesday, 10:00am',
      'pt': 'Terça-feira, 10h00',
    },
    'ck1j2u5s': {
      'en': 'In Progress',
      'pt': 'Em andamento',
    },
    '3z7p2nt3': {
      'en': 'Activity',
      'pt': 'Atividade',
    },
    '4fs4d1ar': {
      'en': 'FlutterFlow CRM App:',
      'pt': 'Aplicativo FlutterFlow CRM:',
    },
    'n5ub587t': {
      'en': ' Begin Work',
      'pt': 'Comece o trabalho',
    },
    'y2yi7ro1': {
      'en': 'SOW Change Order',
      'pt': 'Pedido de alteração SOW',
    },
    'tyo3th3g': {
      'en': 'FlutterFlow CRM App',
      'pt': 'Aplicativo FlutterFlow CRM',
    },
    't1shbmsx': {
      'en': 'Jul 8, at 4:31pm',
      'pt': '8 de julho, às 16h31',
    },
    'fjdirac9': {
      'en': 'Jeremiah Goldsten ',
      'pt': 'Jeremias Goldsten',
    },
    'g9h5nanl': {
      'en': 'accepted a request',
      'pt': 'aceitou um pedido',
    },
    'ndvrf4a3': {
      'en': 'SOW Change Order',
      'pt': 'Pedido de alteração SOW',
    },
    'ruswj67g': {
      'en': 'FlutterFlow CRM App',
      'pt': 'Aplicativo FlutterFlow CRM',
    },
    'cgdoty6v': {
      'en':
          '\"Notifications and reminders informing users about upcoming classes and training schedules will be sent to them via email, SMS or notifications within the application.\"',
      'pt':
          '“Notificações e lembretes informando aos usuários sobre as próximas aulas e horários de treinamento serão enviados a eles por e-mail, SMS ou notificações dentro do aplicativo.”',
    },
    'z3xab243': {
      'en': 'Jul 8, at 4:30pm',
      'pt': '8 de julho, às 16h30',
    },
    'a19jraal': {
      'en': 'Randy Rudolph ',
      'pt': 'Randy Rodolfo',
    },
    'b3k94yjl': {
      'en': 'sent a SOW Change Order for ',
      'pt': 'enviou um pedido de alteração SOW para',
    },
    '9vhvqp6g': {
      'en': 'FlutterFlow CRM APP',
      'pt': 'APLICATIVO FlutterFlow CRM',
    },
    '7djk72um': {
      'en': 'SOW Change Order',
      'pt': 'Pedido de alteração SOW',
    },
    'qysyag2v': {
      'en': 'FlutterFlow CRM App',
      'pt': 'Aplicativo FlutterFlow CRM',
    },
    'ur5udrbc': {
      'en':
          '\"Please review the updates to this document and get back with me.\"',
      'pt':
          '\"Por favor, revise as atualizações deste documento e volte comigo.\"',
    },
    'm8scfp1r': {
      'en': 'Jul 8, at 2:20pm',
      'pt': '8 de julho, às 14h20',
    },
    'n251rti5': {
      'en': 'Contracts',
      'pt': 'Contratos',
    },
    'i8p8t5uw': {
      'en': 'Updates to Existing App',
      'pt': 'Atualizações para aplicativos existentes',
    },
    'ks3nu6ra': {
      'en':
          'Additional Details around this contract and who is working on it in this card!',
      'pt':
          'Detalhes adicionais sobre este contrato e quem está trabalhando nele neste cartão!',
    },
    'f3u7xqx4': {
      'en': 'Contract Details',
      'pt': 'Detalhes do contrato',
    },
    'r2ns8igs': {
      'en': '\$210,000',
      'pt': 'US\$ 210.000',
    },
    'y5zgyf1b': {
      'en': 'Mark as Complete',
      'pt': 'Marcar como concluído',
    },
    'va0zdk6p': {
      'en': 'New FlutterFlow App',
      'pt': 'Novo aplicativo FlutterFlow',
    },
    't24sfvud': {
      'en':
          'The user can browse through our extensive catalog of fitness classes by filtering based on class type, location, time, and instructor. Each class will have detailed descriptions of the program, instructors, timings, availability, and rates.',
      'pt':
          'O usuário pode navegar por nosso extenso catálogo de aulas de ginástica filtrando com base no tipo de aula, local, horário e instrutor. Cada aula terá descrições detalhadas do programa, instrutores, horários, disponibilidade e taxas.',
    },
    'nzh0mhza': {
      'en': 'Contract Details',
      'pt': 'Detalhes do contrato',
    },
    'dmcqhebq': {
      'en': '\$67,000',
      'pt': 'US\$ 67.000',
    },
    'it7y6ia8': {
      'en': 'Mark as Complete',
      'pt': 'Marcar como concluído',
    },
    'x8yfre0t': {
      'en': 'Project Details',
      'pt': 'Detalhes do Projeto',
    },
  },
  // users_Details
  {
    'h8b4zzcf': {
      'en': 'Name',
      'pt': 'Nome',
    },
    'edwdfot4': {
      'en': 'Zone',
      'pt': 'Zona',
    },
    'gw6c9avp': {
      'en': 'Vehicle',
      'pt': 'Veículo',
    },
    'krob2una': {
      'en': 'Brand',
      'pt': 'Marca',
    },
    'gcsn987h': {
      'en': 'Model',
      'pt': 'Modelo',
    },
    '37mu96b3': {
      'en': 'Plate',
      'pt': 'Placa',
    },
  },
  // Travels_Assign
  {
    '4nysye0r': {
      'en': 'Date & Time',
      'pt': 'Data hora',
    },
  },
  // modal_Welcome_Driver
  {
    '7p8l92j1': {
      'en': 'Congratulations!',
      'pt': 'Parabéns!',
    },
    'kf6z5a8y': {
      'en':
          'Your Profile as Driver was created\nNow you need to wait until the admin confirm your data\nWhile you\'re waiting you can enjoy the app as a Passenger',
      'pt':
          'Seu perfil como motorista foi criado\nAgora você precisa esperar até que o administrador confirme seus dados\nEnquanto espera, você pode aproveitar o aplicativo como passageiro',
    },
    'gl2cssty': {
      'en': 'Continue',
      'pt': 'Continuar',
    },
  },
  // dropdown_UserEditAdmin
  {
    '4pbk8fj1': {
      'en': 'Options',
      'pt': 'Opções',
    },
    '6eqvkv8y': {
      'en': 'View Profile',
      'pt': 'Ver perfil',
    },
    '1zzt0vqg': {
      'en': 'Assign to Travel',
      'pt': 'Atribuir para viajar',
    },
  },
  // notifications
  {
    '2r5q1rx1': {
      'en': ' invite you to is travel at',
      'pt': 'convidar você para viajar em',
    },
    'l7altptx': {
      'en': '\n',
      'pt': '',
    },
    'b2hryrer': {
      'en':
          'FlutterFlow is a visual development platform that allows you to easily create beautiful and responsive user interfaces for your mobile and web applications. ',
      'pt':
          'FlutterFlow é uma plataforma de desenvolvimento visual que permite criar facilmente interfaces de usuário bonitas e responsivas para seus aplicativos móveis e da web.',
    },
    'msevzmzi': {
      'en':
          'FlutterFlow is a visual development platform that allows you to easily create beautiful and responsive user interfaces for your mobile and web applications. ',
      'pt':
          'FlutterFlow é uma plataforma de desenvolvimento visual que permite criar facilmente interfaces de usuário bonitas e responsivas para seus aplicativos móveis e da web.',
    },
  },
  // Card43ProductDetails
  {
    'd5533278': {
      'en': 'Buy Now',
      'pt': 'Comprar agora',
    },
  },
  // listTravelToAdd
  {
    'e9zoq738': {
      'en': 'Your Travels',
      'pt': 'Suas viagens',
    },
    '9ql5uoag': {
      'en': 'Account Manager',
      'pt': 'Gerente de contas',
    },
    'shzviw8n': {
      'en': 'ACME Co.',
      'pt': 'ACME Co.',
    },
    'iyzotqy8': {
      'en': 'ACME Co.',
      'pt': 'ACME Co.',
    },
    'qrw09i5a': {
      'en': 'Add',
      'pt': 'Adicionar',
    },
  },
  // Miscellaneous
  {
    '0nwoj0kc': {
      'en': 'Email address',
      'pt': 'Endereço de email',
    },
    'upni203i': {
      'en': 'Password',
      'pt': 'Senha',
    },
    'x5hsigqw': {
      'en': 'Button',
      'pt': 'Botão',
    },
    '9wy77t9v': {
      'en': 'Button',
      'pt': 'Botão',
    },
    'woezzutp': {
      'en': 'Button',
      'pt': 'Botão',
    },
    '2bj20mi4': {
      'en': 'Button',
      'pt': 'Botão',
    },
    'oztjr3ws': {
      'en': 'Button',
      'pt': 'Botão',
    },
    'hc87g50d': {
      'en': 'Button',
      'pt': 'Botão',
    },
    '8ct6cr3a': {
      'en': 'Button',
      'pt': 'Botão',
    },
    'e368pegn': {
      'en': 'Button',
      'pt': 'Botão',
    },
    'yv65a6i5': {
      'en': 'Button',
      'pt': 'Botão',
    },
    '4r7kaahz': {
      'en': 'Calling',
      'pt': 'Chamando',
    },
    '9zk4wopm': {
      'en': 'Not Called',
      'pt': 'Não chamado',
    },
    'xn2fkope': {
      'en': 'Pending Review',
      'pt': 'Revisão pendente',
    },
    'jv85czds': {
      'en': 'Closed',
      'pt': 'Fechado',
    },
    'swt4x372': {
      'en': 'Completed',
      'pt': 'Concluído',
    },
    '5w6ne1dl': {
      'en': 'Please select...',
      'pt': 'Por favor selecione...',
    },
    'uhfmgei0': {
      'en': 'Search for an item...',
      'pt': 'Procure um item...',
    },
    'lted0txl': {
      'en': 'All',
      'pt': 'Todos',
    },
    'm6iqz668': {
      'en': 'Pending',
      'pt': 'Pendente',
    },
    'x2pvxk5r': {
      'en': 'Completed',
      'pt': 'Concluído',
    },
    'txjoh349': {
      'en': 'Calling',
      'pt': 'Chamando',
    },
    'qube3xir': {
      'en': 'All',
      'pt': 'Todos',
    },
    'mxalfkji': {
      'en': '50%',
      'pt': '50%',
    },
    'z6o24u9q': {
      'en': 'Notifications',
      'pt': 'Notificações',
    },
    'poegde7v': {
      'en': 'Notifications',
      'pt': 'Notificações',
    },
    'v3vjad01': {
      'en': 'Turn on notifications',
      'pt': 'Ative as notificações',
    },
    'bqjgqich': {
      'en': 'Male',
      'pt': 'Macho',
    },
    'rzl2h9ar': {
      'en': 'Female',
      'pt': 'Fêmea',
    },
    'qtchqf19': {
      'en': 'Other',
      'pt': 'Outro',
    },
    '82a75t5n': {
      'en': 'Design',
      'pt': 'Projeto',
    },
    'w82xuklg': {
      'en': 'Marketing',
      'pt': 'Marketing',
    },
    '5uiyxwtk': {
      'en': 'Development',
      'pt': 'Desenvolvimento',
    },
    '3wjkerx7': {
      'en': 'Management',
      'pt': 'Gerenciamento',
    },
    'p6rgfj1v': {
      'en': 'Operations',
      'pt': 'Operações',
    },
    'c8uww550': {
      'en': 'Customer Service',
      'pt': 'Atendimento ao Cliente',
    },
    '2rhm2suy': {
      'en': 'Design',
      'pt': 'Projeto',
    },
    'q7p4w3ov': {
      'en': 'Button',
      'pt': 'Botão',
    },
    '9zks6s9m': {
      'en': 'Button',
      'pt': 'Botão',
    },
    'br5k5sht': {
      'en': 'Button',
      'pt': 'Botão',
    },
    'hxsxj681': {
      'en': '',
      'pt': '',
    },
    'e7agr7ys': {
      'en': '',
      'pt': '',
    },
    'a4cygr2z': {
      'en': '',
      'pt': 'Nossa',
    },
    '65e2tfs2': {
      'en': '',
      'pt': '',
    },
    'ddazihx4': {
      'en': '',
      'pt': '',
    },
    'db03cpjj': {
      'en': '',
      'pt': '',
    },
    'fdb9078p': {
      'en': '',
      'pt': '',
    },
    '80ouzj9q': {
      'en': '',
      'pt': '',
    },
    '6rzhptp9': {
      'en': '',
      'pt': '',
    },
    'ce8c4ty0': {
      'en': '',
      'pt': '',
    },
    '9hp1umth': {
      'en': '',
      'pt': '',
    },
    'n4i6j04h': {
      'en': '',
      'pt': '',
    },
    '6497bl7w': {
      'en': '',
      'pt': '',
    },
    'p4g2tzgx': {
      'en': '',
      'pt': '',
    },
    'kcvqa08x': {
      'en': '',
      'pt': '',
    },
    'dqrzd6sq': {
      'en': '',
      'pt': '',
    },
    'dpqtohyf': {
      'en': '',
      'pt': '',
    },
    'v01vf71s': {
      'en': '',
      'pt': '',
    },
    'gcv6def1': {
      'en': '',
      'pt': '',
    },
    'um9es99m': {
      'en': '',
      'pt': '',
    },
    'o4enbz4j': {
      'en': '',
      'pt': '',
    },
    '8z4tvfh7': {
      'en': '',
      'pt': '',
    },
    '2ybzla8x': {
      'en': '',
      'pt': '',
    },
    'd1wdf5i1': {
      'en': '',
      'pt': '',
    },
    'f4rdu9en': {
      'en': '',
      'pt': '',
    },
    '2py80kgi': {
      'en': '',
      'pt': '',
    },
    'p6lsrh2a': {
      'en': '',
      'pt': '',
    },
    'ne8cclp9': {
      'en': '',
      'pt': '',
    },
  },
].reduce((a, b) => a..addAll(b));
