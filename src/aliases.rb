# Configure BASH aliases
class Aliases
  attr_accessor :application_root, :config

  def initialize(application_root, config)
    @application_root = application_root
    @config = config
  end

  def configure
    aliases = application_root + '/../.bash_aliases'
    return unless File.exist?(aliases)

    config.vm.provision :shell,
                        inline: 'rm -f /home/vagrant/.bash_aliases'

    config.vm.provision :file,
                        source: aliases,
                        destination: '/home/vagrant/.bash_aliases'
  end
end
