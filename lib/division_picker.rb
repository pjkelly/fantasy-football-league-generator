class DivisionPicker
  def initialize(division_names, teams)
    @division_names = division_names
    @teams = teams
  end

  def pick!
    randomized_teams = @teams.shuffle
    divisions = randomized_teams / @division_names.length
    results = []
    @division_names.each do |name|
      results << [name, divisions[@division_names.index(name)]]
    end
    results
  end
end