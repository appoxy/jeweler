class Jeweler
  module Commands
    module ReleaseCommon


      def clean_staging_area?
        # surprisingly simpler than ruby-git
        # `git ls-files --deleted --modified --others --exclude-standard` == ""
        `git ls-files --deleted --modified --exclude-standard` == ""
      end


    end
  end
end
