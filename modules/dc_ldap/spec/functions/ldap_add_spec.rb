
require 'spec_helper'

describe "ldap_add function" do
  include LDAPSetup

	let(:scope) { PuppetlabsSpec::PuppetInternals.scope }

  before(:each) do
    ldap_setup
    @ldap_entry = {:dn => 'uid=testy_test,ou=People,dc=datacentred,dc=co,dc=uk',
                   :attributes => {
                     :cn => 'Testy Tester', :givenName => 'Testy',
                     :objectClass => ['top', 'person', 'inetorgPerson'],
                     :sn => 'Tester', :mail => 'testy@test.com', 
                     :uid => 'testy_test',
                     :userPassword => '{SHA}6d3L1UCJtULYvBnp47aqAvjtfM8='}}
    @params = @server_details.push(@ldap_entry)
  end

  [true, false].each do |bool|
  	it "should react to success" do
      @mock_ldap.expects(:add).with(@ldap_entry).returns(bool)
      scope.function_ldap_add(@params).should == bool
  	end
  end
end
