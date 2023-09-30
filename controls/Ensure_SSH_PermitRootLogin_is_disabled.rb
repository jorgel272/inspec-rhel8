control "RHEL8_Check_SSH_Permit_Root_Login_is_disabled" do
  title "RHEL8 Ensure SSH Permit Root Login_is_disabled"
  desc  "Check that SSH root login is disabled"
  impact 'critical'
  tag scc_category: 'OPEN_SSH_PORT'
  tag resource_type: 'compute.Network'
  tag findingClass: 'MISCONFIGURATION'

  describe sshd_config do
    its('PermitRootLogin') { should eq 'no' }
  end
end
