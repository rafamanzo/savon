# -*- encoding : utf-8 -*-
lib = File.expand_path("../lib", __FILE__)
$:.unshift lib unless $:.include? lib

require "savon/version"

Gem::Specification.new do |s|
  s.name        = "savon-ng-1.6"
  s.version     = Savon::VERSION
  s.authors     = "Rafael Reggiani Manzo"
  s.email       = "rr.manzo@gmail.com"
  s.homepage    = "http://savonrb.com"
  s.summary     = "This a fork from Daniel Harrington's savon with nokogiri updated to 1.6"
  s.description = s.summary

  s.rubyforge_project = s.name
  s.license = 'MIT'

  s.add_dependency "nori",     "~> 2.3.0"

  s.add_dependency "nokogiri",      ">= 1.4.0"
  s.add_dependency "httpi",         "~> 2.1.0"
  s.add_dependency "wasabi-ng-1.6", "~> 3.3.0"
  s.add_dependency "akami",         "~> 1.2.0"
  s.add_dependency "gyoku",         "~> 1.1.0"

  s.add_dependency "builder",  ">= 2.1.2"

  s.add_development_dependency "rack"
  s.add_development_dependency "puma",  "2.0.0.b4"

  s.add_development_dependency "rake",  "~> 10.1"
  s.add_development_dependency "rspec", "~> 2.14"
  s.add_development_dependency "mocha", "~> 0.14"
  s.add_development_dependency "json",  "~> 1.7"

  ignores  = File.readlines(".gitignore").grep(/\S+/).map(&:chomp)
  dotfiles = %w[.gitignore .travis.yml .yardopts]

  all_files_without_ignores = Dir["**/*"].reject { |f|
    File.directory?(f) || ignores.any? { |i| File.fnmatch(i, f) }
  }

  s.files = (all_files_without_ignores + dotfiles).sort

  s.require_path = "lib"
end
