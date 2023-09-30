# Read inspec.yml to get the profile version
profile_data = yaml(content: inspec.profile.file('/./inspec.yml').content)
profile_version = profile_data.params['version']

control "RHEL8 Check SSH_MaxSessions_is_set_to_4_or_less" do
  title "RHEL8 Check SSH_MaxSessions_is_set_to_4_or_less"
  desc  "Protect against DDoS by opening a large amount of SSH sessions"
  impact 'high'
  tag scc_category: 'OPEN_SSH_PORT'
  tag resource_type: 'compute.Network'
  tag findingClass: 'MISCONFIGURATION'

  # Fetching the projectname input
  project = input('projectname')

  # Example of how you might utilize the project input
  # (Here, I'm just printing the project name to the console)
  describe "The GCP project being examined" do
    subject { project }
    it { should_not be_empty }
  end

  describe sshd_config do
    its('MaxSessions') { should cmp <= 4 }
    its('MaxSessions') { should cmp > 0 }
  end
end
