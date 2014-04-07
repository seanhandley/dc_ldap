module LDAPHelper

  def org_unit
    "People"
  end

  def dc
    ["datacentred","co","uk"]  
  end
  
  def object_classes
    ["top", "person", "inetorgPerson"]
  end

  def full_username(uid)
    "uid=#{uid},ou=#{org_unit},#{dc_string}"
  end

  def dc_string
    dc.map{|e| "dc=#{e}"}.join ','
  end
  
end