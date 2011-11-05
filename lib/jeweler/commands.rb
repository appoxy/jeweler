class Jeweler
  module Commands
    require_relative 'commands/build_gem'
    require_relative 'commands/install_gem'
    require_relative 'commands/check_dependencies'
    require_relative 'commands/release_to_git'
    require_relative 'commands/release_gemspec'
    require_relative 'commands/release_to_rubygems'
    require_relative 'commands/validate_gemspec'
    require_relative 'commands/write_gemspec'

    module Version
      require_relative 'commands/version/base'
      require_relative 'commands/version/bump_major'
      require_relative 'commands/version/bump_minor'
      require_relative 'commands/version/bump_patch'
      require_relative 'commands/version/write'
    end
  end
end
