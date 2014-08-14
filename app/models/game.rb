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
  validates_presence_of :answer, :max_misses, :misses, :guessed
end
