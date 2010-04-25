class Score < ActiveRecord::Base
  belongs_to :press
  belongs_to :game

  def press_name
    press.name if press
  end

  def press_name=(name)
    self.press = Press.find_or_create_by_name(name) unless name.blank?
  end

  def game_id
    game.id if game
  end

  def game_id=(id)
    self.game = Game.find(id) unless id.blank?
  end
end
