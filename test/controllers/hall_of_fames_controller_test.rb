require 'test_helper'

class HallOfFamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hall_of_fame = hall_of_fames(:one)
  end

  test 'should get index' do
    get hall_of_fames_url
    assert_response :success
  end

  test 'should get new' do
    get new_hall_of_fame_url
    assert_response :success
  end

  test 'should create hall_of_fame' do
    assert_difference('HallOfFame.count') do
      post hall_of_fames_url, params: { hall_of_fame: { team_id: @hall_of_fame.team_id } }
    end

    assert_redirected_to hall_of_fame_url(HallOfFame.last)
  end

  test 'should show hall_of_fame' do
    get hall_of_fame_url(@hall_of_fame)
    assert_response :success
  end

  test 'should get edit' do
    get edit_hall_of_fame_url(@hall_of_fame)
    assert_response :success
  end

  test 'should update hall_of_fame' do
    patch hall_of_fame_url(@hall_of_fame), params: { hall_of_fame: { team_id: @hall_of_fame.team_id } }
    assert_redirected_to hall_of_fame_url(@hall_of_fame)
  end

  test 'should destroy hall_of_fame' do
    assert_difference('HallOfFame.count', -1) do
      delete hall_of_fame_url(@hall_of_fame)
    end

    assert_redirected_to hall_of_fames_url
  end
end
