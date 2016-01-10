require 'rbconfig'
# ruby 1.8.7 doesn't define RUBY_ENGINE
ruby_engine = defined?(RUBY_ENGINE) ? RUBY_ENGINE : 'ruby'
ruby_version = RbConfig::CONFIG["ruby_version"]
path = File.expand_path('..', __FILE__)
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/jmespath-1.1.3/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/aws-sdk-core-2.2.9/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/aws-sdk-resources-2.2.9/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/aws-sdk-2.2.9/lib"
$:.unshift "#{path}/"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/extensions/x86_64-linux/2.3.0/unf_ext-0.0.7.1"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/unf_ext-0.0.7.1/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/unf-0.1.4/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/domain_name-0.5.25/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/http-cookie-1.0.2/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/json-1.8.3/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/multi_xml-0.5.5/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/httparty-0.13.7/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/mime-types-2.99/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/netrc-0.11.0/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/rest-client-1.8.0/lib"
$:.unshift "#{path}/../#{ruby_engine}/#{ruby_version}/gems/mailgun-ruby-1.0.3/lib"
