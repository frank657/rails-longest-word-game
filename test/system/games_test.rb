require "application_system_test_case"

# class GamesTest < ApplicationSystemTestCase
#   test "Should identify an invalid word" do
#   visit
# end

class GamesTest < ApplicationSystemTestCase
  test "Going to /new gives us a new random grid to play with" do
    visit new_url
    assert test: "New game"
    assert_selector "h2", count: 1
  end
end
