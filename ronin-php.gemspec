# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ronin-php}
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Postmodern"]
  s.date = %q{2010-10-10}
  s.default_executable = %q{ronin-php}
  s.description = %q{Ronin PHP is a Ruby library for Ronin that provides support for PHP related security tasks.}
  s.email = %q{ronin-ruby@googlegroups.com}
  s.executables = ["ronin-php"]
  s.extra_rdoc_files = [
    "ChangeLog.md",
    "README.md"
  ]
  s.files = [
    ".gitignore",
    ".rspec",
    ".yardopts",
    "COPYING.txt",
    "ChangeLog.md",
    "Gemfile",
    "Gemfile.lock",
    "README.md",
    "Rakefile",
    "bin/ronin-php",
    "data/ronin/gen/php/rpc/ajax.php.erb",
    "data/ronin/gen/php/rpc/ajax/css/layout.css",
    "data/ronin/gen/php/rpc/ajax/js/base64.js",
    "data/ronin/gen/php/rpc/ajax/js/jquery-ui-personalized.min.js",
    "data/ronin/gen/php/rpc/ajax/js/jquery.min.js",
    "data/ronin/gen/php/rpc/ajax/js/jquery.terminal.js",
    "data/ronin/gen/php/rpc/ajax/js/msgpack.js",
    "data/ronin/gen/php/rpc/ajax/js/php_rpc.js",
    "data/ronin/gen/php/rpc/ajax/js/ui.js",
    "data/ronin/gen/php/rpc/console_service.php",
    "data/ronin/gen/php/rpc/msgpack.php",
    "data/ronin/gen/php/rpc/rpc_server.php",
    "data/ronin/gen/php/rpc/server.php.erb",
    "data/ronin/gen/php/rpc/service.php",
    "data/ronin/gen/php/rpc/shell_service.php",
    "data/ronin/php/rfi/backdoor.php",
    "data/ronin/php/rfi/test.php",
    "data/ronin/php/rpc/server.ajax.php",
    "data/ronin/php/rpc/server.php",
    "lib/ronin/exploits/php.rb",
    "lib/ronin/exploits/php/lfi.rb",
    "lib/ronin/exploits/php/rfi.rb",
    "lib/ronin/gen/generators/php/rpc_server.rb",
    "lib/ronin/payloads/php.rb",
    "lib/ronin/payloads/php/backdoor.rb",
    "lib/ronin/payloads/php/rpc.rb",
    "lib/ronin/php.rb",
    "lib/ronin/php/config.rb",
    "lib/ronin/php/extensions.rb",
    "lib/ronin/php/extensions/string.rb",
    "lib/ronin/php/lfi.rb",
    "lib/ronin/php/lfi/exceptions.rb",
    "lib/ronin/php/lfi/exceptions/unknown_signature.rb",
    "lib/ronin/php/lfi/extensions.rb",
    "lib/ronin/php/lfi/extensions/uri.rb",
    "lib/ronin/php/lfi/extensions/uri/http.rb",
    "lib/ronin/php/lfi/file.rb",
    "lib/ronin/php/lfi/lfi.rb",
    "lib/ronin/php/lfi/scanner.rb",
    "lib/ronin/php/lfi/signature.rb",
    "lib/ronin/php/lfi/signatures.rb",
    "lib/ronin/php/lfi/signatures/configs.rb",
    "lib/ronin/php/lfi/signatures/logs.rb",
    "lib/ronin/php/lfi/signatures/tests.rb",
    "lib/ronin/php/rfi.rb",
    "lib/ronin/php/rfi/extensions.rb",
    "lib/ronin/php/rfi/extensions/uri.rb",
    "lib/ronin/php/rfi/extensions/uri/http.rb",
    "lib/ronin/php/rfi/rfi.rb",
    "lib/ronin/php/rfi/scanner.rb",
    "lib/ronin/php/version.rb",
    "lib/ronin/rpc/php.rb",
    "lib/ronin/rpc/php/call.rb",
    "lib/ronin/rpc/php/client.rb",
    "lib/ronin/rpc/php/console.rb",
    "lib/ronin/rpc/php/response.rb",
    "lib/ronin/rpc/php/rfi.rb",
    "lib/ronin/rpc/php/shell.rb",
    "ronin-php.gemspec",
    "spec/exploits/php/helpers/database.rb",
    "spec/helpers/database.rb",
    "spec/php/rfi_spec.rb",
    "spec/php_spec.rb",
    "spec/rpc/php/rfi_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.has_rdoc = %q{yard}
  s.homepage = %q{http://github.com/ronin-ruby/ronin-php}
  s.licenses = ["GPL-2"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{A Ruby library for Ronin that provides support for PHP related security tasks.}
  s.test_files = [
    "spec/exploits/php/helpers/database.rb",
    "spec/helpers/database.rb",
    "spec/php/rfi_spec.rb",
    "spec/php_spec.rb",
    "spec/rpc/php/rfi_spec.rb",
    "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<uri-query_params>, ["~> 0.4.0"])
      s.add_runtime_dependency(%q<data_paths>, ["~> 0.2.1"])
      s.add_runtime_dependency(%q<ffi-msgpack>, ["~> 0.1.4"])
      s.add_runtime_dependency(%q<ronin-support>, ["~> 0.1.0"])
      s.add_runtime_dependency(%q<ronin>, ["~> 0.4.0"])
      s.add_runtime_dependency(%q<ronin-scanners>, ["~> 0.2.0"])
      s.add_runtime_dependency(%q<ronin-web>, ["~> 0.3.0"])
      s.add_runtime_dependency(%q<ronin-exploits>, ["~> 0.4.0"])
      s.add_development_dependency(%q<cssmin>, ["~> 1.0.2"])
      s.add_development_dependency(%q<jsmin>, ["~> 1.0.1"])
      s.add_development_dependency(%q<ronin-gen>, ["~> 0.3.0"])
      s.add_development_dependency(%q<rake>, ["~> 0.8.7"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.0.pre"])
      s.add_development_dependency(%q<rspec>, ["~> 2.0.0"])
    else
      s.add_dependency(%q<uri-query_params>, ["~> 0.4.0"])
      s.add_dependency(%q<data_paths>, ["~> 0.2.1"])
      s.add_dependency(%q<ffi-msgpack>, ["~> 0.1.4"])
      s.add_dependency(%q<ronin-support>, ["~> 0.1.0"])
      s.add_dependency(%q<ronin>, ["~> 0.4.0"])
      s.add_dependency(%q<ronin-scanners>, ["~> 0.2.0"])
      s.add_dependency(%q<ronin-web>, ["~> 0.3.0"])
      s.add_dependency(%q<ronin-exploits>, ["~> 0.4.0"])
      s.add_dependency(%q<cssmin>, ["~> 1.0.2"])
      s.add_dependency(%q<jsmin>, ["~> 1.0.1"])
      s.add_dependency(%q<ronin-gen>, ["~> 0.3.0"])
      s.add_dependency(%q<rake>, ["~> 0.8.7"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.0.pre"])
      s.add_dependency(%q<rspec>, ["~> 2.0.0"])
    end
  else
    s.add_dependency(%q<uri-query_params>, ["~> 0.4.0"])
    s.add_dependency(%q<data_paths>, ["~> 0.2.1"])
    s.add_dependency(%q<ffi-msgpack>, ["~> 0.1.4"])
    s.add_dependency(%q<ronin-support>, ["~> 0.1.0"])
    s.add_dependency(%q<ronin>, ["~> 0.4.0"])
    s.add_dependency(%q<ronin-scanners>, ["~> 0.2.0"])
    s.add_dependency(%q<ronin-web>, ["~> 0.3.0"])
    s.add_dependency(%q<ronin-exploits>, ["~> 0.4.0"])
    s.add_dependency(%q<cssmin>, ["~> 1.0.2"])
    s.add_dependency(%q<jsmin>, ["~> 1.0.1"])
    s.add_dependency(%q<ronin-gen>, ["~> 0.3.0"])
    s.add_dependency(%q<rake>, ["~> 0.8.7"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.0.pre"])
    s.add_dependency(%q<rspec>, ["~> 2.0.0"])
  end
end

