class MatchChecker

  def initialize(user, pets)
    @user = user
    @pets = pets
  end

  def can_match
    # Mise à zero de la variable pour comptabiliser le temps disponible de l'utilisateur
    user_available_time = 0
    # Calcul du temps disponible de l'utilisateur
    user_available_time += @user.remote_work ? 1 : 0
    user_available_time += @user.time_for_pet
    user_available_time += @user.household_size >= 3 ? 1 : 0

    # Initialisation du tableau pour les animaux qui correspondent aux critères
    @matched_pets = []

    # Itération sur les animaux pour les comparer aux critères de l'utilisateur
    @pets.each do |pet|
      # Mise à zero de la variable pour comptabiliser le temps de besoin pour un chien
      dog_needs_time = 0

      if pet.size == "petit"
        dog_needs_time += 0.5
      elsif pet.size == "moyen" || pet.size == "grand"
        dog_needs_time += 1
      end

      if pet.affectionate
        dog_needs_time += 0.5
      end

      if pet.behavior.gsub(" ", "").split(",").include?("actif")
        dog_needs_time += 1
      end

      pet.needs.gsub!(" ", "").split(",").each do |need|
        if need == "entretienmoyen" || need == "entretienélevé" || need == "exercicerequis"
          dog_needs_time += 0.5
        end
      end

      # Bloquer un maximum pour le besoin de temps à 2h par jour
      if dog_needs_time > 2
        dog_needs_time = 2
      end

      ## Vérification des conditions d'adoption pour les animaux
      # Si l'utilisateur a des enfants et que l'animal n'est pas ok avec les enfants, on ne peut pas le matcher
      if @user.have_children && !pet.ok_kid
        ok_kid = false
      else
        ok_kid = true
      end
      # Si l'utilisateur a un chien et que l'animal n'est pas ok avec les chiens, on ne peut pas le matcher
      if @user.have_dog && !pet.ok_dog
        ok_dog = false
      else
        ok_dog = true
      end
      # Si l'utilisateur a un chat et que l'animal n'est pas ok avec les chats, on ne peut pas le matcher
      if @user.have_cat && !pet.ok_cat
        ok_cat = false
      else
        ok_cat = true
      end
      # Test de compatibilité d'adoption
      adoption_ok = ok_kid && ok_dog && ok_cat

      ## Test des conditions pour un match
      # Le temps disponible du user est-il supérieur ou égal au temps nécessaire pour l'animal ?
      time_dog_ok = user_available_time >= dog_needs_time

      # Si le chien est en appartement, le user doit être actif et promener son animal tous les jours
      if pet.environment.gsub(" ", "").split(",").include?("appartement")
        dog_outside_needs_ok = @user.lifestyle == "actif" && @user.daily_walk
      else
        dog_outside_needs_ok = true
      end

      if pet.category == "Chien"
        # Si c'est ok pour un chien et que les besoins du chien de sortir sont ok et que c'est ok pour les enfants et que le temps est ok
        ok_conditions = adoption_ok && dog_outside_needs_ok && time_dog_ok
      else
        ok_conditions = adoption_ok
      end

      # On ajoute l'animal au tableau des animaux qui correspondent aux critères si toutes les conditions sont remplies
      if ok_conditions
        @matched_pets << pet
      end
    end
    @matched_pets
  end

end
