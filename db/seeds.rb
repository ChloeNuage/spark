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
  email: "shelter@admin.com",
  password: "admin123",
  name: "Jean",
  age: 45,
  gender: "Homme",
  lifestyle: "actif",
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
  description: "Je suis un homme de 45 ans, j'habite à Cugnaux. J'ai un lapin. J'aime me promener dans le parc de la Ramée.",
  can_adopt_dog: nil,
  can_adopt_cat: nil,
  can_adopt_nac: nil,
  shelter_id: Shelter.first.id
)

file = URI.open('app/assets/images/Homme_shelter.jpg')
user_1.photo.attach(io: file, filename: "Homme_shelter.jpg", content_type: "image/jpeg")
user_1.save

user_2 = User.create!(
  email: "etienne@spark.com",
  password: "admin123",
  name: "Etienne",
  age: 25,
  gender: "Homme",
  lifestyle: "actif",
  remote_work: false,
  address: "Saint-Cyprien, Toulouse",
  has_green_space: true,
  household_size: 2,
  time_for_pet: 2,
  daily_walk: true,
  pet_budget: 1000,
  have_children: false,
  have_cat: false,
  have_dog: false,
  have_other_pet: false,
  description: "Je suis un homme de 25 ans, j'habite à Saint-Cyprien. Bientôt marié, j'aimerai adopter un petit compagnon. J'aime me promener à la Prairie des Filtres. J'ai un appartement de 40m2.",
  can_adopt_dog: nil,
  can_adopt_cat: nil,
  can_adopt_nac: nil,
)

file = URI.open('app/assets/images/Etienne.jpg')
user_2.photo.attach(io: file, filename: "Etienne.JPG", content_type: "image/jpeg")
user_2.save


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

american_staffordshire_terrier = Specie.create!(
  name: "American Staffordshire Terrier",
  description: "L'American Staffordshire Terrier est un chien de taille moyenne à grande, très joueur et sociable"
)

epagneul_breton = Specie.create!(
  name: "Epagneul breton",
  description: "L'épagneul breton est un chien de taille moyenne, très joueur et sociable"
)


# Race de chat
européen = Specie.create!(
  name: "Européen",
  description: "Le chat européen est un chat de taille moyenne, indépendant et calme"
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

lapin = Specie.create!(
  name: "Lapin",
  description: "Le lapin est un petit mammifère joueur et sociable"
)

rat = Specie.create!(
  name: "Rat",
  description: "Le rat est un petit rongeur joueur et sociable"
)

furet = Specie.create!(
  name: "Furet",
  description: "Le furet est un petit mammifère joueur et sociable"
)

tortue = Specie.create!(
  name: "Tortue",
  description: "La tortue est un reptile de petite taille/moyenne"
)

gecko = Specie.create!(
  name: "Gecko",
  description: "Le gecko est un reptile de petite taille"
)

puts "#{Specie.count} species created !"


def transform_and_upload(url, public_id, pet)
  uploaded_file = Cloudinary::Uploader.upload(
    Rails.root.join(url).to_s,
    public_id: public_id,
    transformation: [
      { height: "668", width: "340", crop: "fill", gravity: "auto" }
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
  specie: européen,
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
transform_and_upload("app/assets/images/tortank.jpg", "Tortank_2", pet_6)
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
transform_and_upload("app/assets/images/labrador.png", "Rex", pet_7)
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

pet_11 = Pet.create!(
  category: "Chat",
  specie: siamois,
  age: 20,
  name: "Bulle",
  description: "Bulle est un chat calme et indépendant",
  gender: "female",
  ok_cat: true,
  ok_dog: false,
  ok_kid: true,
  affectionate: true,
  behavior: "calme",
  size: "petit",
  needs: "entretien faible",
  environment: "appartement, maison",
  shelter_id: Shelter.second.id,
)
transform_and_upload("app/assets/images/bulle_1.jpg", "Bulle_1", pet_11)
transform_and_upload("app/assets/images/bulle_2.jpg", "Bulle_2", pet_11)
pet_11.save

pet_12 = Pet.create!(
  category: "Chat",
  specie: européen,
  age: 14,
  name: "Chipsou",
  description: "Chipsou est un chat calme et indépendant",
  gender: "male",
  ok_cat: false,
  ok_dog: false,
  ok_kid: false,
  affectionate: true,
  behavior: "joueur, sociable",
  size: "moyen",
  needs: "entretien faible",
  environment: "maison",
  shelter_id: Shelter.first.id,
)

transform_and_upload("app/assets/images/chipsou_1.JPG", "Chispou_1", pet_12)
transform_and_upload("app/assets/images/chipsou_2.JPG", "Chispou_2", pet_12)
transform_and_upload("app/assets/images/chipsou_3.JPG", "Chispou_3", pet_12)
pet_12.save

pet_13 = Pet.create!(
  category: "Chien",
  specie: american_staffordshire_terrier,
  age: 3,
  name: "Gaia",
  description: "Gaia est un chien joueur et sociable",
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
transform_and_upload("app/assets/images/Gaia_1.jpeg", "Gaia_1", pet_13)
transform_and_upload("app/assets/images/Gaia_2.jpeg", "Gaia_2", pet_13)
transform_and_upload("app/assets/images/Gaia_3.jpeg", "Gaia_3", pet_13)
pet_13.save

pet_14 = Pet.create!(
  category: "Chien",
  specie: epagneul_breton,
  age: 5,
  name: "Moustik",
  description: "Moustik est un chien joueur et sociable",
  gender: "male",
  ok_cat: true,
  ok_dog: true,
  ok_kid: true,
  affectionate: true,
  behavior: "joueur, sociable",
  size: "moyen",
  needs: "entretien élevé, exercice requis",
  environment: "maison",
  shelter_id: Shelter.second.id,
)
transform_and_upload("app/assets/images/Moustik.jpg", "Moustik_1", pet_14)
transform_and_upload("app/assets/images/Moustik_2.jpg", "Moustik_2", pet_14)
pet_14.save

pet_15 = Pet.create!(
  category: "Chien",
  specie: golden_retriever,
  age: 1,
  name: "Umy",
  description: "Un rayon de soleil pour définir Umy, douce et joyeuse, cet adorable boule de poils convient à un rythme de vie mobile sans excés, (Umy = océan en japonais) en chien d'eau:  elle vous accompagnera lors de vos baignades et vous ramenera sur le rivage en vous tractant la main en cas de fatigue... Attention à votre environnement c'est un vrai aspirateur !!",
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
transform_and_upload("app/assets/images/Umy.jpg", "Umy_1", pet_15)
transform_and_upload("app/assets/images/Umy_2.jpg", "Umy_2", pet_15)
transform_and_upload("app/assets/images/Umy_3.jpg", "Umy_3", pet_15)
pet_15.save

pet_16 = Pet.create!(
  category: "NAC",
  specie: lapin,
  age: 2,
  name: "Bugs Bunny",
  description: "Bugs Bunny est un lapin joueur et sociable",
  gender: "male",
  ok_cat: false,
  ok_dog: true,
  ok_kid: true,
  affectionate: false,
  behavior: "joueur, sociable",
  size: "moyen",
  needs: "entretien élévé, exercice requis",
  environment: "appartement, maison",
  shelter_id: Shelter.third.id,
)
transform_and_upload("app/assets/images/Lapin.jpg", "Lapin", pet_16)
pet_16.save


pet_17 = Pet.create!(
  category: "NAC",
  specie: rat,
  age: 1,
  name: "Michel Souris",
  description: "Michel Souris est un rat joueur et sociable",
  gender: "male",
  ok_cat: false,
  ok_dog: false,
  ok_kid: true,
  affectionate: false,
  behavior: "joueur, sociable",
  size: "petit",
  needs: "entretien faible",
  environment: "appartement, maison",
  shelter_id: Shelter.second.id,
)
transform_and_upload("app/assets/images/Michel.JPG", "Rat", pet_17)
transform_and_upload("app/assets/images/MichelSouris.JPG", "Rat_1", pet_17)
pet_17.save

pet_18 = Pet.create!(
  category: "NAC",
  specie: furet,
  age: 3,
  name: "Fufu",
  description: "Fufu est un furet joueur et sociable",
  gender: "female",
  ok_cat: false,
  ok_dog: true,
  ok_kid: true,
  affectionate: true,
  behavior: "indépendant, joueur",
  size: "moyen",
  needs: "exercice requis",
  environment: "appartement, maison",
  shelter_id: Shelter.third.id,
)
transform_and_upload("app/assets/images/furet_1.jpg", "Furet", pet_18)
pet_18.save

pet_19 = Pet.create!(
  category: "NAC",
  specie: tortue,
  age: 12,
  name: "Donatello",
  description: "Donatello est une tortue calme et indépendante",
  gender: "male",
  ok_cat: true,
  ok_dog: true,
  ok_kid: true,
  affectionate: false,
  behavior: "calme",
  size: "moyen",
  needs: "entretien faible",
  environment: "maison",
  shelter_id: Shelter.first.id,
)
transform_and_upload("app/assets/images/tortue_4.jpg", "Tortue", pet_19)
pet_19.save

pet_20 = Pet.create!(
  category: "NAC",
  specie: gecko,
  age: 5,
  name: "Léon",
  description: "Léon est un gecko calme et indépendant",
  gender: "male",
  ok_cat: true,
  ok_dog: true,
  ok_kid: false,
  affectionate: false,
  behavior: "indépendant, calme",
  size: "petit",
  needs: "entretien faible",
  environment: "appartement, maison",
  shelter_id: Shelter.second.id,
)
transform_and_upload("app/assets/images/gecko.jpg", "Gecko", pet_20)
pet_20.save

puts "#{Pet.count} pets created !"
