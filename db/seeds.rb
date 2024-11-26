User.delete_all
Shelter.delete_all
Pet.delete_all

user_1 = User.create!(
  email: "admin@admin.com",
  password: "admin123",
  name: "Jean",
  age: 65,
  gender: "Homme",
  lifestyle: "Sédentaire",
  remote_work: true,
  address: "Avenue de Toulouse, 31270 Cugnaux",
  green_space: "Parc, jardin privé",
  household_size: 2,
  time_for_pet: "3h",
  daily_walk: true,
  pet_budget: 300,
  have_children: true,
  have_cat: true,
  have_dog: true,
  have_other_pets: true,
  description: "Je suis un homme de 65 ans, retraité, j'habite à Cugnaux. J'ai un chat, un chien et un lapin. J'ai 2 enfants et 3 petits-enfants. J'aime me promener dans le parc de la Ramée.",
  can_adopt_dog: true,
  can_adopt_cat: true,
  can_adopt_nac: true,
)

user_2 = User.create!(
  email: "marie@marie.com",
  password: "admin123",
  name: "Marie",
  age: 30,
  gender: "Femme",
  lifestyle: "Actif",
  remote_work: false,
  address: "Saint-Cyprien, Toulouse",
  green_space: "Parc, autre",
  household_size: 1,
  time_for_pet: "1h",
  daily_walk: true,
  pet_budget: 50,
  have_children: false,
  have_cat: false,
  have_dog: false,
  have_other_pets: false,
  description: "Je suis une femme de 30 ans, j'habite à Saint-Cyprien. J'aime me promener dans le parc Raymond IV. J'ai un appartement de 40m2.",
  can_adopt_dog: false,
  can_adopt_cat: true,
  can_adopt_nac: true,
)

user_3 = User.create!(
  email: "arthurdog@dog.fr",
  password: "admin123",
  name: "Arthur",
  age: 20,
  lifestyle: "Actif",
  remote_work: false,
  address: "Rue de la République, Toulouse",
  green_space: "Parc",
  household_size: 2,
  time_for_pet: "4h",
  daily_walk: true,
  pet_budget: 100,
  shelter_id: 1,
  have_children: false,
  have_cat: true,
  have_dog: false,
  have_other_pets: false,
  description: "Je suis un étudiant de 20 ans, j'habite à Toulouse. J'ai un chat. J'ai un appartement de 30m2.",
  can_adopt_dog: false,
  can_adopt_cat: true,
  can_adopt_nac: true,
)

user_4 = User.create!(
  email: "justine@cat.fr",
  password: "admin123",
  name: "Justine",
  age: 25,
  lifestyle: "Sédentaire",
  remote_work: true,
  address: "Rue d'Encrabe, Plaisance du touch",
  green_space: "Jardin privé, parc, autre",
  household_size: 1,
  time_for_pet: "2h",
  daily_walk: true,
  pet_budget: 500,
  shelter_id: 2,
  have_children: true,
  have_cat: false,
  have_dog: true,
  have_other_pets: false,
  description: "Je suis une femme de 25 ans, j'habite à Plaisance du touch. J'ai un chien. J'ai une maison de 100m2.",
  can_adopt_dog: true,
  can_adopt_cat: false,
  can_adopt_nac: true,
)

user_5 = User.create!(
  email: "christophe@nac.com",
  password: "admin123",
  name: "Christophe",
  age: 40,
  lifestyle: "Actif",
  remote_work: false,
  address: "Rue de la République, Toulouse",
  green_space: "Parc",
  household_size: 1,
  time_for_pet: "1h",
  daily_walk: false,
  pet_budget: 25,
  have_children: true,
  have_cat: false,
  have_dog: false,
  have_nac: false,
  description: "Je suis un homme de 40 ans, j'habite à Toulouse. J'ai 2 enfants. J'ai un appartement de 50m2.",
  can_adopt_dog: false,
  can_adopt_cat: false,
  can_adopt_nac: false,
)

shelter_1 = Shelter.create!(
  name: "Fourrière SPA Toulouse",
  address: "6 Imp. Marie Laurencin 31100 Toulouse",
)

shelter_2 = Shelter.create!(
  name: "Dispensaire SPA de Toulouse",
  address: "3 Imp. de Sicile 31500 Toulouse",
)

shelter_3 = Shelter.create!(
  name: "Refuge SPA de Toulouse",
  address: "38 Chemin de la Salvetat 31300 Toulouse",
)


Comportement : Actif, calme, joueur, sociable.
Taille : Petit, moyen, grand.
Besoins : Entretien (faible ou élevé), besoins alimentaires, exercice requis.
Affection : Indépendant ou demandeur d’attention.
Environnement : Adapté à un appartement, une maison, ou à l’extérieur.
Interaction humaine : Idéal pour enfants, adultes, ou toute la famill

pet_1 = Pets.create!(
  category: "Chien",
  age: 5,
  name: "Bobby",
  description: "Bobby est un chien docile et gentil qui adore les enfants",
  gender: "male",
  ok_cat: false,
  ok_dog: true,
  ok_kid: true,
  affectionate: true,
  behaviour: "joueur, sociable",
  size: "moyen",
  needs: "entretien faible, exercice requis",
  environment: "maison",
  shelter_id: Shelter.first,
)

pet_2 = Pets.create!(
  category: "Chat",
  age: 2,
  name: "Mistigri",
  description: "Mistigri est un chat indépendant et calme",
  gender: "male",
  ok_cat: true,
  ok_dog: false,
  ok_kid: true,
  affectionate: true,
  behaviour: "calme",
  size: "petit",
  needs: "entretien faible",
  environment: "appartement",
  shelter_id: Shelter.second,
)

pet_3 = Pets.create!(
  category: "NAC",
  age: 1,
  name: "Pikachu",
  description: "Pikachu est un hamster joueur et sociable",
  gender: "male",
  ok_cat: false,
  ok_dog: true,
  ok_kid: true,
  affectionate: true,
  size: "moyen",
  needs: "entretien faible",
  environement: "appartement, maison",
  shelter_id: Shelter.third,
)

pet_4 = Pets.create!(
  category: "Chien",
  age: 3,
  name: "Lucky",
  description: "Lucky est un chien joueur et sociable",
  gender: "male",
  ok_cat: true,
  ok_dog: true,
  ok_kid: true,
  affectionate: true,
  size: "grand",
  needs: "entretien élévé, exercice requis",
  environment: "maison",
  shelter_id: Shelter.first,
)

pet_5 = Pets.create!(
  category: "Chat",
  age: 8,
  name: "Minette",
  description: "Minette est calme et indépendante",
  gender: "female",
  ok_cat: false,
  ok_dog: false,
  ok_kid: false,
  affectionate: false,
  size: "petit",
  needs: "entretien faible",
  environment: "appartement, maison",
  shelter_id: Shelter.second,
)

pet_6 = Pets.create!(
  category: "NAC",
  age: 2,
  name: "Tortank",
  description: "Tortank est un poisson rouge",
  gender: "male",
  ok_cat: false,
  ok_dog: true,
  ok_kid: true,
  affectionate: false,
  size: "grand",
  needs: "entretien faible",
  environement: "appartement, maison",
  shelter_id: Shelter.third,
)

pet_7 = Pets.create!(
  category: "Chien",
  age: 10,
  name: "Rex",
  description: "Rex est un vieux chien qui a besoin de calme et d'amour",
  gender: "male",
  ok_cat: true,
  ok_dog: false,
  ok_kid: true,
  affectionate: true,
  size: "grand",
  needs: "entretien élévé et exercice requis",
  environement: "maison",
  shelter_id: Shelter.first,
)

pet_8 = Pets.create!(
  category: "Chat",
  age: 1,
  name: "Félix",
  description: "Félix est un chaton joueur et sociable",
  gender: "Male",
  ok_cat: true,
  ok_dog: false,
  ok_kid: true,
  affectionate: true,
  size: "petit",
  needs: "entretien faible",
  environement: "appartement, maison",
  shelter_id: Shelter.second,
)

pet_9 = Pets.create!(
  category: "NAC",
  age: 10,
  name: "Snake",
  description: "Snake est un serpent",
  gender: "Female",
  ok_cat: false,
  ok_dog: true,
  ok_kid: false,
  size: "moyen",
  needs: "entretien faible",
  environement: "appartement, maison",
  shelter_id: Shelter.third,
)

pet_10 = Pets.create!(
  category: "Chien",
  age: 2,
  name: "Bella",
  description: "Bella est gentille, sociable et affectueuse, parfaite pour les enfants",
  gender: "Female",
  ok_cat: false,
  ok_dog: true,
  ok_kid: true,
  size: "grand",
  needs: "entretien élévé, exercice requis",
  shelter_id: Shelter.first,
)
