# frozen_string_literal: true

require_relative 'lib/rubocop/sidekiq/version'

Gem::Specification.new do |spec|
  spec.name = 'rubocop-sidekiq'
  spec.version = RuboCop::Sidekiq::VERSION
  spec.authors = ['Sam Jenkins']
  spec.email = ['dustpan.umpires0y@icloud.com']

  spec.summary = 'Automatic Sidekiq code style checking tool.'
  spec.description = <<~DESCRIPTION
    Automatic Sidekiq code style checking tool.
    A RuboCop extension focused on enforcing Sidekiq best practices.
  DESCRIPTION
  spec.homepage = 'https://github.com/samrjenkins/rubocop-sidekiq'
  spec.required_ruby_version = '>= 2.7.0'

  # spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/samrjenkins/rubocop-sidekiq'
  spec.metadata['changelog_uri'] = 'https://github.com/samrjenkins/rubocop-sidekiq/blob/main/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor Gemfile])
    end
  end
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'rubocop'
  spec.metadata['rubygems_mfa_required'] = 'true'
end
