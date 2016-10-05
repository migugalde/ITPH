# -*- encoding: utf-8 -*-
# stub: path_expander 1.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "path_expander".freeze
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ryan Davis".freeze]
  s.cert_chain = ["-----BEGIN CERTIFICATE-----\nMIIDPjCCAiagAwIBAgIBAzANBgkqhkiG9w0BAQUFADBFMRMwEQYDVQQDDApyeWFu\nZC1ydWJ5MRkwFwYKCZImiZPyLGQBGRYJemVuc3BpZGVyMRMwEQYKCZImiZPyLGQB\nGRYDY29tMB4XDTE1MDkxOTIwNTEyMloXDTE2MDkxODIwNTEyMlowRTETMBEGA1UE\nAwwKcnlhbmQtcnVieTEZMBcGCgmSJomT8ixkARkWCXplbnNwaWRlcjETMBEGCgmS\nJomT8ixkARkWA2NvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALda\nb9DCgK+627gPJkB6XfjZ1itoOQvpqH1EXScSaba9/S2VF22VYQbXU1xQXL/WzCkx\ntaCPaLmfYIaFcHHCSY4hYDJijRQkLxPeB3xbOfzfLoBDbjvx5JxgJxUjmGa7xhcT\noOvjtt5P8+GSK9zLzxQP0gVLS/D0FmoE44XuDr3iQkVS2ujU5zZL84mMNqNB1znh\nGiadM9GHRaDiaxuX0cIUBj19T01mVE2iymf9I6bEsiayK/n6QujtyCbTWsAS9Rqt\nqhtV7HJxNKuPj/JFH0D2cswvzznE/a5FOYO68g+YCuFi5L8wZuuM8zzdwjrWHqSV\ngBEfoTEGr7Zii72cx+sCAwEAAaM5MDcwCQYDVR0TBAIwADALBgNVHQ8EBAMCBLAw\nHQYDVR0OBBYEFEfFe9md/r/tj/Wmwpy+MI8d9k/hMA0GCSqGSIb3DQEBBQUAA4IB\nAQB+Hx8xUgrpZa4P8H8gR8zme5kISwQrG80MbpqJV6/G3/ZicRFhN5sjwu0uHGue\nbd9Cymf6oIRwHVarJux2M32T6bL07Hmi07w2QaPc3MnMKB/D46SRZ2JSSGPFRBTc\nSilobMRoGs/7B15uGFUEnNrCB/ltMqhwwSx1r++UQPfeySHEV9uqu03E5Vb7J37O\n2Er6PLXHRiYsIycD1LkMi6YnixdITRHmrqJYE2rsjaIfpIehiusVAPHkNf7qbpHq\nqx3h45R1CAsObX0SQDIT+rRbQrtKz1GHIZTOFYvEJjUY1XmRTZupD3CJ8Q7sDqSy\nNLq5jm1fq6Y9Uolu3RJbmycf\n-----END CERTIFICATE-----\n".freeze]
  s.date = "2016-05-13"
  s.description = "PathExpander helps pre-process command-line arguments expanding\ndirectories into their constituent files. It further helps by\nproviding additional mechanisms to make specifying subsets easier\nwith path subtraction and allowing for command-line arguments to be\nsaved in a file.\n\nNOTE: this is NOT an options processor. It is a path processor\n(basically everything else besides options). It does provide a\nmechanism for pre-filtering cmdline options, but not with the intent\nof actually processing them in PathExpander. Use OptionParser to\ndeal with options either before or after passing ARGV through\nPathExpander.".freeze
  s.email = ["ryand-ruby@zenspider.com".freeze]
  s.extra_rdoc_files = ["History.rdoc".freeze, "Manifest.txt".freeze, "README.rdoc".freeze]
  s.files = ["History.rdoc".freeze, "Manifest.txt".freeze, "README.rdoc".freeze]
  s.homepage = "https://github.com/seattlerb/path_expander".freeze
  s.licenses = ["MIT".freeze]
  s.rdoc_options = ["--main".freeze, "README.rdoc".freeze]
  s.rubygems_version = "2.6.7".freeze
  s.summary = "PathExpander helps pre-process command-line arguments expanding directories into their constituent files".freeze

  s.installed_by_version = "2.6.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rdoc>.freeze, ["~> 4.0"])
      s.add_development_dependency(%q<hoe>.freeze, ["~> 3.15"])
    else
      s.add_dependency(%q<rdoc>.freeze, ["~> 4.0"])
      s.add_dependency(%q<hoe>.freeze, ["~> 3.15"])
    end
  else
    s.add_dependency(%q<rdoc>.freeze, ["~> 4.0"])
    s.add_dependency(%q<hoe>.freeze, ["~> 3.15"])
  end
end
