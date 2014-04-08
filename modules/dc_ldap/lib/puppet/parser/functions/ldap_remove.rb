require_relative '../../../ldap_helper'
require 'net/ldap'

module Puppet::Parser::Functions
  newfunction(:ldap_remove, :type => :rvalue) do |args|
    extend LDAPHelper
    ldap = ldap(args)
    ldap.remove(params(args))
    return_code_and_message(ldap)
  end
end