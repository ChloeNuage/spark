class MatchChecker

  def initialize(user, pets)
    @user = user
    @pets = pets
  end

  def can_match
    available_time = remote_work ? 2 : 0
    raise
    available_time += pet.time_for_pet

    @pets.select do |pet|
      pet
    end
  end
end
