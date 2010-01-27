#!/usr/bin/env ruby

require 'rubygems'

lib_dir = File.expand_path(File.join(File.dirname(__FILE__),'..','lib'))
unless $LOAD_PATH.include?(lib_dir)
  $LOAD_PATH << lib_dir
end

require 'ronin/ui/command_line/commands/gen_php_rpc'

Ronin::UI::CommandLine::Commands::GenPhpRpc.start