require 'cucumber/rake/task'
require 'rspec/core/rake_task'
require 'coveralls/rake/task'

Coveralls::RakeTask.new
RSpec::Core::RakeTask.new
Cucumber::Rake::Task.new

task :default => [:spec, :cucumber, 'coveralls:push']
