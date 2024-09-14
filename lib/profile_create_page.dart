import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import './event_file.dart';
import 'dart:io';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // 背景画像とプロフィール画像を格納する変数
  File? _backgroundImage;
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();

  // ユーザー情報を保持する変数
  final _formKey = GlobalKey<FormState>();
  final List<String> genders = ['男性', '女性', 'その他']; // 性別の選択肢
  String _name = '';
  int _age = 0;
  String _gender = '男性'; // デフォルト値
  String _bio = ''; // 自己紹介用の変数

  // 背景画像選択メソッド
  Future<void> _pickBackgroundImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _backgroundImage = File(pickedFile.path);
      });
    }
  }

  // プロフィール画像選択メソッド
  Future<void> _pickProfileImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  // 画面のUI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('プロフィール設定'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 背景画像とアイコンを重ねて表示
              Stack(
                clipBehavior: Clip.none, // はみ出しを許可する
                children: [
                  // 背景画像を表示
                  _backgroundImage != null
                      ? Container(
                          width: double.infinity,
                          height: 250,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: FileImage(_backgroundImage!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : Container(
                          width: double.infinity,
                          height: 250,
                          color: Colors.grey.shade300,
                        ),
                  // アイコン画像を背景画像の下半分に重ねて配置
                  Positioned(
                    bottom: -50, // アイコンの下半分を背景から出す
                    left: MediaQuery.of(context).size.width / 2.15 - 50, // 中央揃え
                    child: GestureDetector(
                      onTap: _pickProfileImage,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: _profileImage != null
                            ? FileImage(_profileImage!)
                            : null,
                        child: _profileImage == null
                            ? const Icon(Icons.add_a_photo,
                                size: 40, color: Colors.white)
                            : null, // 画像がない場合はアイコンを表示
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 70), // アイコンの下にスペースを確保
              // 背景画像選択ボタン
              ElevatedButton(
                onPressed: _pickBackgroundImage,
                child: const Text('背景画像を選択'),
              ),
              const SizedBox(height: 20),
              // ユーザー情報入力フォーム
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (value) => _name = value,
                      decoration: InputDecoration(
                        labelText: '名前',
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.8),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '名前を入力してください';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        int? parsedAge = int.tryParse(value);
                        if (parsedAge != null &&
                            parsedAge >= 0 &&
                            parsedAge <= 120) {
                          _age = parsedAge;
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('年齢は0歳以上120歳以下で入力してください。'),
                            ),
                          );
                        }
                      },
                      decoration: InputDecoration(
                        labelText: '年齢',
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.8),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '年齢を入力してください';
                        }
                        int? parsedAge = int.tryParse(value);
                        if (parsedAge == null ||
                            parsedAge < 0 ||
                            parsedAge > 120) {
                          return '年齢は0歳以上120歳以下で入力してください';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField(
                      value: _gender,
                      items: genders.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _gender = newValue!;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: '性別',
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.8),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // 自己紹介入力フィールド
                    TextFormField(
                      onChanged: (value) => _bio = value,
                      maxLines: 5,
                      decoration: InputDecoration(
                        labelText: '自己紹介',
                        alignLabelWithHint: true,
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.8),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '自己紹介を入力してください';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 32),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const EventScreen()));
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('登録が完了しました！')),
                            );
                          }
                        },
                        child: const Text('登録'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
