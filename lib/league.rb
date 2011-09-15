require 'yaml'
require File.dirname(__FILE__) + '/ext/array'
require File.dirname(__FILE__) + '/division_picker'
require File.dirname(__FILE__) + '/division_presenter'
require File.dirname(__FILE__) + '/draft_order_picker'
require File.dirname(__FILE__) + '/draft_presenter'
require File.dirname(__FILE__) + '/feedback'

class League
  attr_reader :feedback, :division_names, :teams
  attr_accessor :divisions, :draft_order

  def initialize
    @feedback = Feedback.new
    @division_names = YAML.load_file('divisions.yml')
    @teams = YAML.load_file('teams.yml')
  end

  def build!
    self.pick_divisions
    self.pick_draft_order
  end

  def to_file
    feedback.provide("Generating file...") do
      File.open(self.filename, 'w') {|f| f.write(self.concatenated_content) }
    end
  end

  protected

  def pick_divisions
    feedback.provide("Picking divisions...") do
      self.divisions = DivisionPicker.new(self.division_names, self.teams).pick!
    end
  end

  def pick_draft_order
    feedback.provide("Picking draft order...") do
      self.draft_order = DraftOrderPicker.new(self.teams).pick!
    end
  end

  def concatenated_content
    ["Divisions", DivisionPresenter.new(self.divisions).to_s, "Draft Order", DraftPresenter.new(self.draft_order).to_s].join("\n")
  end

  def filename
    "league-#{timestamp}.txt"
  end

  def timestamp
    Time.now.strftime("%Y%m%d%H%M%S")
  end
end
