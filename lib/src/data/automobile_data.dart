/// A data class that provides predefined automobile mock data.
///
/// This class contains static JSON data representing a collection of automobiles
/// with various properties such as make, model, year, and specifications.
/// The data is used by [AutomobileProvider] to populate its cache without
/// requiring any external API calls.
class AutomobileData {
  /// Raw JSON data containing automobile information.
  static const json = [
    {
      "id": "f4e9c1b8-2040-4d93-9a45-c4c5eaa09f3a",
      "make": "Tesla",
      "model": "Model S",
      "year": 2023,
      "fuel_type": "Electric",
      "is_eco_friendly": true,
      "horsepower": 1020,
      "mileage": 370.5,
      "rating": 4.9,
      "short_description": "A high-performance electric sedan.",
      "description":
          "The Tesla Model S is a luxury electric vehicle offering exceptional performance, an impressive range of over 370 miles, and advanced autonomous driving features.",
      "features": [
        "Autopilot",
        "Ludicrous Mode",
        "Panoramic Glass Roof",
        "Premium Connectivity",
        "Full Self-Driving Capability"
      ]
    },
    {
      "id": "24b3a7e9-1e65-4f68-8133-c2631dfb3642",
      "make": "Ford",
      "model": "F-150",
      "year": 2022,
      "fuel_type": "Gasoline",
      "is_eco_friendly": false,
      "horsepower": 400,
      "mileage": 24.0,
      "rating": 4.5,
      "short_description": "A powerful and durable pickup truck.",
      "description":
          "The Ford F-150 is a rugged pickup truck built for strength and durability, making it ideal for work or recreation. It combines power with modern technology, offering both comfort and utility.",
      "features": [
        "Tow Package",
        "SYNC 4 Infotainment",
        "Co-Pilot360",
        "Heavy-Duty Payload",
        "Off-Road Capability"
      ]
    },
    {
      "id": "b9c0d42e-2563-41b1-b728-1d1f12d28c8d",
      "make": "BMW",
      "model": "X5",
      "year": 2023,
      "fuel_type": "Diesel",
      "is_eco_friendly": false,
      "horsepower": 335,
      "mileage": 28.5,
      "rating": 4.8,
      "short_description": "Luxury and performance in an SUV.",
      "description":
          "The BMW X5 combines the best of both worlds: the luxurious features of a high-end sedan and the rugged capability of an SUV. It's designed for both comfort and performance, featuring a refined diesel engine.",
      "features": [
        "xDrive All-Wheel Drive",
        "Premium Interior",
        "Adaptive Suspension",
        "iDrive 7.0 System",
        "Panoramic Sunroof"
      ]
    },
    {
      "id": "de11cd94-6c48-4d5d-a11c-b3b11a7070f5",
      "make": "Toyota",
      "model": "Corolla",
      "year": 2022,
      "fuel_type": "Hybrid",
      "is_eco_friendly": true,
      "horsepower": 121,
      "mileage": 53.0,
      "rating": 4.7,
      "short_description": "A compact hybrid with excellent fuel efficiency.",
      "description":
          "The Toyota Corolla Hybrid offers outstanding fuel efficiency, reliability, and an affordable price point. It's the perfect choice for eco-conscious drivers looking for a compact sedan with impressive mileage.",
      "features": [
        "Toyota Safety Sense",
        "Apple CarPlay",
        "LED Headlights",
        "Smart Key System",
        "Backup Camera"
      ]
    },
    {
      "id": "c86c9d2f-4693-45a5-9c0f-b6935be85d95",
      "make": "Audi",
      "model": "A6",
      "year": 2021,
      "fuel_type": "Gasoline",
      "is_eco_friendly": false,
      "horsepower": 335,
      "mileage": 32.0,
      "rating": 4.6,
      "short_description": "A luxury sedan with advanced technology.",
      "description":
          "The Audi A6 combines refined luxury with cutting-edge technology. From its advanced safety features to its sleek design, the A6 offers a premium driving experience.",
      "features": [
        "Quattro All-Wheel Drive",
        "Virtual Cockpit",
        "MMI Navigation Plus",
        "Adaptive Cruise Control",
        "Bang & Olufsen Sound System"
      ]
    },
    {
      "id": "66c62ae2-54c9-44de-b8fa-fb8a69f47f5a",
      "make": "Honda",
      "model": "Civic",
      "year": 2023,
      "fuel_type": "Gasoline",
      "is_eco_friendly": true,
      "horsepower": 158,
      "mileage": 36.0,
      "rating": 4.4,
      "short_description": "A reliable and efficient compact car.",
      "description":
          "The Honda Civic continues to be one of the best-selling compact cars, offering great reliability, impressive fuel economy, and modern features that cater to everyday driving needs.",
      "features": [
        "Honda Sensing Safety Suite",
        "Android Auto",
        "Apple CarPlay",
        "Lane Keeping Assist",
        "LED Headlights"
      ]
    },
    {
      "id": "7f1c93a2-7e7a-4fa6-bc6c-c3d8832f1c27",
      "make": "Chevrolet",
      "model": "Bolt EV",
      "year": 2023,
      "fuel_type": "Electric",
      "is_eco_friendly": true,
      "horsepower": 200,
      "mileage": 259.0,
      "rating": 4.7,
      "short_description": "An affordable electric car with great range.",
      "description":
          "The Chevrolet Bolt EV is an affordable electric car that offers a solid range of 259 miles on a single charge. It's designed for those who want an eco-friendly car without breaking the bank.",
      "features": [
        "DC Fast Charging",
        "10.2-inch Touchscreen",
        "Advanced Safety Features",
        "Chevrolet Infotainment",
        "Rear Vision Camera"
      ]
    },
    {
      "id": "fd7b82b4-7bcd-46a6-a404-d95b878f5be5",
      "make": "Mercedes-Benz",
      "model": "E-Class",
      "year": 2022,
      "fuel_type": "Diesel",
      "is_eco_friendly": false,
      "horsepower": 255,
      "mileage": 30.0,
      "rating": 4.8,
      "short_description": "A premium sedan with a focus on comfort.",
      "description":
          "The Mercedes-Benz E-Class sedan offers a luxurious ride with superior comfort, advanced technology, and powerful performance. It's the perfect choice for those who demand the best in class.",
      "features": [
        "MBUX Infotainment",
        "Active Brake Assist",
        "Air Balance Cabin Air Filtration",
        "Panoramic Sunroof",
        "COMAND Navigation System"
      ]
    },
    {
      "id": "85a0f59f-6517-4016-9a4c-78e0cd3885ac",
      "make": "Volkswagen",
      "model": "ID.4",
      "year": 2023,
      "fuel_type": "Electric",
      "is_eco_friendly": true,
      "horsepower": 201,
      "mileage": 250.0,
      "rating": 4.6,
      "short_description": "Volkswagen's electric SUV with a modern twist.",
      "description":
          "The Volkswagen ID.4 is an all-electric SUV offering a combination of eco-friendliness and practicality. With over 250 miles of range, it's a versatile EV suitable for a variety of lifestyles.",
      "features": [
        "ID.Light System",
        "Smart Charging",
        "Panoramic Glass Roof",
        "App-Connect",
        "Driver Assistance Systems"
      ]
    },
    {
      "id": "6cd30238-5cc7-42e9-bb64-226f1b8964b4",
      "make": "Hyundai",
      "model": "Santa Fe",
      "year": 2023,
      "fuel_type": "Hybrid",
      "is_eco_friendly": true,
      "horsepower": 225,
      "mileage": 35.0,
      "rating": 4.5,
      "short_description": "A spacious hybrid SUV for families.",
      "description":
          "The Hyundai Santa Fe Hybrid is a spacious and versatile SUV, offering ample room for families and excellent fuel efficiency. It blends hybrid technology with comfort and safety.",
      "features": [
        "H-TRAC All-Wheel Drive",
        "Forward Collision-Avoidance",
        "Apple CarPlay",
        "Wireless Charging",
        "SiriusXM Radio"
      ]
    },
    {
      "id": "9f3be0b8-444e-4653-b5ff-76b1a11d50b4",
      "make": "Jaguar",
      "model": "F-Pace",
      "year": 2023,
      "fuel_type": "Gasoline",
      "is_eco_friendly": false,
      "horsepower": 246,
      "mileage": 23.0,
      "rating": 4.7,
      "short_description": "A stylish and dynamic luxury SUV.",
      "description":
          "The Jaguar F-Pace is a luxurious SUV that combines sporty performance with sleek design. With a powerful engine and a comfortable cabin, it's a perfect vehicle for those seeking both style and substance.",
      "features": [
        "All-Wheel Drive",
        "InControl Touch Pro",
        "Adaptive Dynamics",
        "Panoramic Roof",
        "Wireless Charging"
      ]
    },
    {
      "id": "b6fa6d9f-9bbd-47fc-8610-795e5074ad11",
      "make": "Nissan",
      "model": "Altima",
      "year": 2023,
      "fuel_type": "Gasoline",
      "is_eco_friendly": false,
      "horsepower": 188,
      "mileage": 32.0,
      "rating": 4.5,
      "short_description": "A reliable midsize sedan with great fuel economy.",
      "description":
          "The Nissan Altima offers a perfect balance of performance and comfort. With great fuel economy and a smooth driving experience, it's a great choice for those looking for a dependable and efficient sedan.",
      "features": [
        "ProPILOT Assist",
        "Apple CarPlay",
        "LED Headlights",
        "Zero Gravity Seats",
        "Rear Cross Traffic Alert"
      ]
    },
    {
      "id": "bc3e67a4-1d0d-4329-b8cd-8f5b2541a1e7",
      "make": "Subaru",
      "model": "Outback",
      "year": 2023,
      "fuel_type": "Gasoline",
      "is_eco_friendly": true,
      "horsepower": 182,
      "mileage": 33.0,
      "rating": 4.6,
      "short_description": "A rugged SUV for adventure seekers.",
      "description":
          "The Subaru Outback is a versatile crossover that offers both off-road capabilities and comfort for daily driving. With all-wheel drive and great fuel efficiency, it's perfect for those who like to explore both on and off the road.",
      "features": [
        "Symmetrical All-Wheel Drive",
        "EyeSight Driver Assist",
        "Starlink Multimedia",
        "Heated Seats",
        "X-Mode for Off-Road"
      ]
    },
    {
      "id": "f5a728c7-f9d5-4f0b-8e71-153d4d08c519",
      "make": "Porsche",
      "model": "911",
      "year": 2023,
      "fuel_type": "Gasoline",
      "is_eco_friendly": false,
      "horsepower": 379,
      "mileage": 20.0,
      "rating": 4.9,
      "short_description": "An iconic sports car with exceptional performance.",
      "description":
          "The Porsche 911 is the ultimate sports car, known for its legendary performance and sleek design. With a potent engine and precise handling, the 911 offers an unmatched driving experience.",
      "features": [
        "Rear-Wheel Drive",
        "Porsche Communication Management",
        "Bose Surround Sound",
        "Adaptive Cruise Control",
        "Sport Chrono Package"
      ]
    },
    {
      "id": "b1432eb2-4f4c-4485-bd5e-4452f21485da",
      "make": "Mazda",
      "model": "CX-5",
      "year": 2023,
      "fuel_type": "Gasoline",
      "is_eco_friendly": false,
      "horsepower": 187,
      "mileage": 28.0,
      "rating": 4.7,
      "short_description": "A compact crossover with refined styling.",
      "description":
          "The Mazda CX-5 is a compact crossover that delivers a stylish and refined driving experience. It offers impressive fuel economy, responsive handling, and a luxurious interior in a compact package.",
      "features": [
        "i-ACTIV All-Wheel Drive",
        "Apple CarPlay",
        "Bose Sound System",
        "Active Driving Display",
        "Rearview Camera"
      ]
    },
    {
      "id": "f3c73822-1f5d-4e74-9ea9-df0b31260fa0",
      "make": "Chrysler",
      "model": "Pacifica",
      "year": 2023,
      "fuel_type": "Hybrid",
      "is_eco_friendly": true,
      "horsepower": 260,
      "mileage": 82.0,
      "rating": 4.8,
      "short_description": "A spacious and eco-friendly family minivan.",
      "description":
          "The Chrysler Pacifica Hybrid combines the practicality of a minivan with the efficiency of hybrid technology. Perfect for families, it offers seating for up to eight and great fuel economy.",
      "features": [
        "Uconnect Theater",
        "Stow 'n Go Seating",
        "Adaptive Cruise Control",
        "Rear Park Assist",
        "Panoramic Sunroof"
      ]
    },
    {
      "id": "3c828cb9-898e-45cf-9cf7-c3b8253437bb",
      "make": "Volvo",
      "model": "XC90",
      "year": 2023,
      "fuel_type": "Hybrid",
      "is_eco_friendly": true,
      "horsepower": 400,
      "mileage": 28.0,
      "rating": 4.7,
      "short_description": "A luxury hybrid SUV with family-friendly features.",
      "description":
          "The Volvo XC90 is a luxury hybrid SUV that offers an elegant design and powerful performance. With its spacious three-row seating and advanced safety features, it's an ideal choice for families.",
      "features": [
        "Pilot Assist",
        "Sensus Connect",
        "Panoramic Roof",
        "Adaptive LED Headlights",
        "Bowers & Wilkins Sound System"
      ]
    },
    {
      "id": "e6a5a32c-0a7b-4b3a-85a2-c62d5379b204",
      "make": "Lexus",
      "model": "RX 350",
      "year": 2023,
      "fuel_type": "Gasoline",
      "is_eco_friendly": false,
      "horsepower": 295,
      "mileage": 22.0,
      "rating": 4.6,
      "short_description": "A refined and spacious luxury SUV.",
      "description":
          "The Lexus RX 350 blends luxury and performance in a spacious SUV. With a smooth ride, upscale interior, and a wealth of tech features, it’s a perfect choice for those who want a premium experience.",
      "features": [
        "Lexus Safety System+",
        "Apple CarPlay",
        "Mark Levinson Audio",
        "Heated and Ventilated Seats",
        "Navigation System"
      ]
    },
    {
      "id": "a0634a5a-2e4a-4ecb-bc44-1b5d7052f9d4",
      "make": "Kia",
      "model": "Telluride",
      "year": 2023,
      "fuel_type": "Gasoline",
      "is_eco_friendly": false,
      "horsepower": 291,
      "mileage": 26.0,
      "rating": 4.8,
      "short_description": "A spacious and tech-savvy 3-row SUV.",
      "description":
          "The Kia Telluride is a 3-row SUV that offers a spacious interior, advanced technology, and a smooth, comfortable ride. With ample cargo space and a host of tech features, it's ideal for families.",
      "features": [
        "Apple CarPlay",
        "Android Auto",
        "Smart Cruise Control",
        "Heated Steering Wheel",
        "Panoramic Sunroof"
      ]
    },
    {
      "id": "7d1b617e-cf67-45e6-9c70-529c9ad17f8b",
      "make": "Land Rover",
      "model": "Range Rover Sport",
      "year": 2023,
      "fuel_type": "Gasoline",
      "is_eco_friendly": false,
      "horsepower": 355,
      "mileage": 19.0,
      "rating": 4.9,
      "short_description": "A luxury SUV with off-road capability.",
      "description":
          "The Range Rover Sport combines luxury with rugged off-road capability. It offers an upscale interior, powerful engines, and advanced technology to ensure both comfort and performance, on or off the road.",
      "features": [
        "Terrain Response 2",
        "InControl Touch Pro",
        "Adaptive Cruise Control",
        "Surround Camera System",
        "Lane Keep Assist"
      ]
    }
  ];
}
