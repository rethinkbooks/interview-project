class OwnerTest < ActiveSupport::TestCase
  attrs = {
    login: 'seaneshbaugh',
    id: 858870,
    avatar_url: 'https://avatars.githubusercontent.com/u/858870?v=3',
    gravatar_id: '',
    url: 'https://api.github.com/users/seaneshbaugh'
  }

  test 'should map known attributes' do
    owner = Owner.new(attrs)

    assert_equal 'seaneshbaugh', owner.login

    assert_equal 858870, owner.id

    assert_equal 'https://avatars.githubusercontent.com/u/858870?v=3', owner.avatar_url

    assert_equal '', owner.gravatar_id

    assert_equal 'https://api.github.com/users/seaneshbaugh', owner.url
  end
end
