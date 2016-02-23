Gem::Specification.new do |s|
  s.authors = ['Eli Foster']
  s.name = 'cleverbot_io'
  s.summary = 'A Ruby wrapper for the Cleverbot.io web API.'
  s.version = '1.0.0'
  s.license = 'CC-BY-NC-ND-4.0'
  s.description = 'A very basic wrapper to the Cleverbot.io web API.'
  s.email = 'elifosterwy@gmail.com'
  s.homepage = 'https://github.com/elifoster/cleverbot_io'
  s.metadata = {
    'issue_tracker' => 'https://github.com/elifoster/cleverbot_io/issues'
  }
  s.files = [
    'lib/cleverbot.rb',
    'CHANGELOG.md'
  ]
  s.add_runtime_dependency('httpclient', '2.7.1')
end