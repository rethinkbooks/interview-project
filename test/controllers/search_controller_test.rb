require 'test_helper'

class SearchControllerTest < ActionController::TestCase
  setup do
    sign_in users(:sean_eshbaugh)
  end

  test 'should not display any search results if no search has been made' do
    get :index

    assert_response :success

    assert_select 'h1', false, 'Search Results'
  end

  test 'should display search results if a search has been made' do
    VCR.use_cassette('repo search rosetta euler') do
      get :index, q: 'rosetta euler'

      assert_response :success

      assert_select 'h1', 'Search Results'
    end
  end
end
