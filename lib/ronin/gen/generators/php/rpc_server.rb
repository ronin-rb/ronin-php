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

require 'ronin/gen/file_generator'
require 'ronin/php/config'

require 'cssmin'
require 'jsmin'

module Ronin
  module Gen
    module Generators
      module Php
        class RpcServer < FileGenerator

          SERVER_FILE = File.join('ronin','gen','php','rpc','server.php.erb')

          desc 'Generates a new PHP-RPC Server script'
          class_option :no_ajax, :type => :boolean
          class_option :no_cssmin, :type => :boolean
          class_option :no_jsmin, :type => :boolean
          class_option :inline, :type => :array,
                                :default => [],
                                :banner => 'file1.php file2.php'

          #
          # Generates the PHP-RPC Server script.
          #
          # @since 0.2.0
          #
          def generate
            erb SERVER_FILE, self.path
          end

          protected

          #
          # Minifies CSS source-code and emits a `style` tag.
          #
          # @param [String] css
          #   The CSS source-code to minify.
          #
          # @since 0.2.0
          #
          def css_min(css)
            css = CSSMin.minify(css) unless options.no_cssmin?

            return "<style type=\"text/css\">#{css}</style>"
          end

          #
          # Minifies JavaScript source-code and emits a `script` tag.
          #
          # @param [String] js
          #   The JavaScript source-code to minify.
          #
          # @since 0.2.0
          #
          def js_min(js)
            js = JSMin.minify(js) unless options.no_jsmin?

            return "<script type=\"text/javascript\">#{js}</script>"
          end

        end
      end
    end
  end
end
