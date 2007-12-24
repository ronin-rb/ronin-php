# -*- ruby -*-

require 'rubygems'
require 'hoe'
require './lib/ronin/php/version.rb'

Hoe.new('ronin_php', Ronin::PHP::VERSION) do |p|
  p.rubyforge_name = 'ronin'
  p.author = 'Postmodern Modulus III'
  p.email = 'postmodern.mod3@gmail.com'
  p.summary = 'A Ronin library providing support for PHP security tasks'
  p.description = p.paragraphs_of('README.txt', 2..5).join("\n\n")
  p.url = p.paragraphs_of('README.txt', 0).first.split(/\n/)[1..-1]
  p.changes = p.paragraphs_of('History.txt', 0..1).join("\n\n")
  p.extra_deps = ['ronin']
end

# vim: syntax=Ruby
