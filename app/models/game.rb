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
  before_validation :guessed_default
  validates_presence_of :answer, :max_misses, :misses
  def board
    # Take @answer and only show letters that the player has guessed
    result = ''
    answer.split('').each do |char| # can use self.answer or self.guessed throughout
      if guessed.include?(char)
        result += char
      else
        result += '_'
      end
    end
    result
  end

  def guess(letter)
    letter.downcase!
    found = answer.include?(letter)

    unless guessed.include?(letter)
      self.guessed += letter
      self.misses += 1 unless found
    end
    self.save!
    found
  end

  private

  def guessed_default
    self.guessed ||= ''
  end
end
