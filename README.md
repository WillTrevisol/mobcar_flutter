# MOBCAR

Aplicativo para cadastro de veículos, contendo marca, modelo, ano e valor fipe.
API utilizada https://github.com/deividfortuna/fipe

## Preview

<p align="center">
<img src="assets/readme_files/screen.gif" width="300"> <br>
</p>

## :gear: Como utilizar

**Step 1:**

Clone o repositório utilizando o comando abaixo:

```
git clone https://github.com/WillTrevisol/mobcar_flutter.git
```

**Step 2:**

Vá para a raiz do projeto e execute os comandos abaixo: 

```
flutter pub get
flutter run
```

## :package: Pacotes e Ferramentas

* [http](https://github.com/dart-lang/http/tree/master/pkgs/http)
* [font_awesome_flutter](https://github.com/fluttercommunity/font_awesome_flutter)
* [equatable](https://github.com/felangel/equatable)
* [get](https://github.com/jonataslaw/getx)
* [provider](https://github.com/rrousselGit/provider)
* [dropdown_search](https://github.com/salim-lachdhaf/searchable_dropdown)
* [get_storage](https://github.com/jonataslaw/get_storage)
* [google_fonts](https://github.com/material-foundation/flutter-packages/tree/main/packages/google_fonts)
* [flutter_lints](https://github.com/flutter/packages/tree/main/packages/flutter_lints)
* [mocktail](https://github.com/felangel/mocktail)
* [faker](https://github.com/drager/faker)

### :card_index_dividers: Estrutura de pastas

Estrutura de pastas utilizada no projeto.

```
lib/
|- data/ -> Contém todas as busca de informações locais e remotas do projeto.
|- domain/ -> — Contém toda a regra de negócio da aplicação.
|- infra/ -> — Contém a infraestrutura da aplicação.
|- main/ -> - Contém o ponto inicial da aplicação `main.dart`, também possui todos os factories do projeto.
|- presentation/ -> - Contém as streams para o gerenciamento de estado da aplicação.
|- ui/ -> — Contém toda a UI para o projeto.
```
