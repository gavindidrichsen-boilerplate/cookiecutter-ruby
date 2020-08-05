module {{cookiecutter.dir_name | capitalize}}
  module Behaviours
    module Runner
      VERSION = "0.1.7"
      class WhoIs
        def self.awesome?
          "YOU ARE AN AWESOME RUNNER!!"
        end
      end
    end
  end
end
