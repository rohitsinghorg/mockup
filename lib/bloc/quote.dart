import '../data/quote_data.dart';
import '../model/quote_model.dart';
import '../utils/extension.dart';

class Quote {
  /// custom getters to access user's list and object

  List<QuoteModel> get list => quoteData;

  List<QuoteModel> listUpTo([int max = 1]) => quoteData.getAppendList(max);

  QuoteModel get object => list.random();

  ///
  /// getters to receive specific type only
  String? get quote => object.quote;

  String? get author => object.author;
}
