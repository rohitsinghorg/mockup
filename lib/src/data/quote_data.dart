/// A data class that provides predefined quote mock data.
///
/// This class contains static JSON data representing a collection of quotes
/// with various properties such as author, quote, themes and quote_type.
/// The data is used by [QuoteProvider] to populate its cache without
/// requiring any external API calls.
class QuoteData {
  /// Raw JSON data containing quote information.
  static const json = [
    {
      "id": "4d5f4316-68bb-4adf-b67f-1adccf22739d",
      "author": "Albert Einstein",
      "quote":
          "Life is like riding a bicycle. To keep your balance, you must keep moving.",
      "themes": ["life", "balance", "movement"],
      "quote_type": "Motivational"
    },
    {
      "id": "8a9eab8c-7840-4ac0-b75e-c7c8f717b2b4",
      "author": "Maya Angelou",
      "quote":
          "You will face many defeats in life, but never let yourself be defeated.",
      "themes": ["perseverance", "strength", "resilience"],
      "quote_type": "Inspirational"
    },
    {
      "id": "c7db315f-3eb1-42c9-b9d7-bccae30de435",
      "author": "Oscar Wilde",
      "quote": "Be yourself; everyone else is already taken.",
      "themes": ["individuality", "authenticity", "self"],
      "quote_type": "Philosophical"
    },
    {
      "id": "d9f3b983-6f0e-4528-b0c3-8a99968e44a2",
      "author": "Nelson Mandela",
      "quote": "It always seems impossible until it's done.",
      "themes": ["perseverance", "hope", "achievement"],
      "quote_type": "Motivational"
    },
    {
      "id": "d4e6ab97-b7a1-4b78-9b1a-8a22b300cc65",
      "author": "Steve Jobs",
      "quote":
          "Your work is going to fill a large part of your life, and the only way to be truly satisfied is to do what you believe is great work. And the only way to do great work is to love what you do.",
      "themes": ["work", "passion", "satisfaction"],
      "quote_type": "Motivational"
    },
    {
      "id": "66b7639c-d90a-4d5a-a25e-3fa855ec1c4e",
      "author": "Mark Twain",
      "quote": "The secret of getting ahead is getting started.",
      "themes": ["motivation", "start", "success"],
      "quote_type": "Inspirational"
    },
    {
      "id": "91e29219-5b23-4d28-b287-b0c79d7d545f",
      "author": "Confucius",
      "quote":
          "Our greatest glory is not in never falling, but in rising every time we fall.",
      "themes": ["resilience", "glory", "failure"],
      "quote_type": "Philosophical"
    },
    {
      "id": "f57d3793-d7e4-47c1-bbdb-b98bc72edc8f",
      "author": "Walt Disney",
      "quote": "The way to get started is to quit talking and begin doing.",
      "themes": ["action", "initiative", "doing"],
      "quote_type": "Motivational"
    },
    {
      "id": "e8fa50b5-83b2-47b2-8240-47b0f0aeae3a",
      "author": "Helen Keller",
      "quote": "Alone we can do so little; together we can do so much.",
      "themes": ["teamwork", "collaboration", "strength"],
      "quote_type": "Inspirational"
    },
    {
      "id": "8ac3e76f-7bfa-44db-90e1-68eaf497443a",
      "author": "Socrates",
      "quote": "An unexamined life is not worth living.",
      "themes": ["philosophy", "reflection", "life"],
      "quote_type": "Philosophical"
    },
    {
      "id": "b05b4e38-04db-41a7-8fa6-e845869dbb94",
      "author": "William Shakespeare",
      "quote": "To be, or not to be, that is the question.",
      "themes": ["philosophy", "life", "existence"],
      "quote_type": "Philosophical"
    },
    {
      "id": "40d2f0f1-e4b0-4df9-9f06-54b56724d5e6",
      "author": "Winston Churchill",
      "quote":
          "Success is not final, failure is not fatal: It is the courage to continue that counts.",
      "themes": ["success", "failure", "courage"],
      "quote_type": "Motivational"
    },
    {
      "id": "a95bfa76-e2f4-4741-83bc-5426b2f0f7b2",
      "author": "Buddha",
      "quote": "What we think, we become.",
      "themes": ["thought", "mindset", "self"],
      "quote_type": "Philosophical"
    },
    {
      "id": "b2b6f6e2-28ae-4749-a221-c31b307d05bc",
      "author": "John F. Kennedy",
      "quote":
          "Ask not what your country can do for you – ask what you can do for your country.",
      "themes": ["service", "patriotism", "country"],
      "quote_type": "Inspirational"
    },
    {
      "id": "27d4d25d-e3d4-43b6-9fe3-d06c6cb0d1b5",
      "author": "Aristotle",
      "quote": "The more you know, the more you realize you don't know.",
      "themes": ["knowledge", "wisdom", "learning"],
      "quote_type": "Philosophical"
    },
    {
      "id": "6f8c6f5f-e7d1-4307-9c3e-bcd34a2d6235",
      "author": "Abraham Lincoln",
      "quote": "The best way to predict your future is to create it.",
      "themes": ["future", "success", "creation"],
      "quote_type": "Motivational"
    },
    {
      "id": "2d5a0749-0623-4741-b03d-9e5ed4ab0737",
      "author": "Albert Einstein",
      "quote":
          "Imagination is more important than knowledge. For knowledge is limited, whereas imagination embraces the entire world.",
      "themes": ["imagination", "creativity", "knowledge"],
      "quote_type": "Philosophical"
    },
    {
      "id": "bf2d68c5-5608-4a68-974d-8de9026b4876",
      "author": "Mark Twain",
      "quote":
          "The two most important days in your life are the day you are born and the day you find out why.",
      "themes": ["life", "purpose", "self-discovery"],
      "quote_type": "Philosophical"
    },
    {
      "id": "fd5684c3-5d37-427f-9c3b-6e94b2579d07",
      "author": "Eleanor Roosevelt",
      "quote":
          "The future belongs to those who believe in the beauty of their dreams.",
      "themes": ["future", "dreams", "belief"],
      "quote_type": "Inspirational"
    },
    {
      "id": "8a1d5f1e-ff55-4457-b59c-75d83e9e928d",
      "author": "Confucius",
      "quote":
          "He who learns but does not think, is lost. He who thinks but does not learn is in great danger.",
      "themes": ["learning", "thinking", "wisdom"],
      "quote_type": "Philosophical"
    },
    {
      "id": "b9f8d9da-b7b5-4d56-9a62-857c917465f1",
      "author": "Martin Luther King Jr.",
      "quote":
          "I have a dream that one day this nation will rise up and live out the true meaning of its creed.",
      "themes": ["dream", "equality", "freedom"],
      "quote_type": "Inspirational"
    },
    {
      "id": "6c5fd537-eed7-4e28-a548-b9b2bc517e34",
      "author": "Henry Ford",
      "quote":
          "Whether you think you can, or you think you can't – you're right.",
      "themes": ["belief", "success", "mindset"],
      "quote_type": "Motivational"
    },
    {
      "id": "f367c1cc-8a4f-40a1-bb8f-7d9811b28560",
      "author": "Mahatma Gandhi",
      "quote": "Be the change that you wish to see in the world.",
      "themes": ["change", "action", "peace"],
      "quote_type": "Inspirational"
    },
    {
      "id": "9180a6f8-bfc2-4967-96b9-4159be6c5093",
      "author": "Leonardo da Vinci",
      "quote": "Learning never exhausts the mind.",
      "themes": ["learning", "knowledge", "growth"],
      "quote_type": "Philosophical"
    },
    {
      "id": "fb79c3ab-ecbf-4d94-9fe7-bdb131f5478e",
      "author": "Ralph Waldo Emerson",
      "quote":
          "What lies behind us and what lies before us are tiny matters compared to what lies within us.",
      "themes": ["self", "inner strength", "perspective"],
      "quote_type": "Inspirational"
    },
    {
      "id": "f4c7b74f-f9db-41c3-8b88-d79ed3ad3ff7",
      "author": "Walt Disney",
      "quote":
          "All our dreams can come true, if we have the courage to pursue them.",
      "themes": ["dreams", "courage", "persistence"],
      "quote_type": "Motivational"
    },
    {
      "id": "234fe420-4ea3-4b28-b4f0-bb1d0e96b3e0",
      "author": "Albert Einstein",
      "quote": "In the middle of difficulty lies opportunity.",
      "themes": ["opportunity", "difficulty", "hope"],
      "quote_type": "Motivational"
    },
    {
      "id": "d27c7e55-8d9f-4301-bb34-2d01649c84be",
      "author": "Mahatma Gandhi",
      "quote": "An eye for an eye only ends up making the whole world blind.",
      "themes": ["peace", "forgiveness", "violence"],
      "quote_type": "Philosophical"
    },
    {
      "id": "3bcedabb-38a2-4fa6-a0cf-2c62e2d3d021",
      "author": "Abraham Lincoln",
      "quote": "I am a slow walker, but I never walk back.",
      "themes": ["persistence", "determination", "progress"],
      "quote_type": "Motivational"
    },
    {
      "id": "fdc1fe85-621d-45d1-b846-4f88d42214f7",
      "author": "Blaise Pascal",
      "quote":
          "All men’s miseries derive from not being able to sit in a quiet room alone.",
      "themes": ["solitude", "reflection", "peace"],
      "quote_type": "Philosophical"
    },
    {
      "id": "1f7d83f5-cb68-4fe1-b34b-bf31f107f32f",
      "author": "Theodore Roosevelt",
      "quote": "Believe you can and you're halfway there.",
      "themes": ["belief", "confidence", "success"],
      "quote_type": "Motivational"
    },
    {
      "id": "3f542f4d-3c80-44a0-8d70-b2f6dfe65b2a",
      "author": "Steve Jobs",
      "quote": "Stay hungry, stay foolish.",
      "themes": ["ambition", "innovation", "creativity"],
      "quote_type": "Inspirational"
    },
    {
      "id": "0bb51b91-2a58-4d43-b15a-dfd6ac1bc497",
      "author": "William Wordsworth",
      "quote": "To begin, begin.",
      "themes": ["action", "start", "initiative"],
      "quote_type": "Motivational"
    },
    {
      "id": "0b1678f8-e6b0-423b-8ecf-73a38b983700",
      "author": "J.K. Rowling",
      "quote":
          "It is our choices that show what we truly are, far more than our abilities.",
      "themes": ["choices", "self", "identity"],
      "quote_type": "Inspirational"
    },
    {
      "id": "39cf79b5-2ef6-41ad-bd0e-28e6f2bb5597",
      "author": "Oscar Wilde",
      "quote": "The only way to get rid of a temptation is to yield to it.",
      "themes": ["temptation", "desire", "morality"],
      "quote_type": "Philosophical"
    },
    {
      "id": "65a1f05f-16a6-4f63-b00d-268396b7f4d1",
      "author": "Helen Keller",
      "quote": "Life is either a daring adventure or nothing at all.",
      "themes": ["adventure", "life", "risk"],
      "quote_type": "Inspirational"
    },
    {
      "id": "9445b177-0c66-430a-a29d-7a94a25f8a96",
      "author": "Plato",
      "quote": "The unexamined life is not worth living.",
      "themes": ["philosophy", "self", "reflection"],
      "quote_type": "Philosophical"
    },
    {
      "id": "c8499e53-f900-4233-93d2-d301e2285fdb",
      "author": "Aristotle",
      "quote": "Knowing yourself is the beginning of all wisdom.",
      "themes": ["wisdom", "self", "knowledge"],
      "quote_type": "Philosophical"
    },
    {
      "id": "c875469e-9be3-4e5e-b8f6-c56e4690b8ae",
      "author": "Albert Einstein",
      "quote": "The important thing is not to stop questioning.",
      "themes": ["curiosity", "questioning", "learning"],
      "quote_type": "Philosophical"
    },
    {
      "id": "90b05f70-78ad-4b4b-830e-1e6f9c9ac393",
      "author": "Pablo Picasso",
      "quote": "Everything you can imagine is real.",
      "themes": ["imagination", "creativity", "art"],
      "quote_type": "Inspirational"
    },
    {
      "id": "d4f124db-b320-437f-a168-3728f16f8642",
      "author": "Leonardo da Vinci",
      "quote": "Simplicity is the ultimate sophistication.",
      "themes": ["simplicity", "elegance", "sophistication"],
      "quote_type": "Philosophical"
    },
    {
      "id": "d47c7dfd-63bb-4b5b-b31a-501be68b2d63",
      "author": "Bruce Lee",
      "quote":
          "Absorb what is useful, discard what is not, add what is uniquely your own.",
      "themes": ["self", "wisdom", "growth"],
      "quote_type": "Inspirational"
    },
    {
      "id": "850579a4-7649-4c69-8422-5fe4b7fa1b1a",
      "author": "Jim Rohn",
      "quote":
          "Your life does not get better by chance, it gets better by change.",
      "themes": ["change", "improvement", "growth"],
      "quote_type": "Motivational"
    }
  ];
}
