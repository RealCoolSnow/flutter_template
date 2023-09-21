# Flutter Template

A new Flutter project.

# 结构
`

    |-- gen.sh # 脚本: 生成model、多语言、资源
    |-- lib
    |   |-- main_dev.dart
    |   |-- main_prod.dart
    |   |-- app # 应用代码
    |   |   |-- core
    |   |   |-- data
    |   |   |-- modules
    |   |   |-- routes
    |   |-- config # 配置
    |   |   |-- dev.dart
    |   |   |-- prod.dart
    |   |-- constants # 常量
    |   |   |-- app_values.dart
    |   |-- flavors
    |   |   |-- build_config.dart
    |   |   |-- env_config.dart
    |   |   |-- environment.dart
    |   |-- generated # 脚手架自动生成资源、多语言
    |   |-- network # 通用网络库
    |-- modules
    |   |-- common
`
## 安装工具
`flutter pub global activate get_cli`

`flutter pub global activate flutter_gen`

## get
1. get_cli
https://pub.dev/documentation/get_cli/latest/

2. https://pub.dev/documentation/get/latest/

## 运行
Dev: `flutter run --flavor dev lib/main_dev.dart`

Prod: `flutter run --flavor prod lib/main_prod.dart`

## 打包
`flutter build apk -t lib/main_prod.dart --flavor prod`

## 生成资源
1. 修改pubspec.yaml
2. 执行 `fluttergen -c pubspec.yaml`

## 创建新页面
`get create page:name`

## 多语言
修改文件 assets/locales
生成 flutter pub run easy_localization:generate --source-dir assets/locales
flutter pub run easy_localization:generate --source-dir assets/locales  -f keys -o locale_keys.g.dart
1. 资源位于 `assets/locales`
2. 使用方法 `tr(LocaleKeys.name)` 

## build model

`flutter pub run build_runner build --delete-conflicting-outputs`

## 一键生成或更新model、多语言、资源
执行 `gen.sh`