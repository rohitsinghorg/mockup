/// A data class that provides predefined flower mock data.
///
/// This class contains static JSON data representing a collection of flowers
/// with various properties such as scientific names, colors, and care requirements.
/// The data is used by [FlowerProvider] to populate its cache without
/// requiring any external API calls.
class FlowerData {
  /// Raw JSON data containing flower information.
  static const json = [
    {
      "common_name": "Rose",
      "scientific_name": "Rosa",
      "colors": ["Red", "White", "Pink", "Yellow", "Orange"],
      "blooming_season": "Spring to Fall",
      "symbolism": ["Love", "Passion", "Beauty"],
      "native_region": "Asia, Europe, North America",
      "fragrance": true,
      "sun_requirements": "Full Sun",
      "water_requirements": "Moderate",
      "plant_type": "Perennial",
      "price": 2.5,
      "short_description":
          "Roses are timeless symbols of love and beauty, widely cultivated for their layered petals and rich colors.",
      "description":
          "Roses, belonging to the genus Rosa, have been cultivated for thousands of years, appearing in gardens, literature, and rituals worldwide. With over 300 species and thousands of cultivars, they come in nearly every color and form. Red roses symbolize romance, while other colors represent friendship, purity, or remembrance. Most varieties thrive in full sun and require moderate watering and good air circulation to avoid fungal diseases."
    },
    {
      "common_name": "Tulip",
      "scientific_name": "Tulipa",
      "colors": ["Red", "Yellow", "Pink", "White", "Purple"],
      "blooming_season": "Spring",
      "symbolism": ["Perfect Love", "Elegance"],
      "native_region": "Central Asia, Turkey",
      "fragrance": false,
      "sun_requirements": "Full Sun",
      "water_requirements": "Low to Moderate",
      "plant_type": "Perennial",
      "price": 1.2,
      "short_description":
          "Tulips are elegant, cup-shaped flowers that bloom in vibrant colors during spring.",
      "description":
          "Tulips, native to Central Asia and Turkey, became a global phenomenon after their introduction to Europe. They prefer well-drained soil and full sun, blooming for a few weeks in early to mid-spring. Tulips are often grown from bulbs planted in the fall."
    },
    {
      "common_name": "Sunflower",
      "scientific_name": "Helianthus annuus",
      "colors": ["Yellow", "Orange", "Red"],
      "blooming_season": "Summer to Fall",
      "symbolism": ["Adoration", "Loyalty", "Longevity"],
      "native_region": "North America",
      "fragrance": false,
      "sun_requirements": "Full Sun",
      "water_requirements": "Moderate",
      "plant_type": "Annual",
      "price": 1.0,
      "short_description":
          "Sunflowers are tall, bright flowers known for their large yellow heads that follow the sun.",
      "description":
          "Sunflowers are annual plants native to North America, best known for their heliotropic behavior—young sunflowers tilt during the day to face the sun. They are cultivated for sunflower oil, edible seeds, and wildlife attraction. They require full sunlight and well-drained soil to thrive."
    },
    {
      "common_name": "Daffodil",
      "scientific_name": "Narcissus",
      "colors": ["Yellow", "White", "Orange"],
      "blooming_season": "Spring",
      "symbolism": ["New Beginnings", "Rebirth"],
      "native_region": "Europe, North Africa",
      "fragrance": true,
      "sun_requirements": "Full Sun to Partial Shade",
      "water_requirements": "Moderate",
      "plant_type": "Perennial",
      "price": 1.5,
      "short_description":
          "Daffodils are vibrant spring flowers that herald the season's arrival with their bright blooms.",
      "description":
          "Daffodils, belonging to the genus Narcissus, are among the first flowers to bloom in spring. Native to Europe and North Africa, they are often associated with renewal and new beginnings. Daffodils prefer full sun to partial shade and moderate watering."
    },
    {
      "common_name": "Lily",
      "scientific_name": "Lilium",
      "colors": ["White", "Pink", "Red", "Orange", "Yellow"],
      "blooming_season": "Spring to Summer",
      "symbolism": ["Purity", "Renewal", "Motherhood"],
      "native_region": "Northern Hemisphere (mainly Asia and Europe)",
      "fragrance": true,
      "sun_requirements": "Full Sun to Partial Shade",
      "water_requirements": "Moderate",
      "plant_type": "Perennial",
      "price": 2.0,
      "short_description":
          "Lilies are elegant flowers known for their large, fragrant blooms and diverse colors.",
      "description":
          "Lilies, from the genus Lilium, are prized for their large, fragrant flowers and are often associated with purity and renewal. They thrive in full sun to partial shade and require moderate watering."
    },
    {
      "id": "2c9d8f47",
      "common_name": "Marigold",
      "scientific_name": "Tagetes",
      "colors": ["Yellow", "Orange", "Red"],
      "blooming_season": "Summer to Fall",
      "symbolism": ["Passion", "Creativity", "Remembrance"],
      "native_region": "North and South America",
      "fragrance": true,
      "sun_requirements": "Full Sun",
      "water_requirements": "Low",
      "plant_type": "Annual",
      "price": 0.8,
      "short_description":
          "Marigolds are cheerful flowers with vibrant colors, commonly used in gardens and as companion plants.",
      "description":
          "Marigolds, belonging to the genus Tagetes, are known for their bright colors and strong fragrance. Native to the Americas, they are often used in gardens to deter pests and add vibrant color."
    },
    {
      "id": "1b6c8d4e",
      "common_name": "Lavender",
      "scientific_name": "Lavandula",
      "colors": ["Purple", "Blue", "White"],
      "blooming_season": "Summer",
      "symbolism": ["Calm", "Purity", "Devotion"],
      "native_region": "Mediterranean region",
      "fragrance": true,
      "sun_requirements": "Full Sun",
      "water_requirements": "Low",
      "plant_type": "Perennial",
      "price": 3.0,
      "short_description":
          "Lavender is a fragrant herb known for its calming properties and beautiful purple flowers.",
      "description":
          "Lavender, from the genus Lavandula, is a popular herb that thrives in hot, sunny environments. Known for its soothing fragrance, lavender is often used in aromatherapy, skincare, and as a culinary herb. It requires well-drained soil and minimal watering once established."
    },
    {
      "id": "47fc9d5e",
      "common_name": "Orchid",
      "scientific_name": "Orchidaceae",
      "colors": ["White", "Purple", "Pink", "Yellow", "Red"],
      "blooming_season": "Year-round",
      "symbolism": ["Beauty", "Luxury", "Strength"],
      "native_region": "Tropical and Subtropical regions worldwide",
      "fragrance": true,
      "sun_requirements": "Indirect Light",
      "water_requirements": "Moderate",
      "plant_type": "Perennial",
      "price": 6.0,
      "short_description":
          "Orchids are exotic, elegant flowers that symbolize beauty and luxury.",
      "description":
          "Orchids, a diverse family with over 25,000 species, are native to tropical and subtropical regions. Known for their unique shapes and vibrant colors, orchids require indirect light and well-drained soil. They bloom year-round, making them popular as ornamental plants."
    },
    {
      "id": "d50e9f91",
      "common_name": "Peony",
      "scientific_name": "Paeonia",
      "colors": ["Pink", "Red", "White", "Yellow"],
      "blooming_season": "Spring to Early Summer",
      "symbolism": ["Romance", "Wealth", "Good Fortune"],
      "native_region": "Europe, Asia, North America",
      "fragrance": true,
      "sun_requirements": "Full Sun to Partial Shade",
      "water_requirements": "Moderate",
      "plant_type": "Perennial",
      "price": 5.0,
      "short_description":
          "Peonies are known for their large, fragrant blooms, often seen in wedding bouquets.",
      "description":
          "Peonies, native to Europe, Asia, and North America, are famous for their large, fragrant flowers that come in a variety of colors. They are hardy perennials that bloom in late spring to early summer, and they thrive in full sun to partial shade."
    },
    {
      "id": "bbd27c8a",
      "common_name": "Chrysanthemum",
      "scientific_name": "Chrysanthemum morifolium",
      "colors": ["Yellow", "White", "Pink", "Purple", "Red"],
      "blooming_season": "Fall",
      "symbolism": ["Longevity", "Joy", "Fidelity"],
      "native_region": "Asia, Europe",
      "fragrance": true,
      "sun_requirements": "Full Sun",
      "water_requirements": "Moderate",
      "plant_type": "Perennial",
      "price": 2.0,
      "short_description":
          "Chrysanthemums, or mums, are vibrant flowers that bloom in the fall and symbolize longevity and joy.",
      "description":
          "Chrysanthemums, commonly known as mums, are native to Asia and Europe. Known for their vibrant colors and wide range of blooms, they are often used in fall arrangements. They thrive in full sun and require moderate watering. Chrysanthemums are often associated with longevity and are a staple in autumn gardens."
    },
    {
      "id": "7a9f1e3b",
      "common_name": "Geranium",
      "scientific_name": "Pelargonium",
      "colors": ["Red", "Pink", "White", "Purple"],
      "blooming_season": "Spring to Fall",
      "symbolism": ["Pelargonium", "Staying True"],
      "native_region": "South Africa",
      "fragrance": true,
      "sun_requirements": "Full Sun",
      "water_requirements": "Moderate",
      "plant_type": "Perennial",
      "price": 2.3,
      "short_description":
          "Geraniums are versatile plants known for their vibrant blooms and pleasant fragrance.",
      "description":
          "Geraniums, from the genus Pelargonium, are widely cultivated for their colorful, fragrant flowers. Native to South Africa, they are often grown as ornamental plants in gardens or as indoor houseplants. They thrive in full sun and well-drained soil, with moderate watering needs."
    },
    {
      "id": "c5b8f7d4",
      "common_name": "Hydrangea",
      "scientific_name": "Hydrangea macrophylla",
      "colors": ["Blue", "Pink", "Purple", "White"],
      "blooming_season": "Spring to Fall",
      "symbolism": ["Gratitude", "Grace", "Beauty"],
      "native_region": "Asia, Americas",
      "fragrance": true,
      "sun_requirements": "Partial Sun to Shade",
      "water_requirements": "High",
      "plant_type": "Deciduous Shrub",
      "price": 4.0,
      "short_description":
          "Hydrangeas are elegant, large-flowered shrubs that thrive in partial sunlight.",
      "description":
          "Hydrangeas are known for their large, showy flower heads, which bloom in shades of blue, pink, and white. These plants are native to Asia and the Americas and are often grown in gardens or as ornamental bushes. They require high water levels and partial shade for optimal growth."
    },
    {
      "id": "a8cd45a1",
      "common_name": "Zinnia",
      "scientific_name": "Zinnia elegans",
      "colors": ["Red", "Pink", "Purple", "White", "Orange"],
      "blooming_season": "Summer to Fall",
      "symbolism": ["Friendship", "Loyalty", "Affection"],
      "native_region": "North America",
      "fragrance": false,
      "sun_requirements": "Full Sun",
      "water_requirements": "Moderate",
      "plant_type": "Annual",
      "price": 1.0,
      "short_description":
          "Zinnias are colorful, hardy flowers that attract butterflies and brighten up gardens.",
      "description":
          "Zinnias are annuals known for their vibrant, daisy-like flowers in various colors. Native to North America, they are easy to grow in full sun and well-drained soil. Zinnias are a favorite for pollinators like butterflies, and they make excellent cut flowers."
    },
    {
      "id": "9e8c6f33",
      "common_name": "Poppy",
      "scientific_name": "Papaver",
      "colors": ["Red", "Orange", "Yellow", "White"],
      "blooming_season": "Spring to Early Summer",
      "symbolism": ["Remembrance", "Sleep", "Peace"],
      "native_region": "Europe, Asia, North America",
      "fragrance": true,
      "sun_requirements": "Full Sun",
      "water_requirements": "Low to Moderate",
      "plant_type": "Annual",
      "price": 1.8,
      "short_description":
          "Poppies are delicate flowers that come in a variety of colors and are often seen in remembrance ceremonies.",
      "description":
          "Poppies, from the genus Papaver, are widely known for their delicate, papery blooms. They are often associated with remembrance, especially the red poppy used in memorials for soldiers. Poppies prefer full sun and well-drained soil and are drought-tolerant once established."
    },
    {
      "id": "4f1d33b2",
      "common_name": "Crocus",
      "scientific_name": "Crocus sativus",
      "colors": ["Purple", "Yellow", "White"],
      "blooming_season": "Spring",
      "symbolism": ["Youth", "Cheerfulness", "Joy"],
      "native_region": "Europe, Asia",
      "fragrance": true,
      "sun_requirements": "Full Sun",
      "water_requirements": "Low to Moderate",
      "plant_type": "Perennial",
      "price": 2.0,
      "short_description":
          "Crocus flowers are early bloomers that bring bright color to spring gardens.",
      "description":
          "Crocus flowers are some of the first to bloom in spring, often pushing through the snow to brighten up gardens. Native to Europe and Asia, these perennials come in vibrant colors like purple, yellow, and white. They require full sun and well-drained soil, with minimal water once established."
    }
  ];
}
