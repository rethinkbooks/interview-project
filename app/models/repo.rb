class Repo
  include Virtus.model

  attribute :id, Fixnum
  attribute :name, String
  attribute :full_name, String
  attribute :owner, Owner
  attribute :private, Boolean
  attribute :html_url, String
  attribute :description, String
  attribute :fork, Boolean
  attribute :url, String
  attribute :forks_url, String
  attribute :keys_url, String
  attribute :collaborators_url, String
  attribute :teams_url, String
  attribute :hooks_url, String
  attribute :issue_events_url, String
  attribute :events_url, String
  attribute :assignees_url, String
  attribute :branches_url, String
  attribute :tags_url, String
  attribute :blobs_url, String
  attribute :git_tags_url, String
  attribute :git_refs_url, String
  attribute :trees_url, String
  attribute :statuses_url, String
  attribute :languages_url, String
  attribute :stargazers_url, String
  attribute :contributors_url, String
  attribute :subscribers_url, String
  attribute :subscription_url, String
  attribute :commits_url, String
  attribute :git_commits_url, String
  attribute :comments_url, String
  attribute :issue_comment_url, String
  attribute :contents_url, String
  attribute :compare_url, String
  attribute :merges_url, String
  attribute :archive_url, String
  attribute :downloads_url, String
  attribute :issues_url, String
  attribute :pulls_url, String
  attribute :milestones_url, String
  attribute :notifications_url, String
  attribute :labels_url, String
  attribute :releases_url, String
  attribute :created_at, Time
  attribute :updated_at, Time
  attribute :pushed_at, Time
  attribute :git_url, String
  attribute :ssh_url, String
  attribute :clone_url, String
  attribute :svn_url, String
  attribute :homepage, String
  attribute :size, Fixnum
  attribute :stargazers_count, Fixnum
  attribute :watchers_count, Fixnum
  attribute :language, String
  attribute :has_issues, Boolean
  attribute :has_downloads, Boolean
  attribute :has_wiki, Boolean
  attribute :has_pages, Boolean
  attribute :forks_count, Fixnum
  attribute :mirror_url, String
  attribute :open_issues_count, Fixnum
  attribute :forks, Fixnum
  attribute :open_issues, Fixnum
  attribute :watchers, Fixnum
  attribute :default_branch, String
  attribute :score, Float

  def initialize(attrs = {})
    self.owner = fetch_owner(attrs.delete(:owner))

    attrs.each do |name, value|
      send("#{name}=".to_sym, value) if respond_to?("#{name}=".to_sym)
    end
  end

  def ==(other_repo)
    !attributes.keys.map { |attribute| self.send(attribute) == other_repo.send(attribute) }.include?(false)
  end

  private

  # I'm not happy with the name of the argument, but I suppose it's descriptive enough.
  def fetch_owner(original_owner_object)
    return Owner.new if original_owner_object.nil? || !original_owner_object.respond_to?(:attrs)

    Owner.new(original_owner_object.attrs)
  end
end
