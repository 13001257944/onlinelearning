# -*- encoding: utf-8 -*-
# stub: pickadate-rails 3.5.6.0 ruby lib

Gem::Specification.new do |s|
  s.name = "pickadate-rails".freeze
  s.version = "3.5.6.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jeff Fraser".freeze]
  s.date = "2015-06-09"
  s.description = "Add pickadate.js to Rails 3.1+ via the asset pipeline".freeze
  s.email = ["jfraser@breuer.com".freeze]
  s.homepage = "https://github.com/veracross/pickadate-rails".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.11".freeze
  s.summary = "Add pickadate.js to Rails 3.1+ via the asset pipeline. See http://amsul.ca/pickadate.js/ for more information about pickadate.js.".freeze

  s.installed_by_version = "2.6.11" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<railties>.freeze, [">= 3.1.0"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    else
      s.add_dependency(%q<railties>.freeze, [">= 3.1.0"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<railties>.freeze, [">= 3.1.0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
  end
end
