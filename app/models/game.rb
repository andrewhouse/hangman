# == Schema Information
#
# Table name: games
#
#  id         :integer          not null, primary key
#  answer     :string(255)
#  max_misses :integer
#  misses     :integer
#  guessed    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

# Create Model for Game
class Game < ActiveRecord::Base
  # ^ Know's to look at 'games' table for data
  # Also Defines methods from schema
  validates_presence_of :answer, :max_misses, :misses
  before_validation :guessed_default
  def board
    # Take @answer and only show letters that the player has guessed
    result = ''
    answer.split('').each do |char|
      if guessed.include?(char)
        result += char
      else
        result += '_'
      end
    end
    result
  end

  private

  def guessed_default
    self.guessed ||= 0
  end
end
