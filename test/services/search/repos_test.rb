module Search
  class ReposTest < ActiveSupport::TestCase
    test 'should return an empty array if a blank query is passed' do
      results = Search::Repos.call({})

      assert_equal 0, results.total_count
    end

    test 'should return an array of repos that match a query' do
      VCR.use_cassette('repo search rosetta euler') do
        results = Search::Repos.call({ q: 'rosetta euler' })

        assert_equal 3, results.total_count

        results.each do |result|
          assert_kind_of Repo, result
        end
      end
    end

    test 'should return an array of repos sorted in descending order' do
      VCR.use_cassette('repo search rosetta euler desc') do
        results = Search::Repos.call({ q: 'rosetta euler', order: 'desc' })

        assert_equal results, results.sort { |a, b| b.stargazers_count <=> a.stargazers_count }
      end
    end

    test 'should return an array of repos sorted in ascending order' do
      VCR.use_cassette('repo search rosetta euler asc') do
        results = Search::Repos.call({ q: 'rosetta euler', order: 'asc' })

        assert_equal results, results.sort { |a, b| a.stargazers_count <=> b.stargazers_count }
      end
    end
  end
end
