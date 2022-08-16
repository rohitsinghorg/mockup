# Mockup

Mockup helps programmer by providing some predefined source of data. Programmers can use this data to display the list of automobiles, buildings, emojis etc.

### `Why you should use`

- Predefined POJOs
- Fill the API layer gap
- Showcase your work in record time
- Increase productivity
- Easy to use


## Installation

First, we need to do add `mockup` to the dependencies of the `pubspec.yaml`

```yaml
dependencies:
  mockup: ^0.0.1
```
or you can also type in the terminal

```bash
flutter pub add mockup
```

## Usage

To access the data source, you can use the below keywords:

- `list` is used to generate the list of available data source. For example,


```dart
Automobile().list; // returns the list of automobile
Building().list; // returns the list of building
Emoji().list; // returns the list of emoji
Quote().list; // returns the list of quote
User().list; // returns the list of user
```

- `listUpTo()` is used to generate the strict data-source. For example,


```dart
Automobile().listUpTo(12); // returns 12 records
Quote().listUpTo(4); // returns 4 records
```

- `object` gives a single item of data-source. For example,

```dart
Building().object; // returns the random building object
```

Sometimes, the user requires only a few data instead of accessing the complete list or object. In that case, user can either use

```dart
User().object.gender; // Female
```
or

```dart
User().gender; // Female
```

*Note: Every data source has different attributes. An intellisense window will auto-suggest you based on the model you use. User can also see the available attributes by pressing Ctrl+Click.*

### Customised Data Provider

Expecting a list or an object from every data source is good habit. But what if you require something really out of the box like an IP address, or 4-digit octet code, or a lorem-ipsum text or anything?

To fulfill these kind of requirements, Mockup package has some extra mockup classes. These are:

**RandomGenerator**
- `generateEmail()` returns a random email.
- `generateFirstName()` returns a random first name.
- `generateLastName()` returns a random last name.
- `generateMobile()` returns a random mobile.
- `generateRandomDigit(from, to)` returns a random number between a range. By default, range is from 0 to 99.
- `generateRandomDecimal(length)` returns a decimal number. By default, it will return a random one-digit number.
- `generateRandomHexadecimal(length)` returns a random hexadecimal number. By default, it will return one hexadecimal number.
- `generateRandomBinary(length)` returns a random binary number. By default, it will return one binary digit.
- `generateRandomOctal(length)` returns a random octal number. By default, it will return one octal number.
- `generateIPv4()` returns a random IPv4 address.

**TextIpsum**
- `createSentence(length)` returns a sentence. By default, it will return one sentence.
- `createShortParagraph(length)` returns a short paragraph. By default, it will create one small paragraph.
- `createMediumParagraph(length)` returns a medium paragraph. By default, it will create one medium paragraph.
- `createLargeParagraph(length)` returns a sentence. By default, it will create one large paragraph.


## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.


## License
[MIT](https://choosealicense.com/licenses/mit/)