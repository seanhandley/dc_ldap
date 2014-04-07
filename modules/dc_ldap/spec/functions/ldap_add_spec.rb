
require 'spec_helper'

describe "ldapadd function" do
	let(:scope) { PuppetlabsSpec::PuppetInternals.scope }

	it "should return hello" do
    params = {username: 'testy_test', password: 'llama123',
                           first_name: 'Testy', last_name: 'Tester',
                           email: 'testy@test.com'}
	  scope.function_ldap_add(["127.0.0.1", 8389, 'admin', 'Qqb8QC_wBeK!gch', params]).should == true
	end
end
