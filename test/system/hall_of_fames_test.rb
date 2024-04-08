require 'application_system_test_case'

class HallOfFamesTest < ApplicationSystemTestCase
  setup do
    @hall_of_fame = hall_of_fames(:one)
  end

  test 'visiting the index' do
    visit hall_of_fames_url
    assert_selector 'h1', text: 'Hall of fames'
  end

  test 'should create hall of fame' do
    visit hall_of_fames_url
    click_on 'New hall of fame'

    fill_in 'Team', with: @hall_of_fame.team_id
    click_on 'Create Hall of fame'

    assert_text 'Hall of fame was successfully created'
    click_on 'Back'
  end

  test 'should update Hall of fame' do
    visit hall_of_fame_url(@hall_of_fame)
    click_on 'Edit this hall of fame', match: :first

    fill_in 'Team', with: @hall_of_fame.team_id
    click_on 'Update Hall of fame'

    assert_text 'Hall of fame was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Hall of fame' do
    visit hall_of_fame_url(@hall_of_fame)
    click_on 'Destroy this hall of fame', match: :first

    assert_text 'Hall of fame was successfully destroyed'
  end
end
