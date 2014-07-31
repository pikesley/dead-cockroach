Then /^the response should be JSON:$/ do |json|
  JSON.parse(page.body).should == JSON.parse(json)
end
