# encoding: utf-8

require 'fileutils'
require 'net/http'
require 'json'

resources = JSON.load(File.read("resources.json"))

def fetch(uri, dest)
  full_dest = File.expand_path(dest)
  FileUtils.mkpath File.dirname(full_dest)

  uri = URI.parse(uri)
  resp = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
    request = Net::HTTP::Get.new uri.request_uri
    http.request request
  end
  File.open(dest, 'w') { |file| file.write(resp.body) }
end

def backup(src, full_dest)
  # Backup (mv) a file from full_dest to a backup folder
  backup_dir = "Backup"
  src_filename = File.basename(src)
  backup_dest = File.expand_path("#{backup_dir}/#{src_filename}")

  FileUtils.mkpath File.expand_path(backup_dir)
  FileUtils.mv full_dest, backup_dest

  if File.size? backup_dest
    puts "Backup of #{src_filename} created in #{backup_dest}"
  else
    File.unlink backup_dest
  end
end

def sym(src, dest)
  # Symlink a relative path from src to dest (an actual "dotfile" location)
  # If a previous dotfile exists, it gets moved to backup folder
  full_src = File.expand_path(src)
  full_dest = File.expand_path(dest)

  if File.exists? full_dest
    backup(src, full_dest)
  end

  File.symlink(full_src, full_dest)
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

  # Symlink Clojure and Leinigen config
  task :clojure do
    spawner("mkdir -p ~/.lein")
    sym("Clojure/profiles.clj", "~/.lein/profiles.clj")
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
    spawner("touch Vim/local.vim")
    sym("Vim/vimrc", "~/.vimrc")
    sym("Vim", "~/.vim")
    spawner("mkdir ~/.vim/swapfiles/")
  end

  # Symlink zshrc
  task :zsh do
    spawner("mkdir -p ~/.zsh")
    sym("Zsh/autocomplete", "~/.zsh/autocomplete")
    sym("Zsh/zshrc", "~/.zshrc")
  end

  task :all => [:bash, :clojure, :fonts, :git, :ruby, :scala, :vim, :tmux, :zsh, "update:all"]

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

  # update all
  task :all => [:git, :vim]
end


namespace :patch do
  task :openbsd do
    sym("Tmux/openbsd.tmux.conf", "~/.tmux.conf.local")
  end

  task :osx do
    sym("Zsh/osx.sh", "~/.zsh/platform.sh")
  end
end
