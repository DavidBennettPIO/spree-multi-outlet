Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_multi_outlet'
  s.version     = '0.0.1'
  s.summary     = 'Adds Nested Store/Outlet Support to Spree'
  s.description = 'Extends spree_multi_domain to have nested stores so that products in child stores show up in the parent stores. This allows you to have redshop.example.com blueshop.example.com and www.example.com where www.example.com would show products avalible in all 3 stores.'
  s.required_ruby_version = '>= 1.8.7'

  s.author            = 'David Bennett'
  s.email             = 'david@bravevision.com'
  # s.homepage          = 'http://www.rubyonrails.org'
  # s.rubyforge_project = 'spree_multi_outlet'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency('spree_core', '>= 0.50.0')
  s.add_dependency('spree_multi_domain', '>= 3.0.4')
  
end
