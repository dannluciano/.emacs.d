# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{sexp}
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Topher Cyll"]
  s.date = %q{2008-08-29}
  s.email = %q{christophercyll@gmail.com}
  s.files = ["sexp.rb", "sexpressions.rb"]
  s.homepage = %q{http://rubyforge.org/projects/sexp/}
  s.require_paths = ["."]
  s.rubyforge_project = %q{sexp}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{SExpression Reading/Writing for Ruby}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rparsec>, [">= 1.0"])
    else
      s.add_dependency(%q<rparsec>, [">= 1.0"])
    end
  else
    s.add_dependency(%q<rparsec>, [">= 1.0"])
  end
end
