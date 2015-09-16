# Model for repo owners. Currently this doesn't serve much purpose. Initially
# the idea was to make sure there was a sane interface for all of the data that
# comes back from a GitHub API response. Because data about the repo's owner is
# encapsulated here it would be relatively simple to display more about the
# owner on the search results page.
#
# This model is not backed by the database since no search results are stored
# or cached.
class Owner
  include Virtus::Model

  attribute :login, String
  attribute :id, Fixnum
  attribute :avatar_url, String
  attribute :gravatar_id, String
  attribute :url, String
  attribute :html_url, String
  attribute :followers_url, String
  attribute :following_url, String
  attribute :gists_url, String
  attribute :starred_url, String
  attribute :subscriptions_url, String
  attribute :organizations_url, String
  attribute :repos_url, String
  attribute :events_url, String
  attribute :received_events_url, String
  attribute :type, String
  attribute :site_admin, Boolean

  # Create a new owner object.
  #
  # ==== Parameters
  # * <tt>attrs</tt> - Attributes from the owner attribute of a repo
  #   returned by the GitHub API. Only known attributes are copied.
  def initialize(attrs = {})
    attrs.each do |name, value|
      send("#{name}=".to_sym, value) if respond_to?("#{name}=".to_sym)
    end
  end

  # Compare two owner objects by their attributes
  #
  # ==== Parameters
  # * <tt>other</tt> - The other owner object to compare against.
  def ==(other)
    !attributes.keys.map { |attribute| send(attribute) == other.send(attribute) }.include?(false)
  end
end
