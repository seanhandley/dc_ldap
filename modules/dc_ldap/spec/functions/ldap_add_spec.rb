
require 'spec_helper'

describe "ldapadd function" do
	let(:scope) { PuppetlabsSpec::PuppetInternals.scope }

	it "should exist" do
	  Puppet::Parser::Functions.function("ldapadd").should == "function_ldapadd"
	end

	it "should return hello" do
	  scope.function_ldapadd().should == "hello"
	end
end
