class MockDataService {
  static List<Map<String, dynamic>> getRecipes() {
    return [
      {
        'name': 'Classic Greek Salad',
        'imageUrl': 'assets/images/greek-salad.png',
        'time': 15,
        'rating': 4.5,
      },
      {
        'name': 'Crunchy Nut Coleslaw',
        'imageUrl': 'assets/images/crunchy-nut.png',
        'time': 10,
        'rating': 3.5,
      },
      {
        'name': 'Shrimp Chicken Andouille Sausage Jambalaya',
        'imageUrl': 'assets/images/shrimp-chicken.png',
        'time': 10,
        'rating': 3.0,
      },
      {
        'name': 'Barbecue Chicken Jollof Rice',
        'imageUrl': 'assets/images/barbecue-chicken.png',
        'time': 10,
        'rating': 4.5,
      },
      {
        'name': 'Portuguese Piri Piri Chicken',
        'imageUrl': 'assets/images/piri-piri-chicken.png',
        'time': 10,
        'rating': 4.5,
      },
    ];
  }

  static List<Map<String, dynamic>> getNewRecipes() {
  return [
    {
      'name': 'Steak with tomato sauce and bulgur rice.',
      'imageUrl': 'assets/images/steak.png',
      'authorPicture': 'assets/images/james.jpg',
      'authorFullname': 'James Milner',
      'rating': 5.0,
      'time': 20,
    },
    {
      'name': 'Pilaf sweet with lamb-and-raisins.',
      'imageUrl': 'assets/images/pilaf.png',
      'authorPicture': 'assets/images/laura.png',
      'authorFullname': 'Laura wilson',
      'rating': 5.0,
      'time': 20,
    },
    {
      'name': 'Rice Pilaf, Broccoli and Chicken.',
      'imageUrl': 'assets/images/rice-pilaf.png',
      'authorPicture': 'assets/images/lucas.jpg',
      'authorFullname': 'Lucas Moura',
      'rating': 5.0,
      'time': 20,
    },
    {
      'name': 'Chicken meal with sauce.',
      'imageUrl': 'assets/images/chicken-meal.png',
      'authorPicture': 'assets/images/issabella.jpg',
      'authorFullname': 'Issabella Ethan',
      'rating': 5.0,
      'time': 20,
    },
    {
      'name': 'Stir-fry chicken with broccoli in sweet and sour sauce and rice.',
      'imageUrl': 'assets/images/stir-fry-chicken.png',
      'authorPicture': 'assets/images/miquel.png',
      'authorFullname': 'Miquel Ferran',
      'rating': 5.0,
      'time': 20,
    },
  ];
}

  static List<String> getCategories() {
    return [
      'All',
      'Indian',
      'Italian',
      'Asian',
      'Chinese',
      'Fruit',
      'Vegetables',
      'Protein',
      'Cereal',
      'Local Dishes',
    ];
  }
}
