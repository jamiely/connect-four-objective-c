When /^I see the button '(\w+)'$/ do |label|
  check_element_exists "view marked:'#{label}'"
end

Then /^I should see (\d+) rows and (\d+) columns of blank index views$/ do |rows, columns|
  0.upto(rows.to_i-1) do |row|
    0.upto(columns.to_i-1) do |column|
      check_element_exists "view marked:'Index (Row: #{row} Column: #{column})'"
    end
  end
end

When /^I start the game$/ do
  steps %Q{
    Then I wait to see "Start"
    When I touch the button marked "Start"
  }
end

When /^I launch the app and start the game$/ do
  steps %Q{
    Given I launch the app
    And I start the game
  }
end

When /^I touch column (\d+)$/ do |column|
  column = column.to_i
  row = (1..6).to_a.sample
  steps %Q{
    When I touch "Index (Row: #{row-1} Column: #{column-1})"
  }
end

Then /^column (\d+) should look like "(.*?)"$/ do |column, marker_list|
  column = column.to_i
  # reverse because we expect testing from the bottom to top of the grid
  markers = marker_list.split(',').reverse
  markers.each_index do |r|
    img = markers[r]
    steps %Q{
      Then I should see "Index (Row: #{r} Column: #{column-1}) Image (#{img})"
    }
  end
end

Then /^column (\d+) should start with "(.*?)"$/ do |column, marker_list|
  markers = marker_list.split(',')
  markers = markers.fill("empty", markers.length, 6 - markers.length)
  step %Q{column #{column} should look like "#{markers.join(',')}"}
end

