require_relative '../../../ldap_helper'
require 'net/ldap'

module Puppet::Parser::Functions
  newfunction(:ldap_modify, :type => :rvalue) do |args|
    extend LDAPHelper
    ldap = ldap(args)
    ldap.modify(params(args))
    return_code_and_message(ldap)
  end
end