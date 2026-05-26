import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/auth/auth_notifier.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('设置')),
      body: ListView(
        children: [
          const ListTile(title: Text('账号设置'), trailing: Icon(Icons.chevron_right)),
          const ListTile(title: Text('关于我们'), trailing: Icon(Icons.chevron_right)),
          const ListTile(title: Text('举报反馈'), trailing: Icon(Icons.chevron_right)),
          const Divider(),
          ListTile(
            title: const Text('退出登录', style: TextStyle(color: Colors.red)),
            onTap: () => ref.read(authNotifierProvider).logout(),
          ),
        ],
      ),
    );
  }
}
