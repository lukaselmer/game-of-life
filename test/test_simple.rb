require "minitest/autorun"
require_relative("../#{ENV['GAME_PATH']}")

describe "Game" do
  it "simple" do
    begin_state = [
      [false, false, false, false, true],
      [false, false, false, false, false],
      [false, true, true, false, false],
      [false, false, true, false, false],
      [false, false, false, false, false]
    ]
    game = Game.new(begin_state)
    game.tick
    game.fields.must_equal([
      [false, false, false, false, false],
      [false, false, false, false, false],
      [false, true, true, false, false],
      [false, true, true, false, false],
      [false, false, false, false, false]
    ])
  end
end

