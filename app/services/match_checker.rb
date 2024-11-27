class MatchChecker

  def initialize(user, pets)
    @user = user
    @pets = pets
  end

  def can_match
    user_available_time = @user.remote_work ? 1 : 0
    user_available_time += @user.time_for_pet
    user_available_time += @user.household_size >= 3 ? 1 : 0

    @matched_pets = []
    @pets.each do |pet|
      pet_time_needs = 0

      pet_time_needs += 1 if pet.affectionate

      if pet.behavior.gsub(" ", "").split(",").include?("actif")
        pet_time_needs += 1
      end

      pet.needs.gsub!(" ", "").split(",").each do |need|
        if need == "entretienmoyen" || need == "entretienélevé"
          pet_time_needs += 1
        end
      end

      if pet.size == "small"
        pet_time_needs += 1
      elsif pet.size == "medium" || pet.size == "large" || pet.needs
        pet_time_needs += 1
      end

      pet_time_needs = 3 if pet_time_needs > 3

      if user_available_time >= pet_time_needs
        @matched_pets << pet
      end
    end
    @matched_pets
  end

end
