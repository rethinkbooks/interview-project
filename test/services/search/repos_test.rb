module Search
  class ReposTest < ActiveSupport::TestCase
    test 'should return an empty array if a blank query is passed' do
      results = Search::Repos.call(nil)

      assert_equal 0, results.total_count
    end

    test 'should return an array of repos that match a query' do
      VCR.use_cassette('repo search rosetts euler') do
        results = Search::Repos.call('rosetta euler')

        assert_equal 3, results.total_count

        results.each do |result|
          assert_kind_of Repo, result
        end
      end
    end
  end
end
