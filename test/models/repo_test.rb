class RepoTest < ActiveSupport::TestCase
  attrs = {
    id: 11888299,
    name: 'rosetta-euler',
    full_name: 'seaneshbaugh/rosetta-euler',
    private: false,
    html_url: 'https://github.com/seaneshbaugh/rosetta-euler',
  }

  test 'should have an empty owner object if no owner is passed in the attrs argument' do
    repo = Repo.new

    empty_owner = Owner.new

    assert_equal empty_owner, repo.owner
  end

  test 'should create an owner model object from a generic object that response to attrs method' do
    original_owner_object = OpenStruct.new

    original_owner_object.attrs = {
      login: 'seaneshbaugh',
      id: 858870
    }

    repo = Repo.new(attrs.merge(owner: original_owner_object))

    assert_equal 'seaneshbaugh', repo.owner.login

    assert_equal 858870, repo.owner.id
  end

  test 'should map known attributes' do
    repo = Repo.new(attrs)

    assert_equal 11888299, repo.id
    assert_equal 'rosetta-euler', repo.name
    assert_equal 'seaneshbaugh/rosetta-euler', repo.full_name
    assert_equal false, repo.private
    assert_equal 'https://github.com/seaneshbaugh/rosetta-euler', repo.html_url
  end
end
