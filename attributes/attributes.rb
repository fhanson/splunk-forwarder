case node["platform"]
when "redhat", "centos", "amazon", "ubuntu"
  default['splunk-forwarder']['installer'] = "splunkforwarder-6.0.5-214064-linux-2.6-x86_64.rpm"
  default['splunk-forwarder']['download_url'] = "http://download.splunk.com/products/splunk/releases/6.0.5/universalforwarder/linux/splunkforwarder-6.0.5-214064-linux-2.6-x86_64.rpm"
when "windows"
  default['splunk-forwarder']['installer'] = "c:\\chef\cache\\splunk-6.0.5-214064-x64-release.msi"
  default['splunk-forwarder']['download_url'] = "http://download.splunk.com/products/splunk/releases/6.0.5/splunk/windows/splunk-6.0.5-214064-x64-release.msi"
end
