import "package:flutter_test/flutter_test.dart";
import "package:mockup/mockup.dart";

void main() {
  group("value equality", () {
    test("models with equal fields are equal and share a hashCode", () {
      final a = QuoteModel(id: "1", author: "A", themes: ["x", "y"]);
      final b = QuoteModel(id: "1", author: "A", themes: ["x", "y"]);
      expect(a, b);
      expect(a.hashCode, b.hashCode);
      expect({a, b}, hasLength(1));
    });

    test("list fields are compared element by element", () {
      final a = QuoteModel(id: "1", themes: ["x", "y"]);
      expect(a, isNot(QuoteModel(id: "1", themes: ["y", "x"])));
      expect(a, isNot(QuoteModel(id: "1", themes: ["x"])));
      expect(a, isNot(QuoteModel(id: "1")));
    });

    test("nested models are compared by value", () {
      final a = UserModel(firstName: "Ava", address: Address(city: "Chicago"));
      final b = UserModel(firstName: "Ava", address: Address(city: "Chicago"));
      expect(a, b);
      expect(a.hashCode, b.hashCode);
      expect(a, isNot(UserModel(firstName: "Ava", address: Address())));
    });

    test("different model types are never equal", () {
      expect(EmojiModel(name: "x"), isNot(QuoteModel()));
    });
  });

  group("copyWith", () {
    test("replaces only the given fields", () {
      final original = Mockup.automobile.getItemAt(0);
      final copy = original.copyWith(make: "Custom", year: 1999);
      expect(copy.make, "Custom");
      expect(copy.year, 1999);
      expect(copy.model, original.model);
      expect(copy.features, original.features);
      expect(original.make, isNot("Custom"));
    });

    test("with no arguments produces an equal, distinct object", () {
      for (final user in Mockup.user.getAll()) {
        final copy = user.copyWith();
        expect(copy, user);
        expect(copy, isNot(same(user)));
      }
    });

    test("works on nested Address", () {
      final user = Mockup.user.getItemAt(0);
      final moved = user.copyWith(address: user.address!.copyWith(city: "X"));
      expect(moved.address!.city, "X");
      expect(moved.address!.country, user.address!.country);
      expect(user.address!.city, isNot("X"));
    });
  });

  group("toString", () {
    test("includes the class name and field values", () {
      final quote = QuoteModel(id: "q1", author: "Someone");
      expect(quote.toString(), contains("QuoteModel("));
      expect(quote.toString(), contains("author: Someone"));
      expect(UserModel(address: Address(city: "Pune")).toString(),
          contains("Address("));
    });
  });

  group("fromJson", () {
    test("defaults missing list fields to empty lists", () {
      expect(QuoteModel.fromJson({"id": "1"}).themes, isEmpty);
      expect(AutomobileModel.fromJson({}).features, isEmpty);
      expect(BuildingModel.fromJson({}).facilities, isEmpty);
      expect(FlowerModel.fromJson({}).colors, isEmpty);
    });

    test("accepts integers for double fields", () {
      expect(AutomobileModel.fromJson({"mileage": 30}).mileage, 30.0);
      expect(BuildingModel.fromJson({"area_sqm": 100}).areaSqm, 100.0);
      expect(FlowerModel.fromJson({"price": 5}).price, 5.0);
      expect(Address.fromJson({"latitude": 10}).latitude, 10.0);
    });
  });
}
