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

def symlink(src, dest)
  # TODO: check if present
  #File.symlink(src, dest)
end

task :install => "install:all"

namespace :install do
  task :bash do
    symlink("bashrc", "~/.bashrc")
  end

  task :fonts do
    resources["Fonts"].each do |font|
      dest = "Fonts/#{font["name"]}"
      puts "Downloading #{font["name"]}..."
      fetch font["uri"], dest
    end
    symlink("Fonts", "~/.fonts")
  end

  task :git do
    symlink("Git/gitignore", "~/.gitignore.global")
    symlink("Git/gitconfig", "~/.gitconfig")
  end

  task :ruby do
    symlink("gemrc", "~/.gemrc")
  end

  task :vim => "sync:vim" do
    symlink("Vim/vimrc", "~/.aimrc")
    symlink("Vim", "~/.aim")
  end

  task :zsh do
    # TODO: install oh-my-zsh & extra plugins
    symlink("zshrc", "~/.zshrc")
  end

  task :all => [:bash, :fonts, :git, :ruby, :vim, :zsh, "update:all"]

  # Extra stuff
  task :openbox do
    # TODO
  end

  task :xmodmap do
    symlink("Xmodmap", "~/.Xmodmap")
  end
end


task :update => "update:all"

namespace :sync do
  task :git do
    gitproc = Process.spawn('git submodule update --init')
    trap('INT') {
     Process.kill(gitproc, 9)
     exit 0
    }
    Process.wait(gitproc)
  end

  task :vim do
    resources["Vim"].each do |res_name, res_list|
      res_list.each do |res|
        dest = "Vim/#{res_name}/#{res["name"]}"
        puts "Downloading #{res["name"]}..."
        fetch res["uri"], dest
      end
    end
  end

  task :all => [:git, :vim]
end
