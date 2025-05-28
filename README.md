# おにのおおにぎりおにぎりにき
## 成果報告
Topa'z: https://topaz.dev/projects/ef454c585d9568e9ffd3
## メンバー
* 上田剛瑠
* 梅田旭
* 仲宗根妃夏
* 喜納政凜

## 環境構築
### インストールするもの
* fvm : 3.2.1(最新)
* Flutter : 3.24.2(stable 最新)
* Android Studio : 2024.1(最新)
* GitHub Desktop
* Java : 1.8

### 構築手順(Flutter・Android・fvm)
1. 以下のリンクから`Flutter`と`Android Studio`をインストールしてください。

    * [Flutter環境構築(Mac編)](https://zenn.dev/heyhey1028/books/flutter-basics/viewer/getting_started_mac)
    * [Flutter環境構築(Windows編)](https://zenn.dev/heyhey1028/books/flutter-basics/viewer/getting_started_windows)

2. fvmのインストール    
    ```
    // 以下のコードを実行してfvmをインストール
    dart pub global activate fvm

    // インストールしたfvmのバージョンが表示されればOK
    fvm --version
    ```
3. fvmでFlutterのバージョンの指定

    以下のコマンドを実行して、このプロジェクトで使用するFlutterのバージョンを指定します。
    ```
    fvm use 3.24.2
    ```
    以下のような質問がきたら「y」を入力します。
    ```
    Flutter "stable" is not installed.
    Would you like to install it? Y/n:
    ```
4. その他設定

    「.gitignore」ファイルに以下の文があるか確認し、一番下に追加してください。
    ```
    .fvm/
    ```

    「.vscode/setting.json」に以下のようにコードを追加してください。
    ```
    {
        "dart.flutterSdkPath": ".fvm/versions/3.24.2",

        -------- ここから --------
        // 検索対象からFVMのファイルを除外します。
        "search.exclude": {
            "**/.fvm": true
        },
        // ファイル監視対象からFVMのファイルを除外します。
        "files.watcherExclude": {
            "**/.fvm": true
        },
        -------- ここまで --------
    }
    ```

5. fvmを使用してFlutterアプリを実行

    以下のコマンドを実行して、fvmを使用してFlutterアプリを実行します。
    ```
    fvm flutter run
    ```

### Java 1.8のインストール
1. 以下のリンクからJava 1.8をダウンロードしてインストールしてください。
    * [Java SE Development Kit 8 Downloads](https://www.oracle.com/java/technologies/javase/javase-jdk8-downloads.html)

### 構築手順(GitHub Desktop)
1. 以下のURLからインストーラーをダウンロードする<br>
    * [https://desktop.github.com/download/](https://desktop.github.com/download/)
2. インストールする


## GitHub Desktopの使い方
参考 : [GitHub Desktopの使い方](https://www.kagoya.jp/howto/it-glossary/develop/githubdesktop/)

### リポジトリのclone
1. 上の「File」から「Clone repository...」を選択する
    <img hegith="300" src="image.png">

2. クローンしたいリポジトリ「Oninooonigirionigiriniki」を選択し、リポジトリをクローンする場所(自分の好きな場所)を選択する。
    <img heigth="300" src="image-1.png">

## GitHubの流れが分からないとき
電車で例えているからから分かりやすい！：\
https://qiita.com/k_uki512/items/7c1856edbade1bc7b98a

### fetch・pull
```
git fetch
```
リモートリポジトリから最新の変更を取得しますが、ローカルの作業ブランチには反映されません。

```
git pull
```
リモートリポジトリから最新の変更を取得し、ローカルの作業ブランチにマージします。

### commit
```
git commit -m "コミットメッセージ"
```
ステージングエリアにある変更をコミットし、コミットメッセージを付けます。

### push
```
git push origin ブランチ名
```
ローカルのコミットをリモートリポジトリの指定したブランチにプッシュします。

## コミットメッセージの書き方
### テンプレート
```
[種類] (コミット要約)
```
### コミット種別
| 種類 | 説明 |
| :-- | --- |
| `Add` | 新規機能・ファイルの追加 |
| `Update` | 機能修正・変更 |
| `Fix` | バグ修正 |
| `Remove` | 機能・ファイル削除 |
| `Docs` | ドキュメント修正 |

### 例
```
[Add] ユーザー登録機能の追加
```

## ディレクトリ構成
このディレクトリ構造はMVVMのアーキテクチャを参考しています。
以下はファイル構造の例です。
```
lib/
│
├── main.dart
│
├── pages/
│   ├── login/
│   │   ├── login_page.dart
│   │   └── sign_in_page.dart
│   │
│   ├── home/
│   │   └── home_page.dart
│   │
│   ├── profile/
│   │   ├── profile_create_step1.dart
│   │   └── profile_create_step2.dart
│   │
│   ├── event/
│   │   ├── event_list_page.dart
│   │   ├── event_detail_page.dart
│   │   └── event_registration_page.dart
│   │
│   ├── chat/
│   │   ├── chat_list_page.dart
│   │   └── chat_page.dart
│   │
│   ├── quest/
│   │   └── quest_list_page.dart
│   │
│   └── drive/
│       └── drive_course_page.dart
│
├── models/
│   ├── user_model.dart
│   ├── event_model.dart
│   ├── chat_model.dart
│   └── quest_model.dart
│
├── providers/
│   ├── auth_provider.dart
│   ├── event_provider.dart
│   ├── profile_provider.dart
│   └── chat_provider.dart
│
├── services/
│   ├── firebase_service.dart
│   └── location_service.dart
│
├── widgets/
│   ├── custom_button.dart
│   ├── custom_text_field.dart
│   └── event_card.dart
│
└── utils/
    ├── constants.dart
    └── helpers.dart

```

## その他参考資料
* [Windowsでfvmを使って複数バージョンのFlutterを管理する](https://docs.gradle.org/current/userguide/compatibility.html)
