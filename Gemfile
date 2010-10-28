source 'https://rubygems.org'

DATA_MAPPER = 'http://github.com/datamapper'
DM_VERSION = '~> 1.0.2'
RONIN = 'http://github.com/ronin-ruby'

gemspec

# DataMapper dependencies
gem 'dm-migrations',	DM_VERSION, :git => 'http://github.com/postmodern/dm-migrations.git', :branch => 'runner'

# Ronin dependencies
gem 'ronin-support',	'~> 0.1.0', :git => "#{RONIN}/ronin-support.git"
gem 'ronin',		'~> 0.4.0', :git => "#{RONIN}/ronin.git"
gem 'ronin-gen',	'~> 0.3.0', :git => "#{RONIN}/ronin-gen.git"
gem 'ronin-scanners',	'~> 0.2.0', :git => "#{RONIN}/ronin-scanners.git"
gem 'ronin-web',	'~> 0.3.0', :git => "#{RONIN}/ronin-web.git"
gem 'ronin-exploits',	'~> 0.4.0', :git => "#{RONIN}/ronin-exploits.git"

group :development do
  gem 'rake',		'~> 0.8.7'
  gem 'cssmin',		'~> 1.0.2'
  gem 'jsmin',		'~> 1.0.1'
  gem 'ronin-gen',	'~> 0.3.0', :git => "#{RONIN}/ronin-gen.git"

  case RUBY_PLATFORM
  when 'java'
    gem 'maruku',	'~> 0.6.0'
  else
    gem 'rdiscount',	'~> 1.6.3'
  end

  gem 'ore'
  gem 'ore-tasks'

  gem 'rspec',	'~> 2.0.0'
end
