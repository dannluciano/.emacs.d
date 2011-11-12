# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rparsec}
  s.version = "1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ben Yu"]
  s.autorequire = %q{rparsec}
  s.date = %q{2011-09-01}
  s.description = %q{rparsec is a recursive descent parser combinator framework. Declarative API allows creating parser intuitively and dynamically.}
  s.email = %q{ajoo.email@gmail.com}
  s.files = ["rparsec/token.rb", "rparsec/keywords.rb", "rparsec/error.rb", "rparsec/misc.rb", "rparsec/functors.rb", "rparsec/monad.rb", "rparsec/expressions.rb", "rparsec/operators.rb", "rparsec/parsers.rb", "rparsec/parser.rb", "rparsec/context.rb", "rparsec/locator.rb", "rparsec/parser_monad.rb", "rparsec/id_monad.rb", "rparsec.rb", "test/src/simple_parser_test.rb", "test/src/s_expression_test.rb", "test/src/functor_test.rb", "test/src/sql.rb", "test/src/scratch.rb", "test/src/tests.rb", "test/src/sql_parser.rb", "test/src/keyword_test.rb", "test/src/parser_test.rb", "test/src/import.rb", "test/src/perf_benchmark.rb", "test/src/simple_monad_test.rb", "test/src/expression_test.rb", "test/src/operator_test.rb", "test/src/sql_test.rb", "test/src/full_parser_test.rb"]
  s.require_paths = ["."]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{A Ruby Parser Combinator Framework}
  s.test_files = ["test/src/simple_parser_test.rb", "test/src/s_expression_test.rb", "test/src/functor_test.rb", "test/src/sql.rb", "test/src/scratch.rb", "test/src/tests.rb", "test/src/sql_parser.rb", "test/src/keyword_test.rb", "test/src/parser_test.rb", "test/src/import.rb", "test/src/perf_benchmark.rb", "test/src/simple_monad_test.rb", "test/src/expression_test.rb", "test/src/operator_test.rb", "test/src/sql_test.rb", "test/src/full_parser_test.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
