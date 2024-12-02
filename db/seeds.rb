puts "Cleaning the database..."

User.delete_all
Pet.delete_all
Specie.delete_all
Shelter.delete_all

puts "Database cleaned"

puts "Creating shelters..."

# Création des refuges
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

puts "#{Shelter.count} shelters created !"

puts "Creating users..."

# Création des utilisateurs
user_1 = User.create!(
  email: "admin@admin.com",
  password: "admin123",
  name: "Jean",
  age: 65,
  gender: "Homme",
  lifestyle: "sédentaire",
  remote_work: true,
  address: "Avenue de Toulouse, 31270 Cugnaux",
  has_green_space: true,
  household_size: 2,
  time_for_pet: 3,
  daily_walk: true,
  pet_budget: 1300,
  have_children: false,
  have_cat: false,
  have_dog: false,
  have_other_pet: true,
  description: "Je suis un homme de 65 ans, retraité, j'habite à Cugnaux. J'ai un chat, un chien et un lapin. J'ai 2 enfants et 3 petits-enfants. J'aime me promener dans le parc de la Ramée.",
  can_adopt_dog: nil,
  can_adopt_cat: nil,
  can_adopt_nac: nil,
)

user_2 = User.create!(
  email: "marie@marie.com",
  password: "admin123",
  name: "Marie",
  age: 30,
  gender: "Femme",
  lifestyle: "actif",
  remote_work: false,
  address: "Saint-Cyprien, Toulouse",
  has_green_space: true,
  household_size: 1,
  time_for_pet: 1,
  daily_walk: true,
  pet_budget: 300,
  have_children: false,
  have_cat: false,
  have_dog: false,
  have_other_pet: false,
  description: "Je suis une femme de 30 ans, j'habite à Saint-Cyprien. J'aime me promener dans le parc Raymond IV. J'ai un appartement de 40m2.",
  can_adopt_dog: nil,
  can_adopt_cat: nil,
  can_adopt_nac: nil,
)

user_3 = User.create!(
  email: "shelter@admin.fr",
  password: "admin123",
  name: "Arthur",
  age: 20,
  lifestyle: "actif",
  remote_work: false,
  address: "Rue de la République, Toulouse",
  has_green_space: true,
  household_size: 2,
  time_for_pet: 4,
  daily_walk: true,
  pet_budget: 100,
  shelter_id: Shelter.first.id,
  have_children: false,
  have_cat: true,
  have_dog: false,
  have_other_pet: false,
  description: "Je suis un étudiant de 20 ans, j'habite à Toulouse. J'ai un chat. J'ai un appartement de 30m2.",
  can_adopt_dog: nil,
  can_adopt_cat: nil,
  can_adopt_nac: nil,
)

user_4 = User.create!(
  email: "justine@cat.fr",
  password: "admin123",
  name: "Justine",
  age: 25,
  lifestyle: "sédentaire",
  remote_work: true,
  address: "Rue d'Encrabe, Plaisance du touch",
  has_green_space: true,
  household_size: 2,
  time_for_pet: 2,
  daily_walk: true,
  pet_budget: 1500,
  shelter_id: Shelter.second.id,
  have_children: true,
  have_cat: false,
  have_dog: true,
  have_other_pet: false,
  description: "Je suis une femme de 25 ans, j'habite à Plaisance du touch. J'ai un chien. J'ai une maison de 100m2.",
  can_adopt_dog: nil,
  can_adopt_cat: nil,
  can_adopt_nac: nil,
)

user_5 = User.create!(
  email: "christophe@nac.com",
  password: "admin123",
  name: "Christophe",
  age: 40,
  lifestyle: "actif",
  remote_work: false,
  address: "Rue de la République, Toulouse",
  has_green_space: true,
  household_size: 3,
  time_for_pet: 1,
  daily_walk: false,
  pet_budget: 25,
  have_children: true,
  have_cat: false,
  have_dog: false,
  have_other_pet: false,
  description: "Je suis un homme de 40 ans, j'habite à Toulouse. J'ai 2 enfants. J'ai un appartement de 50m2.",
  can_adopt_dog: nil,
  can_adopt_cat: nil,
  can_adopt_nac: nil,
)

puts "#{User.count} users created !"


puts "Creating species..."

# Race de chien
labrador = Specie.create!(
  name: "Labrador",
  description: "Le labrador est un chien de taille moyenne à grande, très sociable et affectueux. Il est très joueur et adore"
)

berger_allemand = Specie.create!(
  name: "Berger allemand",
  description: "Le berger allemand est un chien de grande taille, très joueur et sociable"
)

golden_retriever = Specie.create!(
  name: "Golden retriever",
  description: "Le golden retriever est un chien de grande taille, très sociable et affectueux"
)


# Race de chat
chat_de_goutiere = Specie.create!(
  name: "Chat de goutière",
  description: "Le chat de goutière est un chat de taille moyenne, indépendant et calme"
)

persan = Specie.create!(
  name: "Persan",
  description: "Le persan est un chat de petite taille, calme et indépendant"
)
siamois = Specie.create!(
  name: "Siamois",
  description: "Le siamois est un chat de petite taille, joueur et sociable"
)


# Race de NAC
hamster = Specie.create!(
  name: "Hamster",
  description: "Le hamster est un petit rongeur joueur et sociable"
)

poisson_rouge = Specie.create!(
  name: "Poisson rouge",
  description: "Le poisson rouge est un poisson de grande taille"
)

serpent = Specie.create!(
  name: "Serpent",
  description: "Le serpent est un reptile de taille moyenne"
)

puts "#{Specie.count} species created !"


def transform_and_upload(url, public_id, pet)
  uploaded_file = Cloudinary::Uploader.upload(
    Rails.root.join(url).to_s,
    public_id: public_id,
    transformation: [
      { height: "668", width: "315", crop: "fill", gravity: "auto" }
    ]
    )
    pet.photos.attach(
      io: URI.open(uploaded_file["secure_url"]),
      filename: 'labrador_1_transformed.jpg',
      content_type: 'image/jpg'
    )

end

puts "Creating pets..."

# Création des pets
pet_1 = Pet.create!(
  category: "Chien",
  specie: labrador,
  age: 5,
  name: "Bobby",
  description: "Bobby est un chien docile et gentil qui adore les enfants",
  gender: "male",
  ok_cat: false,
  ok_dog: true,
  ok_kid: true,
  affectionate: true,
  behavior: "joueur, sociable",
  size: "moyen",
  needs: "entretien faible, exercice requis",
  environment: "maison",
  shelter_id: Shelter.first.id,
)

transform_and_upload("app/assets/images/labrador_1.jpg", "labrador_1", pet_1)
transform_and_upload("app/assets/images/labrador_3.jpg", "labrador_2", pet_1)
transform_and_upload("app/assets/images/labrador_2.webp", "labrador_3", pet_1)
pet_1.save

pet_2 = Pet.create!(
  category: "Chat",
  specie: chat_de_goutiere,
  age: 2,
  name: "Mistigri",
  description: "Mistigri est un chat indépendant et calme",
  gender: "male",
  ok_cat: true,
  ok_dog: false,
  ok_kid: true,
  affectionate: true,
  behavior: "calme",
  size: "petit",
  needs: "entretien faible",
  environment: "appartement",
  shelter_id: Shelter.second.id,
)
transform_and_upload("app/assets/images/chat-de-gouttiere_1.jpg", "Mistigri_1", pet_2)
transform_and_upload("app/assets/images/chat-de-gouttiere_2.jpeg", "Mistigri_2", pet_2)
pet_2.save

pet_3 = Pet.create!(
  category: "NAC",
  specie: hamster,
  age: 1,
  name: "Pikachu",
  description: "Pikachu est un hamster joueur et sociable",
  gender: "male",
  ok_cat: false,
  ok_dog: true,
  ok_kid: true,
  affectionate: true,
  behavior: "calme",
  size: "moyen",
  needs: "entretien faible",
  environment: "appartement, maison",
  shelter_id: Shelter.third.id,
)
transform_and_upload("app/assets/images/hamster_1.jpg", "Pikachu_1", pet_3)
transform_and_upload("app/assets/images/hamster_2.jpg", "Pikachu_2", pet_3)
pet_3.save

pet_4 = Pet.create!(
  category: "Chien",
  specie: berger_allemand,
  age: 3,
  name: "Lucky",
  description: "Lucky est un chien joueur et sociable",
  gender: "male",
  ok_cat: true,
  ok_dog: true,
  ok_kid: true,
  affectionate: true,
  behavior: "joueur, sociable",
  size: "grand",
  needs: "entretien élevé, exercice requis",
  environment: "maison",
  shelter_id: Shelter.first.id,
)
transform_and_upload("app/assets/images/berger-allemand_1.jpg", "Lucky_1", pet_4)
transform_and_upload("app/assets/images/berger-allemand_2.jpg", "Lucky_2", pet_4)
pet_4.save

pet_5 = Pet.create!(
  category: "Chat",
  specie: persan,
  age: 8,
  name: "Minette",
  description: "Minette est calme et indépendante",
  gender: "female",
  ok_cat: false,
  ok_dog: false,
  ok_kid: false,
  affectionate: false,
  behavior: "calme, joueur",
  size: "petit",
  needs: "entretien faible",
  environment: "appartement, maison",
  shelter_id: Shelter.second.id,
)
transform_and_upload("app/assets/images/chat-persan_1.jpg", "Minette_1", pet_5)
transform_and_upload("app/assets/images/chat-persan_2.jpg", "Minette_2", pet_5)
pet_5.save

pet_6 = Pet.create!(
  category: "NAC",
  specie: poisson_rouge,
  age: 2,
  name: "Tortank",
  description: "Tortank est un poisson rouge",
  gender: "male",
  ok_cat: false,
  ok_dog: true,
  ok_kid: true,
  affectionate: false,
  behavior: "calme",
  size: "grand",
  needs: "entretien faible",
  environment: "appartement, maison",
  shelter_id: Shelter.third.id,
)
transform_and_upload("app/assets/images/poisson-rouge_1.jpg", "Tortank_1", pet_6)
pet_6.save

pet_7 = Pet.create!(
  category: "Chien",
  specie: labrador,
  age: 10,
  name: "Rex",
  description: "Rex est un vieux chien qui a besoin de calme et d'amour",
  gender: "male",
  ok_cat: true,
  ok_dog: false,
  ok_kid: true,
  affectionate: true,
  behavior: "actif, joueur",
  size: "grand",
  needs: "entretien élévé, exercice requis",
  environment: "maison",
  shelter_id: Shelter.first.id,
)
transform_and_upload("app/assets/images/labrador_noir_1.jpg", "Rex_1", pet_7)
transform_and_upload("app/assets/images/labrador_noir_2.jpg", "Rex_2", pet_7)
pet_7.save

pet_8 = Pet.create!(
  category: "Chat",
  specie: siamois,
  age: 1,
  name: "Félix",
  description: "Félix est un chaton joueur et sociable",
  gender: "male",
  ok_cat: true,
  ok_dog: false,
  ok_kid: true,
  affectionate: true,
  behavior: "sociable",
  size: "petit",
  needs: "entretien faible",
  environment: "appartement, maison",
  shelter_id: Shelter.second.id,
)
transform_and_upload("app/assets/images/chat-siamois_1.jpg", "Félix_1", pet_8)
transform_and_upload("app/assets/images/chat-siamois_2.jpg", "Félix_2", pet_8)
pet_8.save

pet_9 = Pet.create!(
  category: "NAC",
  specie: serpent,
  age: 10,
  name: "Snake",
  description: "Snake est un serpent",
  gender: "female",
  ok_cat: false,
  ok_dog: true,
  ok_kid: false,
  affectionate: false,
  behavior: "calme",
  size: "moyen",
  needs: "entretien faible",
  environment: "appartement, maison",
  shelter_id: Shelter.third.id,
)
transform_and_upload("app/assets/images/serpent_1.jpg", "Snake_1", pet_9)
transform_and_upload("app/assets/images/serpent_2.jpg", "Snake_2", pet_9)
pet_9.save

pet_10 = Pet.create!(
  category: "Chien",
  specie: golden_retriever,
  age: 2,
  name: "Bella",
  description: "Bella est gentille, sociable et affectueuse, parfaite pour les enfants",
  gender: "female",
  ok_cat: false,
  ok_dog: true,
  ok_kid: true,
  affectionate: true,
  behavior: "joueur, sociable",
  size: "grand",
  needs: "entretien élevé, exercice requis",
  environment: "maison",
  shelter_id: Shelter.first.id,
)
transform_and_upload("app/assets/images/golden_retriever_1.jpg", "Bella_1", pet_10)
transform_and_upload("app/assets/images/golden_retriever_2.webp", "Bella_2", pet_10)
pet_10.save

puts "#{Pet.count} pets created !"


# Fix : id shelter, id spacie, environment au lieu environement
#       behavior au lieu de behaviour
#       ajout des lignes manquantes
#       tout est en miniscule mise a part les noms et les catégories
