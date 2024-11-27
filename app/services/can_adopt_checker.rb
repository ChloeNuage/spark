class CanAdoptChecker

  def initialize(user)
    @user = user
  end

  def can_adopt_dog?
    @user.pet_budget >= 1000
    # @user.green_space
  end

  def can_adopt_cat?
    @user.pet_budget >= 700
  end

  def can_adopt_nac?
    @user.pet_budget >= 300
  end
end
