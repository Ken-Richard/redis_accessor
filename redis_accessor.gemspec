Gem::Specification.new do |s|
  s.name         = "redis_accessor"
  s.version      = "1.0.0"
  s.author       = "Colin Schultz"
  s.email        = "colin.schultz@aeseducation.com"
  s.summary      = "Allows easy access of curriculum data within Redis"
  s.description  = File.read(File.join(File.dirname(__FILE__), 'README'))
  s.licenses     = ['MIT']

  s.files         = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE README)
  s.test_files    = Dir["spec/**/*"]

  s.required_ruby_version = '>=1.9'
  s.add_development_dependency 'rspec'
end