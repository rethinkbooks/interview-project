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

  def initialize(attrs = {})
    attrs.each do |name, value|
      send("#{name}=".to_sym, value) if respond_to?("#{name}=".to_sym)
    end
  end

  def ==(other_owner)
    !attributes.keys.map { |attribute| self.send(attribute) == other_owner.send(attribute) }.include?(false)
  end
end
