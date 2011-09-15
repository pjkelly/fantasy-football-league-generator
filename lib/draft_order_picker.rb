class DraftOrderPicker
  def initialize(teams)
    @teams = teams
  end

  def pick!
    @teams.shuffle
  end
end