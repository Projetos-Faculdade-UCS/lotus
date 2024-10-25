<p align="center">
  <a href="" rel="noopener">
 <img width=200px src="https://storage.googleapis.com/cms-storage-bucket/4cdf1c5482cd30174cfe.png"
  alt="Flutter logo"></a>
</p>

<h3 align="center">Project Lotus</h3>

<div align="center">

[![Status](https://img.shields.io/badge/status-active-success.svg)]()
[![GitHub Issues](https://img.shields.io/github/issues/mrhaubrich/lotus.svg)](https://github.com/mrhaubrich/lotus/issues)
[![GitHub Pull Requests](https://img.shields.io/github/issues-pr/mrhaubrich/lotus.svg)](https://github.com/mrhaubrich/lotus/pulls)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](/LICENSE)

</div>

---

<p align="center"> Template for a Desktop application using Flutter.
    <br> 
</p>

## 📝 Table of Contents

- [📝 Table of Contents](#-table-of-contents)
- [🧐 About ](#-about-)
- [🎈 Usage ](#-usage-)
- [⛏️ Built Using ](#️-built-using-)
- [✍️ Authors ](#️-authors-)
- [📝 TODO ][todoReference]

## 🧐 About <a name = "about"></a>

This is a template for a Desktop application using Flutter. It's a simple project that uses Flutter Modular and SidebarX to create a sidebar and nested routes. It's a good starting point for a desktop application.

## 🎈 Usage <a name="usage"></a>

Because we use `super_context_menu`, you need to have [Rust](https://rustup.rs/) installed:

For macOS or Linux, execute the following command in Terminal:
```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

In case you have Rust already installed, make sure to update it to latest version:
```bash
rustup update
```

To use this template, you can clone this repository and run the following commands:

```bash
flutter pub get
flutter run
```

## ⛏️ Built Using <a name = "built_using"></a>

- [Flutter](https://flutter.dev/) - Framework
- [Dart](https://dart.dev/) - Language
- [Flutter Modular](https://pub.dev/packages/flutter_modular) - Routing and Dependency Injection
- [SidebarX](https://pub.dev/packages/sidebar) - Sidebar (I'm using a personal fork of this package)
- [Super Context Menu](https://pub.dev/packages/super_context_menu) - Context Menu

## ✍️ Authors <a name = "authors"></a>

- [@mrhaubrich](https://github.com/mrhaubrich) - Idea & Initial work

See also the list of [contributors](https://github.com/mrhaubrich/lotus/contributors) who participated in this project.

[todoReference]: TODO.md


## Build de Models

Os models deste sistema estão no package repository e eles se utilizam de
json annotations. Para criar um model com sucesso é necessário buildar o package.
Dentro do package rode o comando:

```shell
dart run build_runner build
```