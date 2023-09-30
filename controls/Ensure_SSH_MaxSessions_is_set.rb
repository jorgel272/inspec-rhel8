control "RHEL8 Check SSH_MaxSessions_is_set_to_4_or_less" do
  title "RHEL8 Check SSH_MaxSessions_is_set_to_4_or_less"
  desc  "Protect against DDoS by opening a large amount of SSH sessions"
  impact 'high'
  tag scc_category: 'OPEN_SSH_PORT'
  tag resource_type: 'compute.Network'
 #tag project_id: project_id

  describe sshd_config do
    its('MaxSessions') { should cmp <= 4 }
    its('MaxSessions') { should cmp > 0 }
  end
end
