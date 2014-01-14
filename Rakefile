# encoding: utf-8

require 'net/http'
require 'json'

resources = JSON.load(File.read("resources.json"))

def fetch(uri, dest)
  uri = URI.parse(uri)
  resp = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
    request = Net::HTTP::Get.new uri.request_uri
    http.request request
  end
  File.open(dest, 'w') { |file| file.write(resp.body) }
end

def sym(src, dest)
  full_src = File.expand_path(src)
  full_dest = File.expand_path(dest)

  if File.exists? full_dest
    puts "File #{dest} exists, please back-it-up."
  else
    File.symlink(full_src, full_dest)
  end
end

def spawner(cmd)
  pid = Process.spawn(cmd)
  trap('INT') {
    Process.kill(pid, 9)
    exit 0
  }
  Process.wait(pid)
end

# Install everything
task :install => "install:all"

namespace :install do
  # Symlink bash config
  task :bash do
    sym("Bash/bashrc", "~/.bashrc")
  end

  # Get all fonts
  task :fonts do
    resources["Fonts"].each do |font|
      dest = "Fonts/#{font["name"]}"
      puts "Downloading #{font["name"]}..."
      fetch font["uri"], dest
    end
    sym("Fonts", "~/.fonts")
  end

  # Symlink Git config
  task :git do
    sym("Git/gitignore", "~/.gitignore.global")
    sym("Git/gitconfig", "~/.gitconfig")
  end

  # Symlink Ruby stuff
  task :ruby do
    sym("Ruby/gemrc", "~/.gemrc")
  end

  # Symlink Scala & SBT config
  task :scala do
    sym("Scala/sbtconfig", "~/.sbtconfig")
  end

  # Symlink tmux config
  task :tmux do
    sym("Tmux/tmux.conf", "~/.tmux.conf")
  end

  # Get all plugins and symlink Vim config
  task :vim => "update:vim" do
    sym("Vim/vimrc", "~/.vimrc")
    sym("Vim", "~/.vim")
  end

  # Symlink zshrc
  task :zsh do
    # TODO: install oh-my-zsh & extra plugins
    sym("Zsh/zshrc", "~/.zshrc")
  end

  task :all => [:bash, :fonts, :git, :ruby, :scala, :vim, :tmux, :zsh, "update:all"]

  # Symlink OpenBox config
  task :openbox do
    # TODO
  end

  # Symlink Xmodmap
  task :xmodmap do
    sym("Xorg/Xmodmap", "~/.Xmodmap")
  end
end


# update all
task :update => "update:all"

namespace :update do
  # Update and/or initialize git submodules
  task :git do
    spawner('git submodule update --init')
  end

  # Download Vim resources & update plugin submodules
  task :vim => :git do
    resources["Vim"].each do |res_name, res_list|
      res_list.each do |res|
        dest = "Vim/#{res_name}/#{res["name"]}"
        puts "Downloading #{res["name"]}..."
        fetch res["uri"], dest
      end
    end
  end

  # Update oh-my-zsh
  task :zsh do
    # TODO
  end

  # update all
  task :all => [:git, :vim]
end
