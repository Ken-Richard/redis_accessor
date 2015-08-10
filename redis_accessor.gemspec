Gem::Specification.new do |s|
  s.name         = "redis_accessor"
  s.version      = "1.0.0"
  s.author       = "Colin Schultz"
  s.email        = "colin.schultz@aeseducation.com"
  s.summary      = "Allows easy access of curriculum data within Redis"
  s.description  = "Takes a Redis instance an reaches inside of it to extract information about templates, modules and units"
  s.licenses     = ['MIT']

  s.files         = Dir["{bin,lib,spec}/**/*"]
  s.test_files    = Dir["spec/**/*"]

  s.required_ruby_version = '>=1.9'
  s.add_development_dependency 'rspec'
end