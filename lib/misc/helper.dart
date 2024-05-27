import 'dart:convert';
import 'dart:math' as math;
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:encrypt/encrypt.dart' as encryption;

class Helper {
  static String encrypt(String input, String secretKey, String ivKey, {String? captcha}) {
    if(secretKey.isNotEmpty && ivKey.isNotEmpty) {
      var randomString = [input, 'r:${generateRandomString(6)}'];

      if(captcha?.isNotEmpty == true) {
        randomString!.add(captcha!);
      }
      final random = Random();
      for (var i = randomString.length - 1; i > 0; i--) {
        final j = random.nextInt(i + 1);
        final temp = randomString[i];
        randomString[i] = randomString[j];
        randomString[j] = temp;
      }
      final key = encryption.Key.fromUtf8(secretKey);
      final iv = encryption.IV.fromUtf8(ivKey);
      final encrypter = encryption.Encrypter(encryption.AES(key, mode: encryption.AESMode.cbc));

      final encrypted = encrypter.encrypt(randomString.join("||"), iv: iv);

      return encrypted.base64;
    }
    return "";
  }

  static String generateRandomString(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789'; // You can customize this character set.
    final random = Random();
    const maxIndex = chars.length - 1;

    String randomString = '';

    for (int i = 0; i < length; i++) {
      final randomIndex = random.nextInt(maxIndex);
      randomString += chars[randomIndex];
    }

    return randomString;
  }

  static String decrypt(String encrypt, String secretKey, String ivKey) {
    if(secretKey.isNotEmpty && ivKey.isNotEmpty) {
      final key = encryption.Key.fromUtf8(secretKey);
      final iv = encryption.IV.fromUtf8(ivKey);
      final encrypter = encryption.Encrypter(encryption.AES(key, mode: encryption.AESMode.cbc));

      final decrypt = encrypter.decrypt64(encrypt, iv: iv);

      return decrypt;
    }
    return "";
  }

  static String formatBytes(int bytes, int decimals) {
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (math.log(bytes) / math.log(1024)).floor();
    return '${(bytes / math.pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }

  static void log(Object obj) {
    printWrapped(obj.toString());
  }

  static void printWrapped(String text) {
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }

  static String normalizedURLToCacheKey(String url) {
    return url
        .replaceAll('/', '_')
        .replaceAll('http://', '')
        .removeAllWhitespace;
  }

  static String formatDate(DateTime? dateTime,
      {String pattern = "dd MMM yyyy", bool toLocal = false}) {
    if(dateTime != null) {
      if(toLocal){
        return DateFormat(pattern, "id_ID").format(dateTime.toLocal());
      }
      return DateFormat(pattern, "id_ID").format(dateTime);
    } else {
      return '-';
    }
  }

  static String? parseStr(dynamic value) {
    if (value != null) {
      if (value is String) {
        return value;
      } else if (value is int) {
        return value.toString();
      } else if (value is double) {
        return value.toString();
      } else if (value is num) {
        return value.toString();
      } else if (value is Map<String, dynamic>) {
        return json.encode(value);
      }
    }
    return null;
  }

  static int parseInt(dynamic value) {
    if (value != null) {
      if (value is String) {
        DateTime? tryDateTime = parseDateTime(value);
        if (tryDateTime != null) {
          return tryDateTime.millisecondsSinceEpoch;
        }
        return int.tryParse(value) ?? 0;
      } else if (value is int) {
        return value;
      } else if (value is DateTime) {
        return value.millisecondsSinceEpoch ~/ 1000;
      }
    }
    return 0;
  }

  static double parseDouble(dynamic value) {
    if (value != null) {
      if (value is String) {
        return double.tryParse(value) ?? 0;
      } else if (value is num) {
        return value.toDouble();
      }
    }
    return 0;
  }

  static bool parseBool(dynamic value) {
    if (value != null) {
      if (value is bool) {
        return value;
      } else if (value is int) {
        return value == 1;
      } else if (value is String) {
        return value == "1" || value == "true";
      }
    }
    return false;
  }

  static String? toDateTime(DateTime? value,
      {String pattern = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"}) {
    if (value != null) {
      return DateFormat(pattern).format(value);
    }
    return null;
  }

  static String parseDateStringToString(String value, {String pattern = "yyyy-MM-dd"}) {
    DateTime originalDate = DateTime.parse(value);
    String? formattedDate = DateFormat('yyyy-MM-dd').format(originalDate);
    return formattedDate;
  }

  static DateTime? parseDateTime(dynamic value, {String pattern = "yyyy-MM-dd"}) {
    if (value != null) {
      if (value is String) {
        DateTime? tryDateTime;
        try {
          tryDateTime = DateFormat("yyyy-MM-ddTHH:mm:ss.SSSZ").parse(value, true);
        } catch (e) {
          try {
            tryDateTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(value, true);
          } catch (e) {
            try {
              tryDateTime = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(value, true);
            } catch (e) {
              try {
                tryDateTime = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS").parse(value, true);
              } catch (e) {
                try {
                  tryDateTime = DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(value, true);
                } catch (e) {
                  try {
                    tryDateTime = DateFormat("yyyy-MM-dd").parse(value, true); // Format "yyyy-MM-dd" added here
                  } catch (e) {
                    try {
                      tryDateTime = DateFormat("MM/dd/yyyy").parse(value, true); // Format "yyyy-MM-dd" added here
                    } catch (e) {
                      // Handle error if necessary
                    }
                  }
                }
              }
            }
          }
        }

        if (tryDateTime != null) {
          // Ubah timezone ke Asia/Jakarta (jam lokal Indonesia)
          tryDateTime = tryDateTime.toLocal();
        }
        return tryDateTime;
      } else if (value is int) {
        return DateTime.fromMillisecondsSinceEpoch(value * 1000);
      }
    }
    return null;
  }


  static List<String>? parseList(dynamic value) {
    if (value == null) return null;

    if (value is String) {
      try {
        return json.decode(value);
      } catch (e) {
        if (kDebugMode) {
          Helper.log(e.toString());
        }
        return [value.toString()];
      }
    } else if (value is List<String>) {
      return value;
    } else if (value is List<dynamic>) {
      return value.map((e) => e.toString()).toList();
    } else {
      return value;
    }
  }

  static List<Map<String, dynamic>>? toJsons(dynamic values) {
    if (values != null && values.isNotEmpty) {
      List<Map<String, dynamic>> datas = [];
      for (var value in values) {
        datas.add(value.toJson());
      }
      return datas;
    }
    return null;
  }

  static Map<String, dynamic>? toJson(dynamic value) {
    if (value != null) {
      return value.toJson();
    }
    return null;
  }


  static Future<dynamic> initializeModule() async {
  }

  static removePrefix(String phone) {
    String phoneNumber;
    if (phone.substring(0, 1) == "0") {
      phoneNumber = phone.substring(1, phone.length);
    }
    else {
      phoneNumber = phone;
    }
    return phoneNumber;
  }

  static formatCurrency(double currency, {int? decimalDigits, String? localCode, String? symbol}) {
      String local = 'id_ID';
      if(localCode != null){
        local = localCode;
      }
      NumberFormat format = NumberFormat.currency(locale: local, name: '${symbol ?? ''} ', decimalDigits: decimalDigits ?? 2);
      return format.format(currency);
  }

  static formatShortCurrency(double currency, {int? decimalDigits = 0, String? localCode, String? symbol}) {
    String local = 'id_ID';
    if(localCode != null){
      local = localCode;
    }
    NumberFormat format = NumberFormat.compactCurrency(locale: local, symbol: symbol ?? '', decimalDigits: decimalDigits);
    return format.format(currency);
  }

  static List<TextInputFormatter> numberOnly() => [
    FilteringTextInputFormatter.allow(RegExp("[0-9]"),)
  ];

  static List<TextInputFormatter> phoneNumber() => [
    FilteringTextInputFormatter.allow(RegExp("[0-9]"),)
  ];

  static String generateSlug(String input) {
    List<String> keywords = ['create', 'read', 'update', 'delete'];
    String slug = input.toLowerCase().trim();

    for (String keyword in keywords) {
      String capitalizedKeyword = keyword[0].toUpperCase() + keyword.substring(1);
      slug = slug.replaceAll(RegExp(r'\b$keyword\b'), capitalizedKeyword);
    }

    List<String> words = slug.split(' ');
    List<String> uniqueWords = [];

    for (String word in words) {
      if (!uniqueWords.contains(word)) {
        uniqueWords.add(word);
      }
    }

    slug = uniqueWords.join(' ');
    slug = slug.replaceAll(RegExp(r'[^a-zA-Z0-9\s-]'), '');
    slug = slug.replaceAll(RegExp(r'\s+'), '-');
    return slug;
  }

  static String generateDisplay(String input) {
    List<String> keywords = ['create', 'read', 'update', 'delete'];
    String slug = input.trim();

    for (String keyword in keywords) {
      slug = slug.replaceAllMapped(
        RegExp(r'\b' + RegExp.escape(keyword) + r'\b', caseSensitive: false),
            (match) => keyword[0].toUpperCase() + keyword.substring(1),
      );
    }

    List<String> words = slug.split(' ');
    List<String> uniqueWords = [];

    for (String word in words) {
      if (!uniqueWords.contains(word)) {
        uniqueWords.add(word);
      }
    }

    slug = uniqueWords.join(' ');
    slug = slug.replaceAll(RegExp(r'[^a-zA-Z0-9\s-]'), '');
    slug = slug.replaceAll(RegExp(r'\s+'), ' ');
    return slug;
  }

  static String formatPhoneNumber(String phoneNumber) {
    String cleanedNumber = phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');

    cleanedNumber = cleanedNumber.replaceFirst(RegExp('^0+'), '');

    if (!cleanedNumber.startsWith('0') && !cleanedNumber.startsWith('62')) {
      cleanedNumber = '0' + cleanedNumber;
    }

    if (phoneNumber == cleanedNumber) {
      return phoneNumber;
    }

    return cleanedNumber;
  }

  static String capitalizeSentence(String sentence) {
    if (sentence.isEmpty) return sentence;
    List<String> words = sentence.split(' ');
    for (int i = 0; i < words.length; i++) {
      if (words[i].isNotEmpty) {
        words[i] = words[i][0].toUpperCase() + words[i].substring(1);
      }
    }
    return words.join(' ');
  }

  static String convertUoM(String commodity) {
    switch(commodity.toLowerCase()) {
      case "oil":
        return "BBL";
      default:
        return "BOE";
    }
  }

  static String getImageFileNameFromUrl(String imageUrl) {
    Uri uri = Uri.parse(imageUrl);
    String path = uri.path;
    List<String> segments = path.split('/');
    String fileName = segments.isNotEmpty ? segments.last : "image.jpg"; // Nama default jika tidak ditemukan
    return fileName;
  }

  static Color hexCodeToColor(String? hexCode, {Color defaultColor = Colors.black}){
    if(hexCode != null) {
      var hexColor = hexCode.replaceAll("#", "");
      if (hexColor.length == 6) {
        hexColor = "0xFF$hexColor";
      }
      return Color(int.parse(hexColor));
    }
    return defaultColor;
  }

  static String colorToHexCode(Color color){
    var myColor = colorToHex(color).replaceAll("FF", "");
    return '#$myColor';
  }


  static Color colorFromHex(String hexColor) {
    final hex = hexColor.split(',');
    final hexCode = hex[0].replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

  static bool isHexCode(String input) {
    final RegExp hexPattern = RegExp(r'^#?([0-9a-fA-F]{6}|[0-9a-fA-F]{3})$');

    return hexPattern.hasMatch(input);
  }

  static String getFileExtension(String filename) {
    return extension(filename).toLowerCase();
  }
  static String removeFileExtension(String filename) {
    int lastIndex = filename.lastIndexOf('.');
    if (lastIndex != -1) {
      return filename.substring(0, lastIndex);
    }
    return filename;
  }
}
