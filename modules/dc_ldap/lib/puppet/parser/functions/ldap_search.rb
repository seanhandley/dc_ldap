require_relative '../../../ldap_helper'
require 'net/ldap'

module Puppet::Parser::Functions
  newfunction(:ldap_search, :type => :rvalue) do |args|
    extend LDAPHelper
    ldap = ldap(args)
    ldap.search(params(args).merge(filter: Net::LDAP::Filter.eq(*params(args)[:filter])),
                                         return_result: false)
    return_code_and_message(ldap)
  end
end