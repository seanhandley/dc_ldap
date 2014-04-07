require 'puppet'
require 'net/ldap'

module Puppet::Parser::Functions
  newfunction(:ldapadd, :type => :rvalue, :doc => <<-'ENDHEREDOC') do |args|
      This function will add an LDAP entry to a directory.

      Example:

        ldapadd("uid=joe,ou=People,dc=example,dc=net", "mail")

          Retrieve the value of the first 'mail' attribute from the given DN.

    ENDHEREDOC

    STDERR.puts "HERP"
    "hello"
  end
end