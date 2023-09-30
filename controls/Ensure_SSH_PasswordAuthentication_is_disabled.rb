control "RHEL8_Check_SSH_Password_authentication_is_disabled" do
    title "RHEL8 Ensure SSH Password authentication_is_disabled"
    desc  "Check that SSH Password authentication is disabled"
    impact 'critical'
    tag scc_category: 'OPEN_SSH_PORT'
    tag resource_type: 'compute.Network'
  
    describe sshd_config do
      its('PasswordAuthentication') { should eq 'no' }
    end
  end
