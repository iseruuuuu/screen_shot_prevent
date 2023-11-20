import 'package:flutter/material.dart';
import 'package:screen_protector/screen_protector.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PreventScreenshotScreen(),
    );
  }
}

class PreventScreenshotScreen extends StatefulWidget {
  const PreventScreenshotScreen({Key? key}) : super(key: key);

  @override
  PreventScreenshotScreenState createState() => PreventScreenshotScreenState();
}

class PreventScreenshotScreenState extends State<PreventScreenshotScreen> {
  @override
  void initState() {
    // _preventScreenshotOn();
    protectWithColor();
    super.initState();
  }

  void protectWithColor() async {
    // await ScreenProtector.preventScreenshotOn();
    // await ScreenProtector.preventScreenshotOff();

    //Only iOS
    // スクリーンショットをすると真っ黒になる。
    // await ScreenProtector.protectDataLeakageWithImage('splash');

    //Only iOS マルチタスクの画面になったら、色を赤にする。
    // スクリーンショットをすると真っ黒になる。
    // await ScreenProtector.protectDataLeakageWithColor(Colors.red);

    //Only iOS
    // マルチタスクの画面になったら、色が灰色になる。
    // スクリーンショットをすると真っ黒になる。
    // await ScreenProtector.protectDataLeakageWithColorOff();

    //Only iOS
    // マルチタスクの画面になったら、モザイクっぽくなる
    // スクリーンショット画面は変化なし
    // await ScreenProtector.protectDataLeakageWithBlur();

    //Only iOS
    // スクリーンショットもできる
    //　マルチタスク画面も変化なし
    // await ScreenProtector.protectDataLeakageWithBlurOff();

    //Only Android
    // await ScreenProtector.protectDataLeakageOff();
    // スクリーンショットをすると真っ黒になる。
    // await ScreenProtector.protectDataLeakageOn();
  }

  @override
  void dispose() {
    _removeListenerPreventScreenshot();
    _preventScreenshotOff();
    super.dispose();
  }

  void _preventScreenshotOn() async =>
      await ScreenProtector.preventScreenshotOn();

  void _preventScreenshotOff() async =>
      await ScreenProtector.preventScreenshotOff();

  void _removeListenerPreventScreenshot() async {
    ScreenProtector.removeListener();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('この画面はスクリーンショットしたくない'),
      ),
    );
  }
}
