# Model for GitHub repos.
#
# This model is not backed by the database since no search results are stored
# or cached.
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

  # List of popular languages, taken from https://github.com/search/advanced.
  def self.popular_languages
    ['ActionScript', 'C', 'C#', 'C++', 'Clojure', 'CoffeeScript', 'CSS', 'Go', 'Haskell', 'HTML', 'Java', 'JavaScript', 'Lua', 'Matlab', 'Objective-C', 'Perl', 'PHP', 'Python', 'R', 'Ruby', 'Scala',
     'Shell', 'Swift', 'TeX', 'VimL']
  end

  # List of not so popular languages, taken from https://github.com/search/advanced.
  def self.esoteric_languages
    ['ABAP', 'Ada', 'Agda', 'AGS Script', 'Alloy', 'AMPL', 'Ant Build System', 'ANTLR', 'ApacheConf', 'Apex', 'API Blueprint', 'APL', 'AppleScript', 'Arc', 'Arduino', 'AsciiDoc', 'ASP', 'AspectJ',
     'Assembly', 'ATS', 'Augeas', 'AutoHotkey', 'AutoIt', 'Awk', 'Batchfile', 'Befunge', 'Bison', 'BitBake', 'BlitzBasic', 'BlitzMax', 'Bluespec', 'Boo', 'Brainfuck', 'Brightscript', 'Bro',
     'C-ObjDump', 'C2hs Haskell', 'Capn Proton Proto', 'CartoCSS', 'Ceylon', 'Chapel', 'Charity', 'ChucK', 'Cirru', 'Clarion', 'Clean', 'CLIPS', 'CMake', 'COBOL', 'ColdFusion', 'ColdFusion CFC',
     'Common Lisp', 'Component Pascal', 'Cool', 'Coq', 'Cpp-ObjDump', 'Creole', 'Crystal', 'Cucumber', 'Cuda', 'Cycript', 'Cython', 'D', 'D-ObjDump', 'Darcs Patch', 'Dart', 'desktop', 'Diff',
     'DIGITAL Command Language', 'DM', 'DNS Zone', 'Dockerfile', 'Dogescript', 'DTrace', 'Dylan', 'E', 'Eagle', 'eC', 'Ecere Projects', 'ECL', 'ECLiPSe', 'edn', 'Eiffel', 'Elixir', 'Elm',
     'Emacs Lisp', 'EmberScript', 'Erlang', 'F#', 'Factor', 'Fancy', 'Fantom', 'Filterscript', 'fish', 'FLUX', 'Formatted', 'Forth', 'FORTRAN', 'Frege', 'G-code', 'Game Maker Language', 'GAMS',
     'GAP', 'GAS', 'GDScript', 'Genshi', 'Gentoo Ebuild', 'Gentoo Eclass', 'Gettext Catalog', 'GLSL', 'Glyph', 'Gnuplot', 'Golo', 'Gosu', 'Grace', 'Gradle', 'Grammatical Framework',
     'Graph Modeling Language', 'Graphviz (DOT)', 'Groff', 'Groovy', 'Groovy Server Pages', 'Hack', 'Haml', 'Handlebars', 'Harbour', 'Haxe', 'HCL', 'HTML+Django', 'HTML+ERB', 'HTML+PHP', 'HTTP',
     'Hy', 'HyPhy', 'IDL', 'Idris', 'IGOR Pro', 'Inform 7', 'INI', 'Inno Setup', 'Io', 'Ioke', 'IRC log', 'Isabelle', 'Isabelle ROOT', 'J', 'Jade', 'Jasmin', 'Java Server Pages', 'JFlex', 'JSON',
     'JSON5', 'JSONiq', 'JSONLD', 'JSX', 'Julia', 'KiCad', 'Kit', 'Kotlin', 'KRL', 'LabVIEW', 'Lasso', 'Latte', 'Lean', 'Less', 'Lex', 'LFE', 'LilyPond', 'Limbo', 'Linker Script',
     'Linux Kernel Module', 'Liquid', 'Literate Agda', 'Literate CoffeeScript', 'Literate Haskell', 'LiveScript', 'LLVM', 'Logos', 'Logtalk', 'LOLCODE', 'LookML', 'LoomScript', 'LSL', 'M',
     'Makefile', 'Mako', 'Markdown', 'Mask', 'Mathematica', 'Maven POM', 'Max', 'MediaWiki', 'Mercury', 'MiniD', 'Mirah', 'Modelica', 'Modula-2', 'Module Management System', 'Monkey', 'Moocode',
     'MoonScript', 'MTML', 'MUF', 'mupad', 'Myghty', 'NCL', 'Nemerle', 'nesC', 'NetLinx', 'NetLinx+ERB', 'NetLogo', 'NewLisp', 'Nginx', 'Nimrod', 'Ninja', 'Nit', 'Nix', 'NL', 'NSIS', 'Nu', 'NumPy',
     'ObjDump', 'Objective-C++', 'Objective-J', 'OCaml', 'Omgrofl', 'ooc', 'Opa', 'Opal', 'OpenCL', 'OpenEdge ABL', 'OpenSCAD', 'Org', 'Ox', 'Oxygene', 'Oz', 'Pan', 'Papyrus', 'Parrot',
     'Parrot Assembly', 'Parrot Internal Representation', 'Pascal', 'PAWN', 'Perl6', 'PicoLisp', 'PigLatin', 'Pike', 'PLpgSQL', 'PLSQL', 'Pod', 'PogoScript', 'PostScript', 'PowerShell', 'Processing',
     'Prolog', 'Propeller Spin', 'Protocol Buffer', 'Public Key', 'Puppet', 'Pure Data', 'PureBasic', 'PureScript', 'Python traceback', 'QMake', 'QML', 'Racket', 'Ragel in Ruby Host', 'RAML',
     'Raw token data', 'RDoc', 'REALbasic', 'Rebol', 'Red', 'Redcode', 'RenderScript', 'reStructuredText', 'RHTML', 'RMarkdown', 'RobotFramework', 'Rouge', 'Rust', 'Sage', 'SaltStack', 'SAS', 'Sass',
     'Scaml', 'Scheme', 'Scilab', 'SCSS', 'Self', 'ShellSession', 'Shen', 'Slash', 'Slim', 'Smali', 'Smalltalk', 'Smarty', 'SMT', 'SourcePawn', 'SPARQL', 'SQF', 'SQL', 'SQLPL', 'Squirrel',
     'Standard ML', 'Stata', 'STON', 'Stylus', 'SuperCollider', 'SVG', 'SystemVerilog', 'Tcl', 'Tcsh', 'Tea', 'Text', 'Textile', 'Thrift', 'TOML', 'Turing', 'Turtle', 'Twig', 'TXL', 'TypeScript',
     'Unified Parallel C', 'Unity3D Asset', 'UnrealScript', 'Vala', 'VCL', 'Verilog', 'VHDL', 'Visual Basic', 'Volt', 'Vue', 'Web Ontology Language', 'WebIDL', 'wisp', 'X10', 'xBase', 'XC', 'XML',
     'Xojo', 'XPages', 'XProc', 'XQuery', 'XS', 'XSLT', 'Xtend', 'Yacc', 'YAML', 'Zephir', 'Zimpl']
  end

  # Create a new repo opbject.
  #
  # ==== Parameters
  # * <tt>attrs</tt> - Attributes from a repo returned by the GitHub API. Only
  #   known attributes are copied.
  def initialize(attrs = {})
    self.owner = fetch_owner(attrs.delete(:owner))

    attrs.each do |name, value|
      send("#{name}=".to_sym, value) if respond_to?("#{name}=".to_sym)
    end
  end

  # Compare two repo objects by their attributes.
  #
  # ==== Parameters
  # * <tt>other</tt> - The other repo object to compare against.
  def ==(other)
    !attributes.keys.map { |attribute| send(attribute) == other.send(attribute) }.include?(false)
  end

  private

  def fetch_owner(original_owner_object)
    return Owner.new if original_owner_object.nil? || !original_owner_object.respond_to?(:attrs)

    Owner.new(original_owner_object.attrs)
  end
end
