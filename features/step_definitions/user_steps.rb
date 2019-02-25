Given /^the upgrade feature is broken$/ do
  allow_any_instance_of(User).to receive(:upgrade_to_premium).and_return(false)
end
