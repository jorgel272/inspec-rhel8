control "RHEL8_Check_SSH_Allow_Tcp_Forwarding_is_disabled" do
  title "RHEL8 Ensure SSH Allow Tcp Forwarding_is_disabled"
  desc  "Check that SSH TCP Forwarding is disabled"
  impact 'high'
  tag scc_category: 'OPEN_SSH_PORT'
  tag resource_type: 'compute'
  tag project_id: project_id

  describe sshd_config do
    its('AllowTcpForwarding') { should eq 'no' }
  end
end
