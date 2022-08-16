import '/utils/extension.dart';
import '/data/emoji_data.dart';
import '/model/emoji_model.dart';

class Emoji {
  static final Emoji _emoji = Emoji._internal();

  factory Emoji() {
    return _emoji;
  }

  Emoji._internal();

  /// custom getters to access user's list and object

  List<EmojiModel> get list => emojiData;

  List<EmojiModel> listUpTo([int max = 1]) => emojiData.getAppendList(max);

  EmojiModel get object => list.random();

  ///
  /// getters to receive specific type only
  String? get emoji => object.emoji;

  String? get name => object.name;

  String? get shortName => object.shortName;

  String? get unicode => object.unicode;

  String? get html => object.html;

  String? get category => object.category;
}
