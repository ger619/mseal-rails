require 'test_helper'

class OpponentTeamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @opponent_team = opponent_teams(:one)
  end

  test 'should get index' do
    get opponent_teams_url
    assert_response :success
  end

  test 'should get new' do
    get new_opponent_team_url
    assert_response :success
  end

  test 'should create opponent_team' do
    assert_difference('OpponentTeam.count') do
      post opponent_teams_url,
           params: { opponent_team: { name: @opponent_team.name, team_url: @opponent_team.team_url } }
    end

    assert_redirected_to opponent_team_url(OpponentTeam.last)
  end

  test 'should show opponent_team' do
    get opponent_team_url(@opponent_team)
    assert_response :success
  end

  test 'should get edit' do
    get edit_opponent_team_url(@opponent_team)
    assert_response :success
  end

  test 'should update opponent_team' do
    patch opponent_team_url(@opponent_team),
          params: { opponent_team: { name: @opponent_team.name, team_url: @opponent_team.team_url } }
    assert_redirected_to opponent_team_url(@opponent_team)
  end

  test 'should destroy opponent_team' do
    assert_difference('OpponentTeam.count', -1) do
      delete opponent_team_url(@opponent_team)
    end

    assert_redirected_to opponent_teams_url
  end
end
