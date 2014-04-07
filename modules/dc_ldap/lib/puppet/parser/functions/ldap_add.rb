require_relative '../../../ldap_helper'
require 'net/ldap'

module Puppet::Parser::Functions
  newfunction(:ldap_add, :type => :rvalue) do |args|
    extend LDAPHelper
    host, port, admin_user, admin_password, params = args
    ldap = Net::LDAP.new(:host => host, :port => port, :method => :simple,
                          :username => admin_user, :password => admin_password)
    ldap.bind
    ldap.add(:dn => full_username(params[:username]),
      :attributes => {
      :cn => "#{params[:first_name]} #{params[:last_name]}",
      :givenName => params[:first_name],
      :objectClass => object_classes,
      :sn => params[:last_name],
      :mail => params[:email],
      :uid => params[:username],
      :userPassword => "{SHA}#{Digest::SHA1.base64digest(params[:password])}"
    })
  end
end