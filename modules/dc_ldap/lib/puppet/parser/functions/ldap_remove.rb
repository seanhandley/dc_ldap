require_relative '../../../ldap_helper'
require 'net/ldap'

module Puppet::Parser::Functions
  newfunction(:ldap_remove, :type => :rvalue) do |args|
    extend LDAPHelper
    ldap(args).remove(args[4])
  end
end