import 'dart:io';

import 'package:main1/main1.dart';
import 'package:main1/menu/home_menu.dart';
import 'package:main1/menu/profile_menu.dart';
import 'package:main1/menu/setting_menu.dart';
import 'package:main1/service/extemsionservice.dart';
import 'package:main1/service/io_service.dart';
import 'package:hive/hive.dart';
import 'package:main1/service/languageservice.dart';
import 'package:path/path.dart' as path;

Stream<String> qayta(String str) async* {
  List<String> lisru = str.split("");
  for (var e in lisru) {
    await Future.delayed(Duration(milliseconds: 60));
    yield e;
  }
}

void main() async {
  ///////////////////  database
  final String directory2 = path.join(Directory.current.path, "user");
  Hive.init(directory2);
  await Hive.openBox("user");
  final box2 = Hive.box("user");

  final String directory1 = path.join(Directory.current.path, "admin");
  Hive.init(directory1);
  await Hive.openBox("admin");
  final box1 = Hive.box("admin");
  await for (var value in qayta("greeting".tr)) {
    IOService.write(value);
  }
  print("");
  bool tek3 = false;
  do {
    String kir = "1 . ${"kiritish".tr}";
    await for (var value in qayta(kir)) {
      IOService.write(value);
    }
    print("");
    String kirr = "2 . ${"kirish".tr}";
    await for (var value in qayta(kirr)) {
      IOService.write(value);
    }
    print("");
    String? s = IOService.read();
    if (s == "1") {
      bool tek = false;
      do {
        String kir = "kiritish".tr;
        await for (var value in qayta(kir)) {
          IOService.write(value);
        }
        print("");
        String userr = "1 . User";
        await for (var value in qayta(userr)) {
          IOService.write(value);
        }
        print("");
        String admin = "2 . Admin";
        await for (var value in qayta(admin)) {
          IOService.write(value);
        }
        print("");
        String input = IOService.read();
        if (input == "1") {
          String user = "Enter your password:".tr;
          await for (var value in qayta(user)) {
            IOService.write(value);
          }
          String user1 = IOService.read();
          box2.put("user", user1);
          MyApp(
              home: UserHomeMenu(),
              routes: {
                UserHomeMenu.id: UserHomeMenu(),
                UserSettingMenu.id: UserSettingMenu(),
                UserProfileMenu.id: UserProfileMenu(),
              },
              language: Language.en);
          tek = false;
        } else if (input == "2") {
          String admin = "Enter your password:".tr;
          await for (var value in qayta(admin)) {
            IOService.write(value);
          }
          String user1 = IOService.read();
          box1.put("admin", user1);
          MyApp(
              home: AdminHomeMenu(),
              routes: {
                AdminHomeMenu.id: AdminHomeMenu(),
                AdminSettingMenu.id: AdminSettingMenu(),
                AdminProfileMenu.id: AdminProfileMenu(),
              },
              language: Language.en);
          tek = false;
        } else {
          await for (var value
              in qayta("Xato qiymant kirittingiz iltimos qaytadan kiriting ")) {
            IOService.write(value);
          }
          print("");
          tek = true;
        }
      } while (tek);
    } else if (s == "2") {
      bool tek = false;
      do {
        String kir = "kirish".tr;
        await for (var value in qayta(kir)) {
          IOService.write(value);
        }
        print("");
        String userr = "1 . User";
        await for (var value in qayta(userr)) {
          IOService.write(value);
        }
        print("");
        String admin = "2 . Admin";
        await for (var value in qayta(admin)) {
          IOService.write(value);
        }
        print("");
        String input = IOService.read();
        if (input == "1") {
          tek = false;
          bool tek2 = false;
          do {
            String profile = "Enter your password:".tr;
            await for (var value in qayta(profile)) {
              IOService.write(value);
            }
            print("");
            String? str = IOService.read();
            for (var e in box1.keys) {
              if (str == e) {
                MyApp(
                    home: AdminHomeMenu(),
                    routes: {
                      AdminHomeMenu.id: AdminHomeMenu(),
                      AdminSettingMenu.id: AdminSettingMenu(),
                      AdminProfileMenu.id: AdminProfileMenu(),
                    },
                    language: Language.en);
                tek2 = false;
              } else {
                String profile = "bunaqa Isim mavjut emas".tr;
                await for (var value in qayta(profile)) {
                  IOService.write(value);
                }
                print("");
                String profile1 = "Qayta kiritish".tr;
                await for (var value in qayta(profile1)) {
                  IOService.write(value);
                }
                print("");
                String profile10 = "2 . ${"Ortga".tr}";
                await for (var value in qayta(profile10)) {
                  IOService.write(value);
                }
                print("");
                String profile2 = "exit".tr;
                await for (var value in qayta(profile2)) {
                  IOService.write(value);
                }
                print("");
                String str = IOService.read();
                if (str == "1") {
                  tek2 = true;
                } else if (str == "2") {
                  return main();
                } else {
                  exit(0);
                }
                tek2 = true;
              }
            }
          } while (tek2);
          tek = false;
        } else if (input == "2") {
          bool tek2 = false;
          do {
            await for (var value in qayta("Enter your password:".tr)) {
              IOService.write(value);
            }
            print("");
            String? str = IOService.read();
            for (var e in box2.keys) {
              if (str == e) {
                MyApp(
                    home: AdminHomeMenu(),
                    routes: {
                      AdminHomeMenu.id: AdminHomeMenu(),
                      AdminSettingMenu.id: AdminSettingMenu(),
                      AdminProfileMenu.id: AdminProfileMenu(),
                    },
                    language: Language.en);
              } else {
                String profile = "bunaqa Isim mavjut emas".tr;
                await for (var value in qayta(profile)) {
                  IOService.write(value);
                }
                print("");
                String profile1 = "Qayta kiritish".tr;
                await for (var value in qayta(profile1)) {
                  IOService.write(value);
                }
                print("");
                String profile10 = "2 . ${"Ortga".tr}";
                await for (var value in qayta(profile10)) {
                  IOService.write(value);
                }
                print("");
                String profile2 = "exit".tr;
                await for (var value in qayta(profile2)) {
                  IOService.write(value);
                }
                print("");
                String str = IOService.read();
                if (str == "1") {
                  tek2 = true;
                } else if (str == "2") {
                  return main();
                } else {
                  exit(0);
                }
                tek2 = true;
              }
            }
          } while (tek2);
          tek = false;
        } else {
          await for (var value in qayta("Xata qiymat kirittingiz")) {
            IOService.write(value);
          }
          print("");
          tek = true;
        }
      } while (tek);
    } else {
      String profile = "bunaqa Isim mavjut emas".tr;
      await for (var value in qayta(profile)) {
        IOService.write(value);
      }
      print("");
      String profile1 = "Qayta kiritish".tr;
      await for (var value in qayta(profile1)) {
        IOService.write(value);
      }
      print("");
      String profile2 = "exit".tr;
      await for (var value in qayta(profile2)) {
        IOService.write(value);
      }
      print("");
      String str = IOService.read();
      if (str == "1") {
        tek3 = true;
      } else {
        exit(0);
      }
      tek3 = true;
    }
  } while (tek3);
}
