# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "maruku"
  s.version = "0.7.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Andrea Censi", "Nathan Weizenbaum", "Ben Hollis"]
  s.cert_chain = ["-----BEGIN CERTIFICATE-----\nMIIDbDCCAlSgAwIBAgIBATANBgkqhkiG9w0BAQUFADA+MQwwCgYDVQQDDANiZW4x\nGTAXBgoJkiaJk/IsZAEZFgliZW5ob2xsaXMxEzARBgoJkiaJk/IsZAEZFgNuZXQw\nHhcNMTQwNTI2MjExNjI2WhcNMTUwNTI2MjExNjI2WjA+MQwwCgYDVQQDDANiZW4x\nGTAXBgoJkiaJk/IsZAEZFgliZW5ob2xsaXMxEzARBgoJkiaJk/IsZAEZFgNuZXQw\nggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCYZvEbHldtIRP8nQNyM6SQ\noqi6pF1VznSiOzVIZi84MnTwab4jl4pEso/tnjpm+jpHoFc1RhJMwwaO9v0ih5/e\nVRZFZQyoKrPaP9Dq3q1iO9SXwoucGfoVCcvtfF2DGnFlkDZlswPWNdL/GTxuiM6X\ndzQ36hzSSZrgTms1AdPSuCHt3LTNRDSkpRGqDWdsPbKLi7eLSkGbUO1Ibe8JAtdE\nueSaVAksFJvNgUxZHMSBkSrd33PRpiSi2g6IvogoeWGj+4vxJgGbPGGWHmsfVT28\nggEdA8Ix8y223pCovPUJtCEoEdoNxTq7NUA9lUL2rZ0URc2jCiEKzQmtRAf8ZWSn\nAgMBAAGjdTBzMAkGA1UdEwQCMAAwCwYDVR0PBAQDAgSwMB0GA1UdDgQWBBSL7ijr\nkd/8I5COGX6gWvHNSCPyTDAcBgNVHREEFTATgRFiZW5AYmVuaG9sbGlzLm5ldDAc\nBgNVHRIEFTATgRFiZW5AYmVuaG9sbGlzLm5ldDANBgkqhkiG9w0BAQUFAAOCAQEA\nPHS/jYQNXccqlZVJUVz5hlkXCslHZs8OqfzOIPRQ4VZZY/USERfDCHou8eQRxeOG\nUx9/jfp35TQRC/1OEx/7mDhixRo3vYCdHHUUUKOdko9VWSyTrTmVLq6V1Iwu7TCe\nK+yasGZ4CfUqUaK+MgFLEEI8k0q2TmRd534a3C6nGS69x9HmIqJISlpvwNYr1YCX\nmk4SFXYX0a5PWeGRiIKg4vPQy4PG1oFAN7+mAgSGNRtMG3Sx4qkMaYLfW0wd7zZ9\nIjHSEqEpekJnAXUJNPdgIBHUVUMNfcnULDPNzaBckgjGm0PqFMlknEOk+NxoXt7m\nouF3Zkp3xx1U+2uMJ1SVRg==\n-----END CERTIFICATE-----\n"]
  s.date = "2014-05-26"
  s.description = "Maruku is a Markdown interpreter in Ruby.\n\tIt features native export to HTML and PDF (via Latex). The\n\toutput is really beautiful!"
  s.email = "ben@benhollis.net"
  s.executables = ["maruku", "marutex"]
  s.files = ["bin/maruku", "bin/marutex"]
  s.homepage = "http://github.com/bhollis/maruku"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7")
  s.rubygems_version = "2.0.14"
  s.summary = "Maruku is a Markdown-superset interpreter written in Ruby."
end
