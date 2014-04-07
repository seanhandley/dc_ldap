
require 'spec_helper'

describe "ldapadd function" do
	let(:scope) { PuppetlabsSpec::PuppetInternals.scope }

	it "should return hello" do
	  scope.function_ldap_add([]).should == "hello"
	end
end
