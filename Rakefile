# Look in the tasks/setup.rb file for the various options that can be
# configured in this Rakefile. The .rake files in the tasks directory
# are where the options are used.

load 'tasks/setup.rb'

ensure_in_path 'lib'
require 'colour'

task :default => 'spec:run'

PROJ.name = 'colour'
PROJ.authors = 'Wes Devauld'
PROJ.email = 'http://devauld.ca' 
PROJ.url = 'http://www.ihatework.ca/svn/colour/'
PROJ.rubyforge_name = 'colour'

PROJ.spec_opts << '--color'
