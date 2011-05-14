Spree Multi Outlet
=================

Adds Nested Store/Outlet Support to Spree.

Extends spree_multi_domain to have nested stores so that products in child stores show up in the parent stores.
This allows you to have redshop.example.com blueshop.example.com and www.example.com where www.example.com would show products avalible in all 3 stores.


Install
=======

Add to you Gemfile:
`gem "spree_multi_domain", :git => 'git://github.com/spree/spree-multi-domain.git'`
`gem "spree_multi_outlet", :git => 'git://github.com/complistic-gaff/spree-multi-outlet.git'`

Then run these commands from your rails root

`bundle install`
`rake spree_multi_outlet:install`
`rake db:migrate`


Copyright (c) 2011 David Bennett, released under the New BSD License
