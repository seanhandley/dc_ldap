require 'spec_helper'

describe "ldap_modify function" do
  include LDAPSetup

  let(:scope) { PuppetlabsSpec::PuppetInternals.scope }

  before(:each) do
    ldap_setup
    @ldap_entry = {:dn => 'uid=testy_test,ou=People,dc=datacentred,dc=co,dc=uk',
                   :operations => [[:replace, :givenName, 'ZOMG']]}
    @params = @server_details.push(@ldap_entry)
  end

  [true, false].each do |bool|
    it "should react to success" do
      @mock_ldap.expects(:modify).with(@ldap_entry).returns(bool)
      scope.function_ldap_modify(@params).should == bool
    end
  end
end