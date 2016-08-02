class Consulcli < FPM::Cookery::Recipe
  name 'consul-cli'

  version '0.3.1'
  revision '1'
  description 'CLI to query and manage Consul.'

  homepage 'https://github.com/CiscoCloud/consul-cli'
  source "https://github.com/CiscoCloud/consul-cli/releases/download/v#{version}/consul-cli_#{version}_linux_amd64.tar.gz"
  sha256 '037150d3d689a0babf4ba64c898b4497546e2fffeb16354e25cef19867e763f1'

  maintainer 'Darron Froese <darron@froese.org>'
  vendor 'octohost'

  license 'Mozilla Public License, version 2.0'

  def build
    safesystem "mkdir -p #{builddir}/usr/local/bin/"
    safesystem "cp -f #{builddir}/consul-cli_#{version}_linux_amd64/consul-cli #{builddir}/usr/local/bin/consul-cli"
    safesystem "chmod 755 #{builddir}/usr/local/bin/consul-cli"
  end

  def install
    safesystem "mkdir -p #{destdir}/usr/local/bin/"
    safesystem "cp -f #{builddir}/usr/local/bin/consul-cli #{destdir}/usr/local/bin/consul-cli"
  end
end
