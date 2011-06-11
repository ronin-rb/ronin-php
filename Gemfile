source 'https://rubygems.org'

DM_URI = 'http://github.com/datamapper'
DM_VERSION = '~> 1.1.0'
RONIN_URI = 'http://github.com/ronin-ruby'

gemspec

gem 'wordlist', '~> 0.2.0', :git => 'git://github.com/sophsec/wordlist.git',
                            :branch => 'refactor'

# Ronin dependencies
# gem 'ronin-support',  '~> 0.2', :git => "#{RONIN_URI}/ronin-support.git"
gem 'ronin',          '~> 1.1', :git => "#{RONIN_URI}/ronin.git"
gem 'ronin-gen',      '~> 1.0', :git => "#{RONIN_URI}/ronin-gen.git"
gem 'ronin-scanners',	'~> 1.0', :git => "#{RONIN_URI}/ronin-scanners.git"
gem 'ronin-web',      '~> 0.3', :git => "#{RONIN_URI}/ronin-web.git"
gem 'ronin-exploits', '~> 1.0', :git => "#{RONIN_URI}/ronin-exploits.git"

group :development do
  gem 'rake',         '~> 0.8'

  gem 'cssmin',       '~> 1.0.2'
  gem 'jsmin',        '~> 1.0.1'

  gem 'ore-tasks',    '~> 0.4'
  gem 'rspec',        '~> 2.4'

  gem 'kramdown',     '~> 0.12'
end

#
# To enable additional DataMapper adapters for development work or for
# testing purposes, simple set the ADAPTER or ADAPTERS environment
# variable:
#
#     export ADAPTER="postgres"
#     bundle install
#
#     ./bin/ronin --database postgres://ronin@localhost/ronin
#
require 'set'

DM_ADAPTERS = Set['postgres', 'mysql', 'oracle', 'sqlserver']

adapters = (ENV['ADAPTER'] || ENV['ADAPTERS']).to_s
adapters = Set.new(adapters.to_s.tr(',',' ').split)

(DM_ADAPTERS & adapters).each do |adapter|
  gem "dm-#{adapter}-adapter", DM_VERSION #, :git => "#{DM_URI}/dm-#{adapter}-adapter.git"
end
