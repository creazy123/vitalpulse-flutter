# VitalPulse AI - Flutter

智能健康管家 App 的 Flutter 端最小可运行骨架。

## 技术栈

- Flutter 3.22+ / Dart 3.4+
- flutter_riverpod 2.5
- go_router 14
- dio 5.4
- flutter_secure_storage / shared_preferences

## 运行

```bash
# 首次拉取后,生成 ios/ 和 android/ 原生工程
flutter create .

# 安装依赖
flutter pub get

# 运行
flutter run
```

## 目录结构

```
lib/
├── app/                # 入口 / bootstrap
├── router/             # go_router 路由
├── theme/              # ThemeData
├── screens/            # 页面
│   ├── auth/
│   ├── chat/
│   ├── profile/
│   └── settings/
├── features/           # 业务逻辑 (Riverpod Notifier)
│   └── auth/
├── data/
│   └── api/            # Dio + Interceptors
└── widgets/
    └── layout/         # MainShell (BottomNav + Drawer)
```

## 演示流程

1. 启动 App,自动跳转 `/login`
2. 输入任意 11 位手机号 + 6 位验证码,点击登录(Mock)
3. 进入主壳:底部 3 个 Tab(对话 / 档案 / 设置)+ 左侧 Drawer
4. 在对话页发消息会有 Mock 回复
5. 设置页"退出登录"会返回登录页

## 下一步

- 替换 `ChangeNotifier` 为 `AsyncNotifier` + `riverpod_generator`
- 接入真实后端 API
- 加入 SSE 流式回复
- 加入 Sentry 监控
