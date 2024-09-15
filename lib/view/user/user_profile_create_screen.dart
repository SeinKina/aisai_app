import 'package:aisai_app/view/event/event_select_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'viewmodel/profile_create_viewmodel.dart';

class ProfileCreateScreen extends StatelessWidget {
  ProfileCreateScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileCreateViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('プロフィール設定'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Consumer<ProfileCreateViewModel>(
              builder: (context, viewModel, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        viewModel.backgroundImage != null
                            ? Container(
                                width: double.infinity,
                                height: 250,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        FileImage(viewModel.backgroundImage!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            : Container(
                                width: double.infinity,
                                height: 250,
                                color: Colors.grey.shade300,
                              ),
                        Positioned(
                          bottom: -50,
                          left: MediaQuery.of(context).size.width / 2.15 - 50,
                          child: GestureDetector(
                            onTap: () => viewModel.pickProfileImage(),
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: viewModel.profileImage != null
                                  ? FileImage(viewModel.profileImage!)
                                  : null,
                              child: viewModel.profileImage == null
                                  ? const Icon(Icons.add_a_photo,
                                      size: 40, color: Colors.white)
                                  : null,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 70),
                    ElevatedButton(
                      onPressed: () => viewModel.pickBackgroundImage(),
                      child: const Text('背景画像を選択'),
                    ),
                    const SizedBox(height: 20),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            onChanged: (value) => viewModel.updateName(value),
                            decoration: InputDecoration(
                              labelText: '名前',
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 255, 255, 255)
                                      .withOpacity(0.8),
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
                            textInputAction: TextInputAction.next,
                            onChanged: (value) {
                              int? parsedAge = int.tryParse(value);
                              if (parsedAge != null &&
                                  parsedAge >= 0 &&
                                  parsedAge <= 120) {
                                viewModel.updateAge(parsedAge);
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
                              fillColor:
                                  const Color.fromARGB(255, 255, 255, 255)
                                      .withOpacity(0.8),
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
                            value: viewModel.user.gender,
                            items: viewModel.user.genders.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              viewModel.updateGender(newValue!);
                            },
                            decoration: InputDecoration(
                              labelText: '性別',
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 255, 255, 255)
                                      .withOpacity(0.8),
                            ),
                          ),
                          const SizedBox(height: 16),
                          DropdownButtonFormField(
                            value: viewModel.user.seinennkai,
                            items:
                                viewModel.user.seinennkais.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              viewModel.updateSeinennkai(newValue!);
                            },
                            decoration: InputDecoration(
                              labelText: '青年会選択',
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 254, 254, 254)
                                      .withOpacity(0.8),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.newline,
                            onChanged: (value) => viewModel.updateBio(value),
                            maxLines: 5,
                            decoration: InputDecoration(
                              labelText: '自己紹介',
                              alignLabelWithHint: true,
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 255, 255, 255)
                                      .withOpacity(0.8),
                            ),
                            validator: (value) {
                              // 自己紹介は必須ではないので、常にnullを返す
                              return null;
                            },
                          ),
                          const SizedBox(height: 32),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                if (viewModel.validateForm(_formKey)) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('登録が完了しました！')),
                                  );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const EventSelectScreen()),
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
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
