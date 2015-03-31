# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "parslet"
  s.version = "1.7.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Kaspar Schiess"]
  s.date = "2015-03-12"
  s.email = "kaspar.schiess@absurd.li"
  s.extra_rdoc_files = ["README"]
  s.files = ["README"]
  s.homepage = "http://kschiess.github.io/parslet"
  s.licenses = ["MIT"]
  s.rdoc_options = ["--main", "README"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.14"
  s.summary = "Parser construction library with great error reporting in Ruby."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<blankslate>, ["<= 4.0", ">= 2.0"])
    else
      s.add_dependency(%q<blankslate>, ["<= 4.0", ">= 2.0"])
    end
  else
    s.add_dependency(%q<blankslate>, ["<= 4.0", ">= 2.0"])
  end
end
