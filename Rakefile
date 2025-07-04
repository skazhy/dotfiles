# encoding: utf-8

require 'fileutils'
require 'net/http'
require 'json'

resources = JSON.load(File.read("resources.json"))

def fetch(resource, dest)
  puts "Downloading #{resource["name"]}..."
  full_dest = File.expand_path(dest)
  FileUtils.mkpath File.dirname(full_dest)

  uri = URI.parse(resource["uri"])
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
    spawner("mkdir -p ~/.clojure")
    spawner("mkdir -p ~/.shadow-cljs")
    sym("Clojure/profiles.clj", "~/.lein/profiles.clj")
    sym("Clojure/deps.edn", "~/.clojure/deps.edn")
    sym("Clojure/shadow-cljs-config.edn", "~/.shadow-cljs/config.edn")
  end

  # Get all fonts
  task :fonts do
    resources["Fonts"].each do |font|
      fetch font, "Fonts/#{font["name"]}"
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

  # Symlink Nix
  task :nix do
    spawner("mkdir -p ~/.config/nix")
    sym("Nix/nix.conf", "~/.config/nix/nix.conf")
  end

  # Symlink Haskell Stack stuff
  task :haskell do
    spawner("mkdir -p ~/.stack")
    sym("Haskell/stack_config.yaml", "~/.stack/config.yaml")
  end

  # Symlink Scala & SBT config
  task :scala do
    sym("Scala/sbtconfig", "~/.sbtconfig")
  end

  # Symlink tmux config
  task :tmux do
    sym("Tmux/tmux.conf", "~/.tmux.conf")
    spawner("touch ~/.tmux.conf.local")
  end

  # Get all plugins and symlink Vim config
  task :vim => "update:vim" do
    spawner("touch Vim/local.vim")
    sym("Vim/vimrc", "~/.vimrc")
    sym("Vim/gvimrc", "~/.gvimrc")
    sym("Vim", "~/.vim")
    spawner("mkdir -p ~/.vim/swapfiles/")
    spawner("mkdir -p ~/.vim/undodir/")
  end

  # Symlink Doom Emacs config
  task :emacs do
    spawner("mkdir -p Emacs/doom.d/snippets")
    sym("Emacs/doom.d", "~/.doom.d")
  end

  # Symlink zshrc
  task :zsh do
    spawner("mkdir -p ~/.zsh")
    sym("Zsh/autocomplete", "~/.zsh/autocomplete")
    sym("Zsh/zshrc", "~/.zshrc")
  end

  task :ghostty do
    spawner("mkdir -p ~/.config/ghostty")
    sym("Ghostty/config", "~/.config/ghostty/config")
  end

  task :all => [:bash, :clojure, :fonts, :git, :ruby, :nix, :haskell, :scala, :vim, :tmux, :ghostty, :zsh, "update:all"]

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
        fetch res, "Vim/#{res_name}/#{res["name"]}"
      end
    end
  end

  # Downlaod zhs resources
  task :zsh do
    resources["Zsh"]["autocomplete"].each do |ac|
      fetch ac, "Zsh/autocomplete/_#{ac["name"]}"
    end
    # rebuild the autocomplete cache
    spawner("rm -f ~/.zcompdump; compinit")
  end

  # update all
  task :all => [:git, :vim]
end


namespace :patch do
  task :openbsd do
    sym("Tmux/openbsd.tmux.conf", "~/.tmux.conf.local")
  end

  task :macos do
    sym("Zsh/macos.sh", "~/.zsh/platform.sh")
  end
end
