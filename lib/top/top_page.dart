import 'package:flutter/material.dart';

class UserProfileSlider extends StatelessWidget {
  final List<Map<String, String>> userProfiles = <Map<String, String>>[
    {
      'image': 'assets/image/us4.jpg',
      'icon': 'assets/image/us4.jpg',
      'name': '津田 梅子',
      'age': '23',
      'hometown': '福岡',
    },
    {
      'image': 'assets/image/us1.png',
      'icon': 'assets/image/us1.png',
      'name': '宮城 恵子',
      'age': '25',
      'hometown': '東京',
    },
    {
      'image': 'assets/image/us2.jpg',
      'icon': 'assets/image/us2.jpg',
      'name': '佐野 美子',
      'age': '28',
      'hometown': 'ニューヨーク',
    },
    {
      'image': 'assets/image/us3.jpg',
      'icon': 'assets/image/us3.jpg',
      'name': '金城 京子',
      'age': '25',
      'hometown': '愛知',
    },
    {
      'image': 'assets/image/us5.jpg',
      'icon': 'assets/image/us5.jpg',
      'name': '喜名 真理子',
      'age': '28',
      'hometown': '21',
    },
    {
      'image': 'assets/image/us6.jpg',
      'icon': 'assets/image/us6.jpg',
      'name': '藤園 理子',
      'age': '26',
      'hometown': '埼玉',
    },
  ];

  UserProfileSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: userProfiles.length, // ユーザー数に応じてページを生成
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserProfileScreen(
                  image: userProfiles[index]['image']!,
                  icon: userProfiles[index]['icon']!,
                  name: userProfiles[index]['name']!,
                  age: userProfiles[index]['age']!,
                  hometown: userProfiles[index]['hometown']!,
                ),
              ),
            );
          },
          child: Container(
            color: Colors.white, // 各ページの背景色を白に設定
            child: UserProfile(
              image: userProfiles[index]['image']!,
              icon: userProfiles[index]['icon']!,
              name: userProfiles[index]['name']!,
              age: userProfiles[index]['age']!,
              hometown: userProfiles[index]['hometown']!,
            ),
          ),
        );
      },
    );
  }
}
class UserProfile extends StatelessWidget {
  final String image;
  final String icon;
  final String name;
  final String age;
  final String hometown;

  const UserProfile({super.key, 
    required this.image,
    required this.icon,
    required this.name,
    required this.age,
    required this.hometown,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0.0, -0.5), // 中央より少し上に調整
      child: Stack(
        clipBehavior: Clip.none, // Stackの外にはみ出る要素を表示する
        children: [
          // User image (increased size)
          Container(
            height: 450, // 画像の高さを大きく
            width: 350, // 画像の幅を大きく
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          // User icon (increased size)
          Positioned(
            bottom: -50, // アイコンをさらに下に配置
            left: 30,
            child: Container(
              height: 100, // アイコンの高さを大きく
              width: 100, // アイコンの幅を大きく
              decoration: BoxDecoration(
                color: Colors.white, // アイコンの背景色を白に設定
                image: DecorationImage(
                  image: AssetImage(icon),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white, // アイコンの外側に白い枠
                  width: 4,
                ),
              ),
            ),
          ),
          // User profile (name, age, hometown)
          Positioned(
            bottom: -80, // プロフィールテキストをアイコンの下に配置
            right: 25, // テキストを画面の右側に配置
            child: Container(
              padding: const EdgeInsets.all(10), // ボックス内に余白を追加
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey, // ボックスの枠線を灰色に設定
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10), // ボックスに角丸を追加
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end, // テキストを右揃えにする
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 20, // 名前を少し大きく表示
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // 黒色の文字に設定
                      decoration: TextDecoration.none, // アンダーラインなし
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisSize: MainAxisSize.min, // 行のサイズをコンテンツに合わせる
                    children: [
                      const Text(
                        '年齢:',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          decoration: TextDecoration.none, // アンダーラインなし
                        ),
                      ),
                      Text(
                        ' $age歳',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black, // 黒色の文字に設定
                          decoration: TextDecoration.none, // アンダーラインなし
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        '出身地:',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          decoration: TextDecoration.none, // アンダーラインなし
                        ),
                      ),
                      Text(
                        ' $hometown',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black, // 黒色の文字に設定
                          decoration: TextDecoration.none, // アンダーラインなし
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UserProfileScreen extends StatelessWidget {
  final String image;
  final String icon;
  final String name;
  final String age;
  final String hometown;

  const UserProfileScreen({super.key, 
    required this.image,
    required this.icon,
    required this.name,
    required this.age,
    required this.hometown,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Image.asset(
                        image,
                        fit: BoxFit.cover,
                        height: constraints.maxWidth > 600 ? 400 : 300,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 240.0, left: 20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              radius: 60,
                              backgroundImage: AssetImage(icon),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text('年齢: $age歳', style: const TextStyle(fontSize: 16)),
                        const SizedBox(height: 8),
                        Text('出身地: $hometown', style: const TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '行きたいイベント',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(10.0),
                          ),
                          child: Container(
                            width: double.infinity,
                            height: 200,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/image/event_background.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'イベント名',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(Icons.calendar_today, size: 16),
                                  SizedBox(width: 8),
                                  Text(
                                    '日時: 2023年10月10日',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(Icons.location_on, size: 16),
                                  SizedBox(width: 8),
                                  Text(
                                    '場所: 沖縄',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
