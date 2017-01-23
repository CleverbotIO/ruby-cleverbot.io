Gem::Specification.new do |s|
  s.authors = ['Eli Foster']
  s.name = 'cleverbot_io'
  s.summary = 'A Ruby wrapper for the Cleverbot.io web API.'
  s.version = '1.2.3'
  s.license = 'MIT'
  s.description = 'A fully featured wrapper to the Cleverbot.io web API.'
  s.email = 'elifosterwy@gmail.com'
  s.homepage = 'https://github.com/CleverbotIO/ruby-cleverbot.io'
  s.metadata = {
    'issue_tracker' => 'https://github.com/CleverobtIO/ruby-cleverbot.io/issues'
  }
  s.files = [
    'lib/cleverbot.rb',
    'lib/cleverbot_errors.rb',
    'CHANGELOG.md'
  ]
  s.add_runtime_dependency('httpclient', '~> 2.8')
  s.add_runtime_dependency('oj', '~> 2.15')
end
