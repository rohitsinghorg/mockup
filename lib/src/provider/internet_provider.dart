import "../data/user_data.dart";
import "../utils/extension.dart";
import "text_provider.dart";

/// Provider for internet-related mock values (UUIDs, usernames, emails and
/// URLs), accessed through `Mockup.internet`.
///
/// Emails and URLs only use the `example.com`, `example.org` and
/// `example.net` domains, which are reserved for documentation and never
/// deliver to real people.
class InternetProvider {
  InternetProvider._();

  /// The singleton instance of [InternetProvider].
  static final InternetProvider instance = InternetProvider._();

  static const _domains = ["example.com", "example.org", "example.net"];

  static const _accents = {
    "á": "a", "à": "a", "ä": "a", "â": "a", "ã": "a", "å": "a", //
    "é": "e", "è": "e", "ë": "e", "ê": "e",
    "í": "i", "ì": "i", "ï": "i", "î": "i",
    "ó": "o", "ò": "o", "ö": "o", "ô": "o", "õ": "o", "ø": "o",
    "ú": "u", "ù": "u", "ü": "u", "û": "u",
    "ñ": "n", "ç": "c", "ß": "ss",
  };

  static String _normalize(String name) {
    final lower = name.toLowerCase();
    final buffer = StringBuffer();
    for (final char in lower.split("")) {
      buffer.write(_accents[char] ?? char);
    }
    return buffer.toString().replaceAll(RegExp("[^a-z0-9]"), "");
  }

  static final List<String> _firstNames = List.unmodifiable(
      UserData.json.map((e) => _normalize(e["first_name"] as String)));
  static final List<String> _lastNames = List.unmodifiable(
      UserData.json.map((e) => _normalize(e["last_name"] as String)));

  /// Returns a random version 4 UUID.
  ///
  /// Not cryptographically secure; use it for mock identifiers only.
  ///
  /// ```dart
  /// Mockup.internet.uuid(); // "3b241101-e2bb-4255-8caf-4136c566a962"
  /// ```
  String uuid() {
    final bytes = List<int>.generate(16, (_) => mockupRandom.nextInt(256));
    bytes[6] = (bytes[6] & 0x0f) | 0x40; // version 4
    bytes[8] = (bytes[8] & 0x3f) | 0x80; // RFC 4122 variant
    final hex = bytes.map((b) => b.toRadixString(16).padLeft(2, "0")).join();
    return "${hex.substring(0, 8)}-${hex.substring(8, 12)}-"
        "${hex.substring(12, 16)}-${hex.substring(16, 20)}-"
        "${hex.substring(20)}";
  }

  /// Returns a random lowercase username such as `ava.garcia42`.
  String username() {
    final separator = const [".", "_", ""].random();
    final suffix = mockupRandom.nextInt(100);
    return "${_firstNames.random()}$separator${_lastNames.random()}$suffix";
  }

  /// Returns a random email address such as `ava.garcia42@example.com`.
  ///
  /// Pass [domain] to use a specific domain.
  String email({String? domain}) {
    final suffix = mockupRandom.nextInt(100);
    return "${_firstNames.random()}.${_lastNames.random()}$suffix"
        "@${domain ?? _domains.random()}";
  }

  /// Returns a random HTTPS URL such as
  /// `https://www.example.org/dolor-sit-amet`.
  String url() {
    return "https://www.${_domains.random()}/${TextProvider.instance.slug()}";
  }
}
