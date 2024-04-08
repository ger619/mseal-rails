require 'application_system_test_case'

class OpponentTeamsTest < ApplicationSystemTestCase
  setup do
    @opponent_team = opponent_teams(:one)
  end

  test 'visiting the index' do
    visit opponent_teams_url
    assert_selector 'h1', text: 'Opponent teams'
  end

  test 'should create opponent team' do
    visit opponent_teams_url
    click_on 'New opponent team'

    fill_in 'Name', with: @opponent_team.name
    fill_in 'Team url', with: @opponent_team.team_url
    click_on 'Create Opponent team'

    assert_text 'Opponent team was successfully created'
    click_on 'Back'
  end

  test 'should update Opponent team' do
    visit opponent_team_url(@opponent_team)
    click_on 'Edit this opponent team', match: :first

    fill_in 'Name', with: @opponent_team.name
    fill_in 'Team url', with: @opponent_team.team_url
    click_on 'Update Opponent team'

    assert_text 'Opponent team was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Opponent team' do
    visit opponent_team_url(@opponent_team)
    click_on 'Destroy this opponent team', match: :first

    assert_text 'Opponent team was successfully destroyed'
  end
end
