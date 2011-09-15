class DraftPresenter
  def initialize(teams)
    @teams = teams
  end

  def to_s
    draft_table = table do |t|
      t.headings = 'Position', 'Team'
      @teams.each do |team|
        t << [position_for(team),  team]
      end
    end
    draft_table
  end

  protected

  def position_for(team)
    @teams.index(team) + 1
  end
end