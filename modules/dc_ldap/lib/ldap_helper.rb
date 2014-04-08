module LDAPHelper

  def ldap(args)
    host, port, admin_user, admin_password, _ = args
    ldap = Net::LDAP.new(:host => host, :port => port, :method => :simple,
                          :username => admin_user, :password => admin_password)
    ldap.bind
    ldap
  end
  
end