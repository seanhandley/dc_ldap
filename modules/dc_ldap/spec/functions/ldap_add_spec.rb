
require 'spec_helper'

describe "ldapadd function" do
	let(:scope) { PuppetlabsSpec::PuppetInternals.scope }

  before(:each) do
    @ldap_entry = {username: 'testy_test', password: 'llama123',
               first_name: 'Testy', last_name: 'Tester',
               email: 'testy@test.com'}
    @server_details = ["127.0.0.1", 8389, 'admin', 'Qqb8QC_wBeK!gch']
    @params = @server_details.push(@ldap_entry)
    host, port, username, password = @server_details
    ldap_params = {host: host, username: username, password: password, port: port, method: :simple}
    @mock_ldap = mock(bind: true)
    @mock_ldap.expects(:add).returns(true)
    Net::LDAP.expects(:new).with(ldap_params).returns(@mock_ldap)
  end

	it "should return hello" do
	  scope.function_ldap_add(@params).should == true
	end
end
