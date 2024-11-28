class MatchChecker

  def initialize(user, pets)
    @user = user
    @pets = pets
  end

  def can_match
    # Mise à zero de la variable pour comptabiliser le temps disponible de l'utilisateur
    user_available_time = 0
    user_available_time += @user.remote_work ? 1 : 0
    user_available_time += @user.time_for_pet
    user_available_time += @user.household_size >= 3 ? 1 : 0

    # Initialisation du tableau pour les animaux qui correspondent aux critères
    @matched_pets = []
    @pets.each do |pet|
      # Mise à zero de la variable pour comptabiliser le temps nécessaire pour chaque animal
      pet_needs_time = 0

      pet_needs_time += 1 if pet.affectionate

      if pet.behavior.gsub(" ", "").split(",").include?("actif")
        pet_needs_time += 1
      end

      pet.needs.gsub!(" ", "").split(",").each do |need|
        if need == "entretienmoyen" || need == "entretienélevé"
          pet_needs_time += 1
        end
      end

      if pet.size == "small"
        pet_needs_time += 1
      elsif pet.size == "medium" || pet.size == "large" || pet.needs
        pet_needs_time += 1
      end

      # Bloquer un maximum pour le besoin de temps à 2h par jour
      if pet_needs_time > 2
        pet_needs_time = 2
      end

      ## Test des conditions pour un match
      # Ok si le temps disponible du user est supérieur ou égal au temps nécessaire pour l'animal
      time_ok = user_available_time >= pet_needs_time
      outside_needs = pet.environment.gsub(" ", "").split(",").include?("appartement") && @user.lifestyle == "actif" && @user.daily_walk

      if time_ok &&
        @matched_pets << pet
      end
    end
    @matched_pets
  end

end
