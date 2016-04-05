class Consulcli < FPM::Cookery::Recipe
  name 'consul-cli'

  version '0.2.0'
  revision '1'
  description 'CLI to query and manage Consul.'

  homepage 'https://github.com/CiscoCloud/consul-cli'
  source "https://github.com/CiscoCloud/consul-cli/releases/download/v#{version}/consul-cli_#{version}_linux_amd64.tar.gz"
  sha256 '0282b3a76c642cb7b541c53254d0d847aba083b7ae586e1fbfba5c83370715e2'

  maintainer 'Darron Froese <darron@froese.org>'
  vendor 'octohost'

  license 'Mozilla Public License, version 2.0'

  def build
    safesystem "mkdir -p #{builddir}/usr/local/bin/"
    safesystem "cp -f #{builddir}/consul-cli-#{version}/consul-cli-#{version} #{builddir}/usr/local/bin/consul-cli"
    safesystem "chmod 755 #{builddir}/usr/local/bin/consul-cli"
  end

  def install
    safesystem "mkdir -p #{destdir}/usr/local/bin/"
    safesystem "cp -f #{builddir}/usr/local/bin/consul-cli #{destdir}/usr/local/bin/consul-cli"
  end
end
