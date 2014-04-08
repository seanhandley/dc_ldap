require_relative '../../../ldap_helper'
require 'net/ldap'

module Puppet::Parser::Functions
  newfunction(:ldap_modify, :type => :rvalue) do |args|
    extend LDAPHelper
    ldap(args).modify(args[4])
  end
end