
require_relative 'release_common'

class Jeweler
  module Commands
    class ReleaseToGit
      include ReleaseCommon

      attr_accessor :gemspec, :version, :repo, :output, :gemspec_helper, :base_dir

      def initialize(attributes = {})
        self.output = $stdout

        attributes.each_pair do |key, value|
          send("#{key}=", value)
        end
      end

      def run
        #unless clean_staging_area?
        #  system "git status"
        #  raise "Unclean staging area! Be sure to commit or .gitignore everything first. See `git status` above."
        #end

        #repo.checkout('master')
        branch = repo.current_branch
        output.puts "Pushing #{branch} to origin"
        repo.push('origin', branch)
        
        if release_not_tagged?
          output.puts "Tagging #{release_tag}"
          repo.add_tag(release_tag)

          output.puts "Pushing #{release_tag} to origin"
          repo.push('origin', release_tag)
        end
      end

      def release_tag
        "v#{version}"
      end

      def release_not_tagged?
        tag = repo.tag(release_tag) rescue nil
        tag.nil?
      end

      def self.build_for(jeweler)
        command = self.new

        command.base_dir = jeweler.base_dir
        command.gemspec = jeweler.gemspec
        command.version = jeweler.version
        command.repo = jeweler.repo
        command.output = jeweler.output
        command.gemspec_helper = jeweler.gemspec_helper

        command
      end
    end
  end
end
