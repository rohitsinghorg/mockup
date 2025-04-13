/// A data class that provides predefined building mock data.
///
/// This class contains static JSON data representing a collection of buildings
/// with various properties such as name, location, and architectural details.
/// The data is used by [BuildingProvider] to populate its cache without
/// requiring any external API calls.
class BuildingData {
  /// Raw JSON data containing building information.
  static const json = [
    {
      "id": "a38d15fb-b1e3-453b-98d6-9e84c7293471",
      "name": "Empire State Building",
      "location": "New York, USA",
      "year_built": 1931,
      "floors": 102,
      "area_sqm": 208879.0,
      "building_type": "Commercial",
      "has_parking": true,
      "architect": "Shreve, Lamb & Harmon",
      "elevation": 443.2,
      "description":
          "An iconic skyscraper in New York City, famous for its Art Deco design and historical significance.",
      "facilities": ["Observatory", "Shopping Mall", "Restaurants", "Offices"]
    },
    {
      "id": "a59d433d-b46f-471b-9c34-d93ecf58c084",
      "name": "Burj Khalifa",
      "location": "Dubai, UAE",
      "year_built": 2010,
      "floors": 163,
      "area_sqm": 334000.0,
      "building_type": "Mixed-use",
      "has_parking": true,
      "architect": "Adrian Smith + Gordon Gill Architecture",
      "elevation": 828.0,
      "description":
          "The tallest building in the world, the Burj Khalifa is a marvel of modern engineering and design.",
      "facilities": [
        "Offices",
        "Luxury Residences",
        "Hotel",
        "Observation Deck",
        "Restaurants",
        "Health Club"
      ]
    },
    {
      "id": "b2db5a8f-7430-4692-b4a7-89a6a57fd5b2",
      "name": "The Shard",
      "location": "London, UK",
      "year_built": 2012,
      "floors": 72,
      "area_sqm": 116000.0,
      "building_type": "Mixed-use",
      "has_parking": true,
      "architect": "Renzo Piano",
      "elevation": 310.0,
      "description":
          "A modern and sleek skyscraper, The Shard is the tallest building in the UK and a symbol of London's skyline.",
      "facilities": [
        "Offices",
        "Residential Apartments",
        "Hotel",
        "Restaurants",
        "Viewing Gallery"
      ]
    },
    {
      "id": "c3b52b4e-0a9d-493a-97d7-bc66c4b7bb0a",
      "name": "Sydney Opera House",
      "location": "Sydney, Australia",
      "year_built": 1973,
      "floors": 3,
      "area_sqm": 18300.0,
      "building_type": "Cultural",
      "has_parking": true,
      "architect": "Jørn Utzon",
      "elevation": 65.0,
      "description":
          "One of the most recognizable buildings in the world, the Sydney Opera House is an architectural masterpiece known for its sail-like design.",
      "facilities": [
        "Theatres",
        "Concert Halls",
        "Cafes",
        "Bars",
        "Restaurants"
      ]
    },
    {
      "id": "d6f6fe90-6e3b-41b9-b02f-13ff456592b9",
      "name": "Palace of Versailles",
      "location": "Versailles, France",
      "year_built": 1682,
      "floors": 3,
      "area_sqm": 67800.0,
      "building_type": "Palace",
      "has_parking": false,
      "architect": "Louis Le Vau, Jules Hardouin-Mansart",
      "elevation": 78.0,
      "description":
          "The Palace of Versailles is a former royal residence and symbol of the absolute monarchy of the Ancien Régime in France.",
      "facilities": [
        "Chapel",
        "Gardens",
        "Museum",
        "Hall of Mirrors",
        "Royal Apartments"
      ]
    },
    {
      "id": "e1b9b827-8d4f-44b9-9263-d64c52be98c7",
      "name": "Taipei 101",
      "location": "Taipei, Taiwan",
      "year_built": 2004,
      "floors": 101,
      "area_sqm": 130000.0,
      "building_type": "Commercial",
      "has_parking": true,
      "architect": "C.Y. Lee & Partners",
      "elevation": 508.0,
      "description":
          "Once the tallest building in the world, Taipei 101 is a landmark of Taiwan, combining traditional design elements with modern skyscraper technology.",
      "facilities": [
        "Offices",
        "Retail Spaces",
        "Observation Deck",
        "Conference Center"
      ]
    },
    {
      "id": "f55e2e32-61c2-4ec0-b599-1d6c321cb8b7",
      "name": "Eiffel Tower",
      "location": "Paris, France",
      "year_built": 1889,
      "floors": 3,
      "area_sqm": 2500.0,
      "building_type": "Monument",
      "has_parking": false,
      "architect": "Gustave Eiffel",
      "elevation": 330.0,
      "description":
          "The Eiffel Tower is a wrought-iron lattice tower on the Champ de Mars in Paris, widely recognized as one of the most famous structures in the world.",
      "facilities": ["Viewing Platforms", "Restaurants", "Cafes"]
    },
    {
      "id": "b46a99f8-238f-46e1-a04d-5ab416632fd2",
      "name": "One World Trade Center",
      "location": "New York, USA",
      "year_built": 2014,
      "floors": 104,
      "area_sqm": 325000.0,
      "building_type": "Commercial",
      "has_parking": true,
      "architect": "David Childs",
      "elevation": 541.3,
      "description":
          "The One World Trade Center stands as a symbol of resilience and hope after the 9/11 tragedy, and is now the tallest building in the Western Hemisphere.",
      "facilities": [
        "Offices",
        "Observation Deck",
        "Retail Spaces",
        "Memorial Museum"
      ]
    },
    {
      "id": "c8b3e74b-9fa6-4bb1-907d-b35c39e9d0f6",
      "name": "Chrysler Building",
      "location": "New York, USA",
      "year_built": 1930,
      "floors": 77,
      "area_sqm": 80000.0,
      "building_type": "Commercial",
      "has_parking": true,
      "architect": "William Van Alen",
      "elevation": 319.0,
      "description":
          "A masterpiece of Art Deco architecture, the Chrysler Building remains one of the most iconic skyscrapers in New York City.",
      "facilities": ["Offices", "Observation Deck", "Retail"]
    },
    {
      "id": "d1a3f3ff-1116-4539-87f7-74c2a364fa1c",
      "name": "Montreal Biosphere",
      "location": "Montreal, Canada",
      "year_built": 1967,
      "floors": 1,
      "area_sqm": 9500.0,
      "building_type": "Museum",
      "has_parking": true,
      "architect": "Buckminster Fuller",
      "elevation": 35.0,
      "description":
          "A geodesic dome and environmental museum located in Montreal, Canada, the Biosphere focuses on environmental conservation and sustainability.",
      "facilities": [
        "Exhibitions",
        "Event Space",
        "Educational Programs",
        "Gift Shop"
      ]
    },
    {
      "id": "f2c29a87-e268-4934-bbe5-09e00c8c8235",
      "name": "Colosseum",
      "location": "Rome, Italy",
      "year_built": 80,
      "floors": 4,
      "area_sqm": 24000.0,
      "building_type": "Ancient Monument",
      "has_parking": false,
      "architect": "Unknown",
      "elevation": 48.0,
      "description":
          "An ancient amphitheater in Rome, the Colosseum is one of the greatest works of Roman architecture and engineering.",
      "facilities": ["Arena", "Museums", "Visitor Center", "Exhibition Rooms"]
    },
    {
      "id": "edc1f78e-2e12-4d2a-9ed5-75fa9cf207e6",
      "name": "Sagrada Familia",
      "location": "Barcelona, Spain",
      "year_built": 1882,
      "floors": 8,
      "area_sqm": 12000.0,
      "building_type": "Church",
      "has_parking": false,
      "architect": "Antoni Gaudí",
      "elevation": 170.0,
      "description":
          "The Sagrada Familia is a large unfinished basilica, one of the most famous works of architect Antoni Gaudí, with intricate designs and unique architectural style.",
      "facilities": ["Church", "Museum", "Crypt", "Tower"]
    },
    {
      "id": "92bcd6b9-b1b2-4c92-89f4-72681b1b6c3e",
      "name": "Machu Picchu",
      "location": "Cusco Region, Peru",
      "year_built": 1450,
      "floors": 3,
      "area_sqm": 132.0,
      "building_type": "Ancient Incan City",
      "has_parking": false,
      "architect": "Unknown",
      "elevation": 2430.0,
      "description":
          "An ancient Incan city set high in the Andes Mountains, Machu Picchu is one of the most iconic archaeological sites in the world.",
      "facilities": ["Temple of the Sun", "Royal Tomb", "Intihuatana Stone"]
    },
    {
      "id": "db1d7da1-9893-4578-b72f-b519ef165601",
      "name": "Notre-Dame Cathedral",
      "location": "Paris, France",
      "year_built": 1163,
      "floors": 3,
      "area_sqm": 5000.0,
      "building_type": "Cathedral",
      "has_parking": false,
      "architect": "Maurice de Sully",
      "elevation": 69.0,
      "description":
          "A masterpiece of French Gothic architecture, Notre-Dame de Paris is one of the most visited and recognized cathedrals in the world.",
      "facilities": ["Cathedral", "Crypt", "Museum", "Exhibition Rooms"]
    },
    {
      "id": "b9a218f5-95b3-4d82-a9ac-ec6982ea3ff4",
      "name": "The Louvre",
      "location": "Paris, France",
      "year_built": 1793,
      "floors": 4,
      "area_sqm": 728000.0,
      "building_type": "Museum",
      "has_parking": true,
      "architect": "Pierre Lescot",
      "elevation": 35.0,
      "description":
          "The Louvre is the world's largest and most visited art museum, home to thousands of works including the Mona Lisa and the Venus de Milo.",
      "facilities": [
        "Art Exhibitions",
        "Libraries",
        "Restaurants",
        "Gift Shops",
        "Theater"
      ]
    },
    {
      "id": "af0cdb95-105b-40fc-922b-0bc8c639df66",
      "name": "Palace of Westminster",
      "location": "London, UK",
      "year_built": 1016,
      "floors": 5,
      "area_sqm": 70000.0,
      "building_type": "Government",
      "has_parking": true,
      "architect": "Charles Barry",
      "elevation": 98.0,
      "description":
          "The Palace of Westminster, also known as the Houses of Parliament, is the seat of the UK Parliament and a symbol of British democracy.",
      "facilities": [
        "Parliament Chambers",
        "Big Ben",
        "Public Galleries",
        "Cafes"
      ]
    },
    {
      "id": "725c4049-8d8a-4e6b-b07a-404cba460a9e",
      "name": "Alhambra",
      "location": "Granada, Spain",
      "year_built": 1238,
      "floors": 3,
      "area_sqm": 142000.0,
      "building_type": "Palace and Fortress",
      "has_parking": true,
      "architect": "Nasrid Dynasty",
      "elevation": 700.0,
      "description":
          "The Alhambra is a palace and fortress complex in Granada, renowned for its stunning Islamic architecture and beautiful gardens.",
      "facilities": ["Palace", "Gardens", "Museum", "Courtyards"]
    },
    {
      "id": "89ed1b29-51d7-45f2-9ff9-e020dbb349fd",
      "name": "Neuschwanstein Castle",
      "location": "Bavaria, Germany",
      "year_built": 1869,
      "floors": 6,
      "area_sqm": 6000.0,
      "building_type": "Castle",
      "has_parking": true,
      "architect": "Eduard Riedel",
      "elevation": 965.0,
      "description":
          "Neuschwanstein Castle is a fairytale-like castle built on a hill, and one of the most visited tourist attractions in Germany.",
      "facilities": ["Museum", "Castle Tour", "Gift Shop", "Cafes"]
    },
    {
      "id": "bc71d1cc-73c3-41a2-bba3-3b9b87d25bc4",
      "name": "Taj Mahal",
      "location": "Agra, India",
      "year_built": 1653,
      "floors": 2,
      "area_sqm": 17000.0,
      "building_type": "Mausoleum",
      "has_parking": true,
      "architect": "Ustad Ahmad Lahauri",
      "elevation": 73.0,
      "description":
          "The Taj Mahal is an ivory-white marble mausoleum and one of the most famous buildings in the world, symbolizing love and beauty.",
      "facilities": ["Mausoleum", "Gardens", "Museum", "Visitor Center"]
    }
  ];
}
