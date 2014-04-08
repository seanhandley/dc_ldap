require_relative '../../../ldap_helper'
require 'net/ldap'

module Puppet::Parser::Functions
  newfunction(:ldap_add, :type => :rvalue) do |args|
    extend LDAPHelper
    ldap(args).add(args[4])
  end
end