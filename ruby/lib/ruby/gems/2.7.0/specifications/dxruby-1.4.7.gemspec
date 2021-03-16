# -*- encoding: utf-8 -*-
# stub: dxruby 1.4.7 ruby lib

Gem::Specification.new do |s|
  s.name = "dxruby".freeze
  s.version = "1.4.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["mirichi".freeze]
  s.date = "2021-01-11"
  s.description = "2D game library for Windows(DirectX9)".freeze
  s.email = ["sawara01@gmail.com".freeze]
  s.homepage = "http://dxruby.osdn.jp/".freeze
  s.licenses = ["zlib/libpng".freeze]
  s.rubygems_version = "3.1.4".freeze
  s.summary = ":-)".freeze

  s.installed_by_version = "3.1.4" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
  end
end
